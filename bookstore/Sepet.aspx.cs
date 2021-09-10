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
    public partial class Sepet : System.Web.UI.Page
    {

        //SQL CONNECTION PARAMETERS
        SqlConnection url = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");
        //SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand();
        //DataTable dt = new DataTable();
        String querysql = "";
        //String yazarID = "";
        String kitapID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //GET BOOK ID PARAMETER
            kitapID = Request.QueryString["kitapid"];

            //DATA SOURCE SQLCOMMAND  PARAMETER
            SqlDataSource1.SelectCommand = "select b.ID,b.Title,b.Image,b.Price,a.Name from Books as b inner join Sepet as s on b.ID=s.KitapID inner join KitaplarYazarlar as ky on ky.BookID=s.KitapID inner join Authors as a on a.ID=ky.AuthorID inner join Kullanicilar as kl on kl.KullaniciID=s.KullaniciID where kl.KullaniciID="+ Session["KullaniciID"];
            
            //LABEL ALERT PARAMETERS FOR SQL
            try
            {
                querysql = "select b.ID,b.Title,b.Image,b.Price,a.Name from Books as b inner join Sepet as s on b.ID=s.KitapID inner join KitaplarYazarlar as ky on ky.BookID=s.KitapID inner join Authors as a on a.ID=ky.AuthorID inner join Kullanicilar as kl on kl.KullaniciID=s.KullaniciID where kl.KullaniciID=@id";
                cmd.Connection = url;
                cmd.CommandText = querysql;
                cmd.Parameters.AddWithValue("@id", Session["KullaniciID"]);
                url.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    url.Close();
                    HATA1.CssClass = "alert alert-success";
                    HATA1.Text = "Kitaplarınız..........";
                }
                else {
                    HATA1.CssClass = "alert alert-danger";
                    HATA1.Text = "Henüz kitabınız yok...!";
                }
            } catch (Exception hatalar) {Response.Write(hatalar);}
                
            //DELETE BOOKS
            try
            {
                if (kitapID != null)
                {
                    url.Open();
                    querysql = "delete from Sepet  where KitapID=@KitapID";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@KitapID", kitapID);
                    cmd.ExecuteNonQuery();
                    url.Close();
                }
            }
            catch (Exception hatalar) { Response.Write(hatalar); }

            //VISIBLE GRIDVIEW PARAMETER
            GridView1.Visible = false;
        }
    }
}