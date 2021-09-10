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
    public partial class Yazarlar : System.Web.UI.Page
    {
        //SQL CONNECTION PARAMETERS
        SqlConnection url = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");
        SqlDataAdapter da;
        SqlCommand cmd = new SqlCommand();
        //DataTable dt = new DataTable();
        String imgfile = "";
        String querysql = "";
        String yazarID = "";
        String deletecontrol = "";
        String updatecontrol = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //GET QUERYSTRING PARAMETERS
            yazarID = Request.QueryString["yazarid"];
            deletecontrol = Request.QueryString["sil"];
            updatecontrol = Request.QueryString["guncelleme"];
            SqlDataSource1.SelectCommand = "select*from Authors";
            
            //GRIDVIEW VISIBLE PARAMETER
            GridView1.Visible = false;

            try
            {
                //DELETE AUTHOR
                if (deletecontrol == "aktif")
                {
                    url.Open();
                    querysql = "delete from Authors  where ID=@ID";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@ID", yazarID);
                    cmd.ExecuteNonQuery();
                    url.Close();

                    url.Open();
                    querysql = "delete from KitaplarYazarlar where AuthorID=@AuthorID";
                    cmd.Connection = url;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@AuthorID", yazarID);
                    cmd.ExecuteNonQuery();
                    url.Close();
                }
            }
            catch(Exception Hatalar){ Response.Write(Hatalar); }
        }

        protected void Guncelle_Click(object sender, EventArgs e)
        {
            SqlConnection url2 = new SqlConnection(@"Data Source=DESKTOP-HN5H1NM; Initial Catalog=kütüphane; User ID=root; Password=1234");
            try
            {
                //UPDATE AUTHORS
                if (updatecontrol == "aktif" && DosyaYukle.PostedFile != null && YazarAdi != null && YazarUlke.Text != null)
                {
                    imgfile = Path.GetFileName(DosyaYukle.PostedFile.FileName);
                    DosyaYukle.SaveAs("C:/Users/OĞUZHAN/Desktop/final_int2/InternetProgramciligi2/InternetProgramciligi2/Images/" + imgfile);
                    url2.Open();
                    querysql = "UPDATE Authors SET  Name=@Name, Country=@Country, Image=@Image WHERE ID=@ID";
                    cmd.Connection = url2;
                    cmd.CommandText = querysql;
                    cmd.Parameters.AddWithValue("@Name", YazarAdi.Text);
                    cmd.Parameters.AddWithValue("@Country", YazarUlke.Text);
                    cmd.Parameters.AddWithValue("@Image", imgfile);
                    cmd.Parameters.AddWithValue("@ID", yazarID);
                    cmd.ExecuteNonQuery();
                    url2.Close();
                }
            }
            catch (Exception Hatalar) { Response.Write(Hatalar); }
        }


    }
}