﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HASTANEeee
{
    public partial class HastaGirişi : Form
    {
        public HastaGirişi()
        {
            InitializeComponent();
        }


        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-0M417A5;Initial Catalog=hastane4;Integrated Security=True");
        public static SqlDataReader read;
        public static SqlDataReader read2;
        SqlConnection baglanti2 = new SqlConnection("Data Source=DESKTOP-0M417A5;Initial Catalog=hastane4;Integrated Security=True");



        private void button1_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            SqlCommand komut = new SqlCommand("select * from hastalar where TC like '" + textBox1.Text + "'", baglanti);

            read = komut.ExecuteReader();


            if (read.Read())
            {
                read.Close();
                baglanti2.Open();
                SqlCommand komut2 = new SqlCommand("select * from hastalar where Parola like '" + textBox9.Text + "'", baglanti2);
                read2 = komut2.ExecuteReader();
                if (read2.Read())
                {
                    formlar.formRandevuAl.Show();
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

        private void button2_Click(object sender, EventArgs e)
        {
            formlar.formKayıtOl.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            formlar.formSayfa.Show();
            this.Hide();    
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

            if (checkBox1.CheckState == CheckState.Checked)
            {
                textBox9.UseSystemPasswordChar = true;
            }
            else if (checkBox1.CheckState == CheckState.Unchecked)
            {
                textBox9.UseSystemPasswordChar = false;
            }
        }

        private void HastaGirişi_Load(object sender, EventArgs e)
        {

        }
    }
}
