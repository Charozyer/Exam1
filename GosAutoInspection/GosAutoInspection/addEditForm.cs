using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GosAutoInspection
{
    public partial class addEditForm : Form
    {
        public Model1 db { get; set; }
        public Driver driv { get; set; } = null;
        public addEditForm()
        {
            InitializeComponent();
        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            DialogResult = DialogResult.Cancel;
        }

        private void saveButton_Click(object sender, EventArgs e)
        {
            if(driv == null)
            {
                driv = (Driver)driverBindingSource.Current;
                db.Driver.Add(driv);
            }
            try
            {
                db.SaveChanges();
                DialogResult = DialogResult.OK;
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void addEditForm_Load(object sender, EventArgs e)
        {
            if(driv == null)
            {
                driverBindingSource.AddNew();
                label1.Text = "Добавление нового водителя";
            }
            else
            {
                driverBindingSource.Add(driv);
                label1.Text = "Изменение водителя";
            }
        }
    }
}
