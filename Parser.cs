using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace ExpertSystem
{
    public class Parser
    {
        static List<Fact> allFacts = new List<Fact>();

        public static void ParseFactsAndRules(string path, ref List<Fact> initialFacts, ref List<Fact> initialAlcoholFacts,
            ref List<Fact> initialBudgetFacts, ref List<Fact> initialLocationFacts, ref List<Fact> initialCompanyFacts,
            ref List<Fact> initialNegativeFacts, ref List<Fact> finalFacts, ref List<Rule> all_rules)
        {
            string[] fileText = File.ReadAllLines(path);
            foreach (string line in fileText)
            {
                if (line.Length == 0)
                    continue;
                string[] splited = line.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
                if (splited[0][0] == 'f') // facts
                {
                    string[] fact_splites = splited[0].Split(new[] { '-' }, StringSplitOptions.RemoveEmptyEntries);
                    string item_type = fact_splites[0];
                    //Fact fact = ParseFact(splited[0], splited[1]);
                    Fact fact = ParseFact(splited[0], splited[1]);
                    allFacts.Add(fact);
                    switch (item_type)
                    {
                        case "fi": // initial fact
                            initialFacts.Add(fact);
                            break;
                        case "fia": // initial alcohol fact
                            initialAlcoholFacts.Add(fact);
                            break;
                        case "fib": // initial budget fact
                            initialBudgetFacts.Add(fact);
                            break;
                        case "fil": // initial location fact
                            initialLocationFacts.Add(fact);
                            break;
                        case "fic": // initial company fact
                            initialCompanyFacts.Add(fact);
                            break;
                        case "fn": // initial negative fact
                            initialNegativeFacts.Add(fact);
                            break;
                        case "ff": // final fact
                            finalFacts.Add(fact);
                            break;
                            //case "f": // intermediate facts
                            //    intermediateFacts.Add(ParseFact(splited[0], splited[1]));
                            //    break;
                    }
                }
                else if (splited[0][0] == 'r') // rules
                {
                    string[] rule_splites = splited[0].Split(new[] { '-' }, StringSplitOptions.RemoveEmptyEntries);
                    Rule rule = new Rule();
                    rule.number = int.Parse(rule_splites[1]);
                    rule.premises = getPremises(splited[1]);
                    rule.conclusion = ParseFact(splited[2]);
                    rule.description = splited[3];
                    all_rules.Add(rule);
                }
            }
        }
        static Fact ParseFact(string str, string desc = "")
        {
            string[] facts_rulles_splites = str.Split(new[] { '-' }, StringSplitOptions.RemoveEmptyEntries);
            string item_type = facts_rulles_splites[0];
            string item_id = facts_rulles_splites[1];
            string item_opposite_id = "0";
            string item_description = desc.Length == 0 ? allFacts.Where(x => x.number == int.Parse(item_id)).FirstOrDefault().description : desc;
            if (facts_rulles_splites.Length == 3)
            {
                item_opposite_id = facts_rulles_splites[2];
            }
            switch (item_type)
            {
                case "fi": // initial fact
                    return new Fact(ClipsFormsExample.FactType.initial, int.Parse(item_id), item_description);
                case "fia": // initial alcohol fact
                    return new Fact(ClipsFormsExample.FactType.alcohol, int.Parse(item_id), item_description);
                case "fib": // initial budget fact
                    return new Fact(ClipsFormsExample.FactType.budget, int.Parse(item_id), item_description);
                case "fil": // initial location fact
                    return new Fact(ClipsFormsExample.FactType.location, int.Parse(item_id), item_description);
                case "fic": // initial company fact
                    return new Fact(ClipsFormsExample.FactType.company, int.Parse(item_id), item_description);
                case "fn": // initial negative fact
                    return new Fact(ClipsFormsExample.FactType.opposite, int.Parse(item_id), item_description, int.Parse(item_opposite_id));
                case "ff": // final fact
                    return new Fact(ClipsFormsExample.FactType.final, int.Parse(item_id), item_description);
                case "f": // intermediate facts
                    return new Fact(ClipsFormsExample.FactType.intermediate, int.Parse(item_id), item_description);
            }
            return new Fact(ClipsFormsExample.FactType.intermediate, int.Parse(item_id), item_description);
        }

        static List<Fact> getPremises(string str)
        {
            List<Fact> res = new List<Fact>();

            string[] splited = str.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string s in splited)
            {
                res.Add(ParseFact(s));
            }

            return res;
        }


        public static void ParseRule(string tmpFilePath, List<Rule> all_rulles)
        {
            foreach (Rule rule in all_rulles)
            {
                string ruleText = $"(defrule {rule.description.Replace(' ', '_')}\n(declare(salience 40))\r\n";
                string minString = "";
                int index = 0;
                Random rand = new Random();
                double minCoef = 0.7;
                double maxCoef = 1.0;
                foreach (Fact premise in rule.premises)
                {
                    minString += " ?c" + (++index).ToString();
                    ruleText += $"(barParam(param {premise.description.Replace(' ', '_')})(confidence ?c{index}))\r\n"; // добавили поле для коэф уверенности
                }
                // задаем случайное число для коэффициента уверенности правила
                // рассматриваем число double только с 2 цифрами после запятой
                string rule_coef = Math.Round(minCoef + rand.NextDouble() * (maxCoef - minCoef), 2).ToString().Replace(",",".");

                if(rule.premises.Count == 1)
                    ruleText += "=>\r\n" +
                    $"(assert(barParam(param {rule.conclusion.description.Replace(' ', '_')})(confidence (* {rule_coef} ?c1))))\r\n" +
                    $"(assert(appendmessagehalt (str-cat \"{rule.description}(\"(* {rule_coef} ?c1)\")\"))))\r\n\r\n";
                else
                    ruleText += "=>\r\n" +
                    $"(assert(barParam(param {rule.conclusion.description.Replace(' ', '_')})(confidence (* {rule_coef} (min{minString})))))\r\n" +
                    $"(assert(appendmessagehalt (str-cat \"{rule.description}(\"(* {rule_coef} (min{minString}))\")\"))))\r\n\r\n";

                // writing to file
                using (StreamWriter sw = File.AppendText(tmpFilePath))
                {
                    sw.WriteLine(ruleText);
                }
            }
        }

        static void ConcatFiles(string pathFrom, string pathTo)
        {
            string text = "";
            using (StreamReader sr = File.OpenText(pathFrom))
            {
                string s = "";
                while ((s = sr.ReadLine()) != null)
                {
                    text += s;
                }
            }

            using (StreamWriter sw = File.AppendText(pathTo))
            {
                sw.WriteLine(";========================================================");
                sw.WriteLine(text);
            }
        }
    }
}
