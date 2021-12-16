
namespace ExpertSystem
{
    partial class ConfidenceChoosing
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label2 = new System.Windows.Forms.Label();
            this.fact_name = new System.Windows.Forms.Label();
            this.Confidence = new System.Windows.Forms.CheckedListBox();
            this.ok = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(12, 34);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(285, 17);
            this.label2.TabIndex = 8;
            this.label2.Text = "Выберете коэффициент уверенности для";
            // 
            // fact_name
            // 
            this.fact_name.AutoSize = true;
            this.fact_name.Location = new System.Drawing.Point(12, 61);
            this.fact_name.Name = "fact_name";
            this.fact_name.Size = new System.Drawing.Size(74, 17);
            this.fact_name.TabIndex = 9;
            this.fact_name.Text = "fact_name";
            this.fact_name.UseMnemonic = false;
            // 
            // Confidence
            // 
            this.Confidence.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.Confidence.CheckOnClick = true;
            this.Confidence.FormattingEnabled = true;
            this.Confidence.Items.AddRange(new object[] {
            "0,1",
            "0,2",
            "0,3",
            "0,4",
            "0,5",
            "0,6",
            "0,7",
            "0,8",
            "0,9",
            "1,0"});
            this.Confidence.Location = new System.Drawing.Point(15, 100);
            this.Confidence.Name = "Confidence";
            this.Confidence.Size = new System.Drawing.Size(123, 170);
            this.Confidence.TabIndex = 10;
            this.Confidence.Tag = "уверенность";
            // 
            // ok
            // 
            this.ok.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.ok.Location = new System.Drawing.Point(195, 239);
            this.ok.Name = "ok";
            this.ok.Size = new System.Drawing.Size(97, 31);
            this.ok.TabIndex = 11;
            this.ok.Text = "ОК";
            this.ok.UseVisualStyleBackColor = true;
            this.ok.Click += new System.EventHandler(this.ok_Click);
            // 
            // ConfidenceChoosing
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(304, 283);
            this.Controls.Add(this.ok);
            this.Controls.Add(this.Confidence);
            this.Controls.Add(this.fact_name);
            this.Controls.Add(this.label2);
            this.Name = "ConfidenceChoosing";
            this.Text = "ConfidenceChoosing";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label fact_name;
        private System.Windows.Forms.CheckedListBox Confidence;
        private System.Windows.Forms.Button ok;
    }
}