using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace InternetProgramciligi2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //VALIDATOR PARAMETERS
            NameValidation.CssClass = "alert alert-danger";
            SurnameValidation.CssClass = "alert alert-danger";
            EmailValidation.CssClass = "alert alert-danger";
            EmailValidation2.CssClass = "alert alert-danger";
            PasswordValidation.CssClass = "alert alert-danger";
        }

        protected void Kayit_Click(object sender, EventArgs e)
        {
            //ADD REGİSTER TO DATABASE 
            if (KullaniciAdi.Text != "" &&KullaniciSoyadi.Text != "" &&KullaniciEmail.Text != "" && KullaniciSifre.Text != "")
            {
                try
                {
                    SqlConnection url = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");
                    url.Open();
                    SqlCommand cmd = new SqlCommand(@"insert into Kullanicilar (KullaniciAdi,KullaniciSoyadi,KullaniciEmail,KullaniciSifre) values (@adi,@soyadi,@email,@sifre)", url);
                    cmd.Parameters.AddWithValue("adi", KullaniciAdi.Text);
                    cmd.Parameters.AddWithValue("soyadi", KullaniciSoyadi.Text);
                    cmd.Parameters.AddWithValue("email", KullaniciEmail.Text);
                    cmd.Parameters.AddWithValue("sifre", KullaniciSifre.Text);
                    cmd.ExecuteNonQuery();
                    url.Close();
                    Response.Redirect("Giris.aspx");
                }
                catch (Exception hatalar) { Response.Write(hatalar); }
            }
            else {
                NameValidation.ErrorMessage = "Lüten Tüm Alanları Eksiksiz Doldurunuz";
            }
        }

        protected void Giris_Click(object sender, EventArgs e)
        {
            Response.Redirect("Giris.aspx");
        }
    }
}