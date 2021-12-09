using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using CLIPSNET;


namespace ExpertSystem
{
    public partial class ClipsFormsExample : Form
    {
        public enum FactType
        {
            initial,
            alcohol,
            budget,
            location,
            company,
            final,
            opposite,
            intermediate
        }

        List<Fact> initialFacts = new List<Fact>();
        List<Fact> initialAlcoholFacts = new List<Fact>();
        List<Fact> initialBudgetFacts = new List<Fact>();
        List<Fact> initialLocationFacts = new List<Fact>();
        List<Fact> initialCompanyFacts = new List<Fact>();
        List<Fact> initialNegativeFacts = new List<Fact>();
        List<Fact> finalFacts = new List<Fact>();
        List<Rule> all_rules = new List<Rule>();

        private CLIPSNET.Environment clips = new CLIPSNET.Environment();
        /// <summary>
        /// Распознаватель речи
        /// </summary>
        private Microsoft.Speech.Synthesis.SpeechSynthesizer synth;
        
        /// <summary>
        /// Распознавалка
        /// </summary>
        private Microsoft.Speech.Recognition.SpeechRecognitionEngine recogn;

        public ClipsFormsExample()
        {
            InitializeComponent();
            //synth = new Microsoft.Speech.Synthesis.SpeechSynthesizer();
            //synth.SetOutputToDefaultAudioDevice();

            //var voices = synth.GetInstalledVoices(System.Globalization.CultureInfo.GetCultureInfoByIetfLanguageTag("ru-RU"));
            //foreach (var v in voices)
            //    voicesBox.Items.Add(v.VoiceInfo.Name);
            //if (voicesBox.Items.Count > 0)
            //{
            //    voicesBox.SelectedIndex = 0;
            //    synth.SelectVoice(voices[0].VoiceInfo.Name);
            //}

            //var RecognizerInfo = Microsoft.Speech.Recognition.SpeechRecognitionEngine.InstalledRecognizers().Where(ri => ri.Culture.Name == "ru-RU").FirstOrDefault();
            //recogn = new Microsoft.Speech.Recognition.SpeechRecognitionEngine(RecognizerInfo);
            //recogn.SpeechRecognized += Recogn_SpeechRecognized;
            //recogn.SetInputToDefaultAudioDevice();
        }

        private void NewRecognPhrases(List<string> phrases)
        {
            outputBox.Text += "Стартуем распознавание" + System.Environment.NewLine;
            var Choises = new Microsoft.Speech.Recognition.Choices();
            Choises.Add(phrases.ToArray());

            var gb = new Microsoft.Speech.Recognition.GrammarBuilder();
            var RecognizerInfo = Microsoft.Speech.Recognition.SpeechRecognitionEngine.InstalledRecognizers().Where(ri => ri.Culture.Name == "ru-RU").FirstOrDefault();
            gb.Culture = RecognizerInfo.Culture;
            gb.Append(Choises);

            var gr = new Microsoft.Speech.Recognition.Grammar(gb);
            recogn.LoadGrammar(gr);
            recogn.RequestRecognizerUpdate();
            recogn.RecognizeAsync(Microsoft.Speech.Recognition.RecognizeMode.Multiple);
        }

