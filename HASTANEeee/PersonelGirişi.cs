using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace HASTANEeee
{
    public partial class PersonelGirişi : Form
    {
        public PersonelGirişi()
        {
            InitializeComponent();
        }

        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-0M417A5;Initial Catalog=hastane4;Integrated Security=True");
        public static SqlDataReader read;
        SqlConnection baglanti2 = new SqlConnection("Data Source=DESKTOP-0M417A5;Initial Catalog=hastane4;Integrated Security=True");

        private void button1_Click(object sender, EventArgs e) //Giriş Yap
        {
            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from Personeller where personelID like '" + textBox1.Text + "'", baglanti);

            read = komut.ExecuteReader();
            

            if (read.Read())
            { 
                //baglanti.Close();
                read.Close();
                
                SqlDataReader read2;
                baglanti2.Open();
                SqlCommand komut2 = new SqlCommand("select * from Personeller where parola like '" + textBox2.Text + "'", baglanti2);
                read2 = komut2.ExecuteReader();

                if (read2.Read())
                {
                    formlar.formPersonelGirişEkranı.Show();
                    this.Hide();
                }

                else
                {
                    MessageBox.Show("Kullanıcı adı veya şifre yanlış. Tekrar deneyiniz.");
                }
               baglanti2.Close();              
            }

            else
            {
                 MessageBox.Show("Kullanıcı adı veya şifre yanlış. Tekrar deneyiniz.");
            }
             
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e) //Geri
        {
            formlar.formSayfa.Show();
            this.Hide();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.CheckState == CheckState.Checked)
            {
                textBox2.UseSystemPasswordChar = true;
                
            }
            else if (checkBox1.CheckState == CheckState.Unchecked)
            {
                textBox2.UseSystemPasswordChar = false;
                
            }
        }

        private void checkBox1_CheckedChanged_1(object sender, EventArgs e)
        {
            if (checkBox1.CheckState == CheckState.Checked)
            {
                textBox2.UseSystemPasswordChar = true;                
            }
            else if (checkBox1.CheckState == CheckState.Unchecked)
            {
                textBox2.UseSystemPasswordChar = false;              
            }
        }

        private void PersonelGirişi_Load(object sender, EventArgs e)
        {

        }
    }
}
