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
    public partial class Auth : Form
    {
        Model1 db = new Model1();
        public static Users USER { get; set; }
        byte tries = 3;
        byte seconds = 60;
        public Auth()
        {
            InitializeComponent();
        }

        private void exitButton_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void enterButton_Click(object sender, EventArgs e)
        {
            if(textBox1.Text == "" || textBox2.Text == "") { label5.Text = "Введите данные в поля!"; return; }
            else
            {
                Users usr = db.Users.Find(textBox1.Text);
                if ((usr != null) && (usr.Pass == textBox2.Text))
                {
                    USER = usr;
                    if(usr.RoleId == 1)
                    {
                        Menu menu = new Menu();
                        menu.Show();
                        this.Hide();
                    }
                }
                else
                {
                    tries -= 1;
                    label5.Text = "Неправильный логин или пароль" + "\n" + "Попыток осталось: " + tries;
                    textBox2.Text = "";
                    if (tries < 1)
                    {
                        block.Enabled = true;
                        sec.Enabled = true;
                        textBox1.Text = "";
                        textBox1.Enabled = false;
                        textBox2.Enabled = false;
                        enterButton.Enabled = false;                      
                    }
                }
            }
        }

        private void Auth_Load(object sender, EventArgs e)
        {
            tries = 3;
            textBox1.Text = "";
            textBox2.Text = "";
            label5.Text = "";
        }
        private void block_Tick(object sender, EventArgs e)  // таймер на 1 мин для включения и выключения блокировки
        {

            sec.Enabled = false;      // отключает секундный таймер
            label5.Text = "";    // очищает поле ошибки
            textBox1.Enabled = true;
            textBox2.Enabled = true;
            enterButton.Enabled = true;  // разблокирывает поля и кнопку
            tries = 3;  // востанавливает кол-во попыток
            seconds = 60;  // востанавливает кол-во времени до разблокировки (на будущее)
            block.Enabled = false;  // выключает секундный таймер 
        }
        private void sec_Tick(object sender, EventArgs e)
        {
            seconds -= 1;   // от переменной отнимаем 1 каждый раз как срабатывает счетчик

            label5.Text = "     Превышен лимит попыток." +
                     "\n" + "Пароль был сброшен" + "\n" + "До разблокировки осталось " + seconds + " сек";
            // выводим сообщение об ошибке(блокировки) со значением оставшегося времени
        }
    }
}
