using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExpertSystem
{
    public partial class ConfidenceChoosing : Form
    {
        public string Selected;
        public ConfidenceChoosing(string fact)
        {
            InitializeComponent();
            fact_name.Text = fact;
        }

        private void ok_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.OK;
            Selected = (string)Confidence.SelectedItem;
            Close();
        }
    }
}