        private void Recogn_SpeechRecognized(object sender, Microsoft.Speech.Recognition.SpeechRecognizedEventArgs e)
        {
            recogn.RecognizeAsyncStop();
            recogn.RecognizeAsyncCancel();
            outputBox.Text += "Ваш голос распознан!" + System.Environment.NewLine;
            clips.Eval("(assert (answer " + e.Result.Text + "))");
            clips.Eval("(assert (clearmessage))");
            outputBox.Text += "Продолжаю выполнение!" + System.Environment.NewLine;
            clips.Run();
            HandleResponse();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        private void HandleResponse()
        {
            //  Вытаскиаваем факт из ЭС
            String evalStr = "(find-fact ((?f ioproxy)) TRUE)";
            FactAddressValue fv = (FactAddressValue)((MultifieldValue)clips.Eval(evalStr))[0];

            MultifieldValue damf = (MultifieldValue)fv["messages"];
            MultifieldValue vamf = (MultifieldValue)fv["answers"];

            outputBox.Text += "Новая итерация : " + System.Environment.NewLine;
            for (int i = 0; i < damf.Count; i++)
            {
                LexemeValue da = (LexemeValue)damf[i];
                byte[] bytes = Encoding.Default.GetBytes(da.Value);
                string message = Encoding.UTF8.GetString(bytes);
                //synth.SpeakAsync(message);
                if (message.StartsWith("ну_вот"))
                {
                    var result = MessageBox.Show("Мы вам подобрали бары. Годится?", "Q&A", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question);
                    if (result == DialogResult.Yes || result == DialogResult.No)
                    {
                        string gOOd = result == DialogResult.Yes ? "Классно_здорово_суперски" : "Неклассно_нездорово_несуперски";
                        clips.Eval($"(assert(barParam(param { gOOd })))");
                        outputBox.Text += "Добавлен факт: " + gOOd + System.Environment.NewLine;
                    }
                }
                else if (message.EndsWith("Бары_подобраны") || message.EndsWith("Что-то_пошло_не_так"))
                {
                    outputBox.Text += message + System.Environment.NewLine;
                    nextButton.Enabled = false;
                }
                else outputBox.Text += message + System.Environment.NewLine;
            }

            var phrases = new List<string>();
            if (vamf.Count > 0)
            {
                outputBox.Text += "----------------------------------------------------" + System.Environment.NewLine;
                for (int i = 0; i < vamf.Count; i++)
                {
                    //  Варианты !!!!!
                    LexemeValue va = (LexemeValue)vamf[i];
                    byte[] bytes = Encoding.Default.GetBytes(va.Value);
                    string message = Encoding.UTF8.GetString(bytes);
                    phrases.Add(message);
                    outputBox.Text += "Добавлен вариант для распознавания " + message + System.Environment.NewLine;
                }
            }

            if (vamf.Count == 0)
                clips.Eval("(assert (clearmessage))");
        }

        private void nextBtn_Click(object sender, EventArgs e)
        {
            clips.Run();
            HandleResponse();
        }

        private void resetBtn_Click(object sender, EventArgs e)
        {
            nextButton.Enabled = true;
            outputBox.Text = "Выполнены команды Clear и Reset." + System.Environment.NewLine;
            //  Здесь сохранение в файл, и потом инициализация через него
            clips.Clear();

            /*string stroka = codeBox.Text;
            System.IO.File.WriteAllText("tmp.clp", codeBox.Text);
            clips.Load("tmp.clp");*/

            //  Так тоже можно - без промежуточного вывода в файл
            clips.LoadFromString(codeBox.Text);

            clips.Reset();
        }

        private void openFile_Click(object sender, EventArgs e)
        {
            if (clipsOpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                if (codeBox.Text.Length == 0)
                {
                    Parser.ParseFactsAndRules("..\\..\\facts_rules_final.txt", ref initialFacts, ref initialAlcoholFacts, ref initialBudgetFacts,
                    ref initialLocationFacts, ref initialCompanyFacts, ref initialNegativeFacts, ref finalFacts, ref all_rules);

                    DisplayAllFacts();

                    Parser.ParseRule("test.txt", all_rules);
                }
                string filePath = clipsOpenFileDialog.FileName;
                codeBox.Text += System.IO.File.ReadAllText(filePath);

                Text = "Экспертная система \"Помощник в выборе бара\" – " + filePath;                
            }
        }

        private void fontSelect_Click(object sender, EventArgs e)
        {
            if (fontDialog1.ShowDialog() == DialogResult.OK)
            {
                codeBox.Font = fontDialog1.Font;
                outputBox.Font = fontDialog1.Font;
            }
        }

        private void saveAsButton_Click(object sender, EventArgs e)
        {
            clipsSaveFileDialog.FileName = clipsOpenFileDialog.FileName;
            if (clipsSaveFileDialog.ShowDialog() == DialogResult.OK)
            {
                System.IO.File.WriteAllText(clipsSaveFileDialog.FileName, codeBox.Text);
            }
        }

        void DisplayAllFacts()
        {
            DisplayFacts(locationFacts_chbx, initialLocationFacts);
            DisplayFacts(alcoholFacts_chbx, initialAlcoholFacts);
            DisplayFacts(budgetFacts_chbx, initialBudgetFacts);
            DisplayFacts(companyFacts_chbx, initialCompanyFacts);
            DisplayFacts(initialFacts_chbx, initialFacts);
        }

        void DisplayFacts(CheckedListBox chlb, List<Fact> factsList) => chlb.Items.AddRange(factsList.Select(x => x.description).ToArray());

        private void chbx_SelectedIndexChanged(object sender, EventArgs e)
        {
            locationFacts_chbx.ClearSelected();
            alcoholFacts_chbx.ClearSelected();
            budgetFacts_chbx.ClearSelected();
            companyFacts_chbx.ClearSelected();
            initialFacts_chbx.ClearSelected();
        }

        private void fixFacts_Click(object sender, EventArgs e)
        {
            List<CheckedListBox> chlbList = new List<CheckedListBox>();
            chlbList.Add(locationFacts_chbx);
            chlbList.Add(alcoholFacts_chbx);
            chlbList.Add(budgetFacts_chbx);
            chlbList.Add(companyFacts_chbx);

            outputBox.Text += "Добавленные факты:\r\n";
            foreach (CheckedListBox chlb in chlbList)
            {
                foreach(var selectedFact in chlb.CheckedItems)
                {
                    string str = selectedFact.ToString().Replace(' ', '_').Replace("\"", "");
                    outputBox.Text += str + "\r\n";
                    clips.Eval($"(assert(barParam(param {str})))");
                }
            }
            for (int i = 0; i < initialFacts_chbx.Items.Count; i++)
            {
                if (initialFacts_chbx.GetItemChecked(i))
                {
                    string str = initialFacts[i].description.Replace(' ', '_').Replace("\"", "");
                    outputBox.Text += str + "\r\n";
                    clips.Eval($"(assert(barParam(param {str})))");
                }
                else
                {
                    string str = initialNegativeFacts[i].description.Replace(' ', '_').Replace("\"", "");
                    outputBox.Text += str + "\r\n";
                    clips.Eval($"(assert(barParam(param {str})))");
                }
            }
        }
    }
}
