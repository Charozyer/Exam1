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
    public partial class Menu : Form
    {
        Model1 db = new Model1();
        public Menu()
        {
            InitializeComponent();
        }

        private void Menu_Load(object sender, EventArgs e)
        {
            driverBindingSource.DataSource = db.Driver.ToList();
            licenceBindingSource.DataSource = db.Licence.ToList();
            vehicleBindingSource.DataSource = db.Vehicle.ToList();
        }

        private void Menu_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void backButton_Click(object sender, EventArgs e)
        {
            Auth auth = new Auth();
            auth.Show();
            this.Hide();
        }

        private void addButton_Click(object sender, EventArgs e)
        {
            addEditForm frm = new addEditForm();
            frm.driv = null;
            DialogResult dr = frm.ShowDialog();
            if(dr == DialogResult.OK)
            {
                driverBindingSource.DataSource = null;
                driverBindingSource.DataSource = db.Users.ToList();
            }
        }

        private void editButton_Click(object sender, EventArgs e)
        {
            Driver driv = (Driver)driverBindingSource.Current;
            addEditForm frm = new addEditForm();
            frm.driv = driv;
            DialogResult dr = frm.ShowDialog();
            if(dr == DialogResult.OK)
            {
                driverBindingSource.DataSource = null;
                driverBindingSource.DataSource = db.Driver.ToList();
            }
        }

        private void delButton_Click(object sender, EventArgs e)
        {
            Driver driv = (Driver)driverBindingSource.Current;
            DialogResult dr = MessageBox.Show("Удалить водителя "+ driv.DriverName+"?","Удаление водителя",MessageBoxButtons.YesNo);
            if(dr == DialogResult.Yes)
            {
                db.Driver.Remove(driv);
                try
                {
                    db.SaveChanges();
                    driverBindingSource.DataSource = db.Driver.ToList();
                }
                catch(Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }
        private void dataGridView1_CurrentCellChanged(object sender, EventArgs e)
        {

        }

        private void sortName_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                driverBindingSource.DataSource = db.Driver.OrderByDescending(x => x.DriverName).ToList();
            }
            else
            {
                driverBindingSource.DataSource = db.Driver.OrderBy(x => x.DriverName).ToList();
            }
            
        }

        private void sortComp_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                driverBindingSource.DataSource = db.Driver.OrderByDescending(x => x.Company).ToList();
            }
            else
            {
                driverBindingSource.DataSource = db.Driver.OrderBy(x => x.Company).ToList();
            }
        }

        private void sortID_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                driverBindingSource.DataSource = db.Driver.OrderByDescending(x => x.DriverId).ToList();
            }
            else
            {
                driverBindingSource.DataSource = db.Driver.OrderBy(x => x.DriverId).ToList();
            }
        }

        private void sortReset_Click(object sender, EventArgs e)
        {
            driverBindingSource.DataSource = db.Driver.ToList();
        }
    }
}
