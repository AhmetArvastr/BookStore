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
    public partial class WebForm2 : System.Web.UI.Page
    {
        //CONNECTION PARAMETERS
        string kullanici = "";
        string sifre = "";
        SqlConnection url = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");
        SqlCommand cmd;
        String querysql="";
        protected void Page_Load(object sender, EventArgs e)
        {
            //VALIDATOR CSSS
            //RegularExpressionValidator2.ValidationExpression =
            HATA1.CssClass = "alert alert-success";
            EmailValidation.CssClass = "alert alert-danger";
            PasswordValidation.CssClass = "alert alert-danger";
            HATA1.Text = "Please enter your Email and Password";
        }

        //LOGIN WITH DATABASE
        protected void Giris_Click(object sender, EventArgs e)
        {
            try
            {
                kullanici = KullaniciEmail.Text;
                sifre = KullaniciSifre.Text;
                querysql = "SELECT * FROM Kullanicilar WHERE KullaniciEmail=@KullaniciEmail AND KullaniciSifre=@KullaniciSifre";
                cmd = new SqlCommand(querysql, url);
                cmd.Parameters.AddWithValue("@KullaniciEmail", kullanici);
                cmd.Parameters.AddWithValue("@KullaniciSifre", sifre);
                url.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["KullaniciID"] = dr["KullaniciID"].ToString();
                    Response.Redirect("Anasayfa.aspx");
                }
                else
                {
                    HATA1.CssClass = "alert alert-danger";
                    HATA1.Text = "Email veya Şifre hatalı";
                }
                dr.Close();
                url.Close();
                url.Dispose();
            }
            catch (Exception hatalar) { Response.Write(hatalar); }
        }

        //GO REISTER PAGE
        protected void KayitOl_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}