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
    public partial class WebForm1 : System.Web.UI.Page
    {
        //DATABASE CONNECTION PARAMETERS
        SqlConnection url = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand();
        DataTable dt = new DataTable();
        String querysql = "";
        String imgfile = "";
        String yazarID = "";
        String kitapID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            mesage.CssClass = "alert alert-success";
        }

        protected void EKLE_Click(object sender, EventArgs e)
        {
            try
            {
                //AUTHOR CONTROL
                querysql = "select * from Authors where name=@name";
                da = new SqlDataAdapter(querysql, url);
                da.SelectCommand.Parameters.Add("@name", SqlDbType.VarChar, 70);
                da.SelectCommand.Parameters["@name"].Value = Yazar.Text;
                DataTable dt = new DataTable();
                da.Fill(dt);

                // ADD AUTHORS
                if (dt.Rows.Count == 0 && DosyaYukle2.PostedFile != null && Yazar.Text != null && Ulke.Text != null)
                {
                    imgfile = Path.GetFileName(DosyaYukle2.PostedFile.FileName);
                    DosyaYukle2.SaveAs("C:/Users/OĞUZHAN/Desktop/final_int2/InternetProgramciligi2/InternetProgramciligi2/Images/" + imgfile);
                    url.Open();
                    querysql = "insert into Authors (Name,Country,Image) values (@name,@country,@image)";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@name", Yazar.Text);
                    cmd.Parameters.AddWithValue("@country", Ulke.Text);
                    cmd.Parameters.AddWithValue("@image", imgfile);
                    cmd.ExecuteNonQuery();
                    url.Close();

                    //GET AUTHORS ID TO VARIABLE
                    url.Open();
                    querysql = "select*from Authors where Name='" + Yazar.Text + "'";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        yazarID = dr["ID"].ToString();
                    }
                    url.Close();
                }
                else if (dt.Rows != null && DosyaYukle2.PostedFile != null && Yazar.Text != null && Ulke.Text != null)
                {

                    //GET AUTHORS ID TO VARIABLE
                    url.Open();
                    querysql = "select*from Authors where Name='" + Yazar.Text + "'";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        yazarID = dr["ID"].ToString();
                    }
                    url.Close();
                }
            }
            catch (Exception hatalar) { Response.Write(hatalar); }

            //ADD BOOKS 
            try
            {
                if (DosyaYukle.PostedFile != null &&Kitap.Text !=null &&Fiyat.Text!=null)
                {

                    imgfile = Path.GetFileName(DosyaYukle.PostedFile.FileName);
                    DosyaYukle.SaveAs("C:/Users/OĞUZHAN/Desktop/final_int2/InternetProgramciligi2/InternetProgramciligi2/Images/" + imgfile);
                    url.Open();
                    querysql = "insert into Books (Title,Image,Price) values (@title,@image,@price)";
                    cmd = new SqlCommand(querysql, url);
                    cmd.Parameters.AddWithValue("@title", Kitap.Text);
                    cmd.Parameters.AddWithValue("@image", imgfile);
                    cmd.Parameters.AddWithValue("@price", Fiyat.Text);
                    cmd.ExecuteNonQuery();
                    mesage.CssClass = "alert alert-success";
                    mesage.Text = "Resimler ve Kitap bilgileri başarı ile eklendi";
                    url.Close();

                    //GET KİTAP ID TO VARIABLE
                    url.Open();
                    querysql = "select * from Books where ID=(SELECT MAX(ID)FROM Books) and Title='" + Kitap.Text + "'";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.ExecuteNonQuery();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        kitapID = dr["ID"].ToString();
                    }
                    url.Close();
                }
                else
                {
                    mesage.CssClass = "alert alert-danger";
                    mesage.Text = "kitap id eklenmedi!";
                }
            }
            catch (Exception hatalar) { Response.Write(hatalar); }

            //ADD BOOKS ID AND AUTHORS ID TO DATABASE
            try
            {
                if (yazarID != null && kitapID != null)
                {
                    int kitap = Convert.ToInt32(kitapID);
                    int yazar = Convert.ToInt32(yazarID);
                    url.Open();
                    querysql = "insert into KitaplarYazarlar (BookID,AuthorID) values (@bookid,@authorid)";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@bookid", kitap);
                    cmd.Parameters.AddWithValue("@authorid", yazar);
                    cmd.ExecuteNonQuery();
                    url.Close();

                }
                else { mesage.Text="ID ekleme hatası!"; }

            }
            catch (Exception hatalar) { Response.Write(hatalar); }
        }
    }
}