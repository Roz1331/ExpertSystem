using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpertSystem
{
    public class Rule
    {
        public int number;
        public List<Fact> premises = new List<Fact>();
        public Fact conclusion;
        public string description;

        public Rule(int n, List<Fact> p, Fact c, string d)
        {
            number = n;
            foreach (Fact f in p)
                premises.Add(f);
            conclusion = c;
            description = d;
        }

        public Rule()
        {
            number = 0;
            conclusion = null;
            description = "";
        }
    }
}
