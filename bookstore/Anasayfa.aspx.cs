using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace InternetProgramciligi2
{
    public partial class index : System.Web.UI.Page
    {

        //SQL CONNECTION PARAMETERS
        SqlConnection url = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand();
        //DataTable dt = new DataTable();
        String querysql = "";
        String imgfile = "";
        //String yazarID = "";
        //String arama = "";
        String kitapID = "";
        String deletecontrol = "";
        String updatecontrol = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            
            //GET QUERYSTRING PARAMETER
            kitapID = Request.QueryString["kitapid"];
            deletecontrol = Request.QueryString["sil"];
            updatecontrol = Request.QueryString["güncelleme"];
            SqlDataSource1.SelectCommand = "select b.ID,b.Title,b.Image,b.Price,a.Name,a.Country,a.Image from Books as b inner join KitaplarYazarlar as k on b.ID=k.BookID inner join Authors as a on a.ID=k.AuthorID";


            try
            {
                //DELETE BOOK
                if (deletecontrol == "aktif")
                {
                    url.Open();
                    querysql = "delete from Books  where ID=@ID";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@ID", kitapID);
                    cmd.ExecuteNonQuery();
                    url.Close();

                    url.Open();
                    querysql = "delete from KitaplarYazarlar where BookID=@BookID";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@BookID", kitapID);
                    cmd.ExecuteNonQuery();
                    url.Close();
                }
                if (kitapID != null)
                {
                    //CARD CONTROL
                    querysql = "select * from Sepet as s inner join Books as b on b.ID=s.KitapID where s.KullaniciID=@KullaniciID and s.KitapID=@kitapid";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@KullaniciID", Session["KullaniciID"]);
                    cmd.Parameters.AddWithValue("@kitapid", kitapID);
                    url.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (!dr.Read())
                    {
                        url.Close();

                        //BOOKS ADD TO CARD
                        url.Open();
                        querysql = "insert into Sepet (KitapID,KullaniciID) values (@idkitap,@idkullanici)";
                        cmd.Connection = url;
                        cmd.CommandText = querysql;
                        cmd.Parameters.AddWithValue("@idkitap", kitapID);
                        cmd.Parameters.AddWithValue("@idkullanici", Session["KullaniciID"]);
                        cmd.ExecuteNonQuery();
                        url.Close();
                    }
                    dr.Close();
                    url.Dispose();


                }
            }
            catch (Exception hatalar) { Response.Write(hatalar); }

            //GRIDVIEW VISIBLE PARAMETER
            GridView1.Visible = false;
        }

        protected void Guncelle_Click(object sender, EventArgs e)
        {
            SqlConnection url2 = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");

            //UPDATE BOOK
            if (updatecontrol == "aktif"&& DosyaYukle.PostedFile != null && Kitap.Text != null && Fiyat.Text != null)
            {
                imgfile = Path.GetFileName(DosyaYukle.PostedFile.FileName);
                DosyaYukle.SaveAs("E:/my folders/bnm/final_int2/InternetProgramciligi2/InternetProgramciligi2/Images/" + imgfile);
                url2.Open();
                querysql = "UPDATE Books SET  Title=@Title, Price=@Price, Image=@Image WHERE ID=@ID";
                cmd.Connection = url2;
                cmd.CommandText = querysql;
                cmd.Parameters.AddWithValue("@Title", Kitap.Text);
                cmd.Parameters.AddWithValue("@Price", Fiyat.Text);
                cmd.Parameters.AddWithValue("@Image", imgfile);
                cmd.Parameters.AddWithValue("@ID", kitapID);
                cmd.ExecuteNonQuery();
                url2.Close();
            }
        }
    }
}