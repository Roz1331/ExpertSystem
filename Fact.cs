using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpertSystem
{
    public class Fact
    {
        public ClipsFormsExample.FactType type;
        public int number;
        public int oppositeFactNull = 0;
        public string description;

        public Fact(ClipsFormsExample.FactType t, int n, string d, int o = 0)
        {
            type = t;
            number = n;
            oppositeFactNull = o;
            description = d;
        }

        public static bool operator ==(Fact a, Fact b)
        => a.number == b.number;

        public static bool operator !=(Fact a, Fact b)
        => a.number != b.number;
    }
}
