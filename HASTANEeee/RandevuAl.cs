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

namespace HASTANEeee
{
    public partial class RandevuAl : Form
    {
        public RandevuAl()
        {
            InitializeComponent();
        }

        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-0M417A5;Initial Catalog=hastane4;Integrated Security=True");
        SqlCommand komut;
        SqlDataAdapter da;

        void RandevuBilgiGetir()
        {
            baglanti = new SqlConnection("Data Source=DESKTOP-0M417A5;Initial Catalog=hastane4;Integrated Security=True");
            baglanti.Open();
            da = new SqlDataAdapter("SELECT * from alınanRandevular;", baglanti);
            DataTable tablo = new DataTable();
            da.Fill(tablo);
            dataGridView2.DataSource = tablo;
            baglanti.Close();
        }
        private void RandevuAl_Load(object sender, EventArgs e)
        {
            // TODO: Bu kod satırı 'ds_tabloilişkilendirme.doktorlar' tablosuna veri yükler. Bunu gerektiği şekilde taşıyabilir, veya kaldırabilirsiniz.
            this.doktorlarTableAdapter.Fill(this.ds_tabloilişkilendirme.doktorlar);
            // TODO: Bu kod satırı 'ds_tabloilişkilendirme.poliklinikler' tablosuna veri yükler. Bunu gerektiği şekilde taşıyabilir, veya kaldırabilirsiniz.
            this.polikliniklerTableAdapter.Fill(this.ds_tabloilişkilendirme.poliklinikler);

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox4.Text = dataGridView2.CurrentRow.Cells[0].Value.ToString();
            textBox3.Text = dataGridView2.CurrentRow.Cells[1].Value.ToString();
            comboBox6.Text = dataGridView2.CurrentRow.Cells[2].Value.ToString();
            comboBox5.Text = dataGridView2.CurrentRow.Cells[3].Value.ToString();
            dateTimePicker2.Text = dataGridView2.CurrentRow.Cells[4].Value.ToString();
            comboBox4.Text = dataGridView2.CurrentRow.Cells[5].Value.ToString();
        }

        private void button6_Click(object sender, EventArgs e) //RANDEVU AL
        {
            string sorgu = "insert into alınanRandevular(TC,poliklinikAdi,DoktorAdi,Tarih,Saat)  values(@TC,@poliklinikAdi,@DoktorAdi,@Tarih,@Saat)";
            komut = new SqlCommand(sorgu, baglanti);
            komut.Parameters.AddWithValue("@TC", Convert.ToString(textBox3.Text));
            komut.Parameters.AddWithValue("PoliklinikAdi", comboBox6.Text);
            komut.Parameters.AddWithValue("@DoktorAdi", comboBox5.Text);
            komut.Parameters.AddWithValue("@Tarih", dateTimePicker2.Text);
            komut.Parameters.AddWithValue("@Saat", comboBox4.Text);
            baglanti.Open();
            komut.ExecuteNonQuery();
            MessageBox.Show("Başarıyla Eklendi");
            baglanti.Close();
            RandevuBilgiGetir();
        }

        private void button5_Click(object sender, EventArgs e) //RANDEVU İPTAL
        {
            string sorgu = "delete from alınanRandevular where randevuID = @RandevuID";
            komut = new SqlCommand(sorgu, baglanti);
            komut.Parameters.AddWithValue("@RandevuID", textBox4.Text);
            baglanti.Open();
            komut.ExecuteNonQuery();
            MessageBox.Show("Başarıyla Silindi");
            baglanti.Close();
            RandevuBilgiGetir();

        }

        private void button4_Click(object sender, EventArgs e) //GERİ
        {
            formlar.formHastaGirişi.Show();
            this.Hide();
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void comboBox6_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {

        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView2_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            textBox4.Text = dataGridView2.CurrentRow.Cells[0].Value.ToString();
        }
    }
}
