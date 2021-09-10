<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="InternetProgramciligi2.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="latest-products">
      <div class="container">
        <div class="row">
            <!-- DATASOURCE1 --> 
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:baglantikutuphane %>" OldValuesParameterFormatString="original_{0}"/>
    </asp:SqlDataSource>
   
            <!-- GRIDVIEW WITH DATASOURCE1 --> 
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
        </Columns>
    </asp:GridView>

            <!-- UPDATE PARAMETERS -->
            <%String updatecontrol = Request.QueryString["güncelleme"];
                Kitap.Text = Request.QueryString["kitapadi"];
                Fiyat.Text = Request.QueryString["kitapfiyat"];

                if (Session["KullaniciID"].Equals("1")&&updatecontrol == "aktif")
                {

                %>

            <!--FORM OBJECTS -->
	 <form id="form1" method="post">
        <div>
         <asp:TextBox ID="Kitap" runat="server" placeholder="Kitabın İsmi"></asp:TextBox><br />
         <asp:TextBox ID="Fiyat" runat="server" placeholder="Kitabın Fiyatı" TextMode="Number"></asp:TextBox><br /><br />
         <asp:FileUpload ID="DosyaYukle" runat="server" /><br /><br />
         <asp:Button ID="Guncelle" runat="server" Text="Güncelle" OnClick="Guncelle_Click" />
         <asp:Literal ID="mesage" runat="server"></asp:Literal>
        </div>
    </form><br />

            <% }%>
            <!-- UPDATE PARAMETERS END -->
            <br />
            <!-- GRIDVIEW CELLS PARAMETERS --> 
             <%    for (int rows = 0; rows < GridView1.Rows.Count; rows++)
    {
        int kitapID = 0;
        int kitapAdi = 1;
        int kitapResim = 2;
        int kitapFiyat = 3;
        int yazarAdi = 4;
        //int yazarUlke = 5;
        //int yazarResim = 6;
                    %>

            <!-- PUSHING GRIDVIEW CELLS --> 
          <div class="col-md-4">
            <div class="product-item">
              <a href="#"><img src="Images/<%=GridView1.Rows[rows].Cells[kitapResim].Text%>" alt=""></a>
              <div class="down-content">

                <a href="#"><h4><%=GridView1.Rows[rows].Cells[kitapAdi].Text%></h4></a>
                <h6><br /><%=GridView1.Rows[rows].Cells[kitapFiyat].Text%></h6>
                <p><%=GridView1.Rows[rows].Cells[yazarAdi].Text%></p>
                  
                  <!-- BOOOK STARS --> 
                <ul class="stars">
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                  <li><i class="fa fa-star"></i></li>
                </ul>
                  <!-- DELETE BUTTON --> 
               <%
                    if (Session["KullaniciID"].Equals("1")){ %>
                  <div class="col-2 col-sm-2 col-md-2 text-right">
                               <div class="btn btn-outline-danger btn-xs">
                                    <a href="?kitapid=<%=GridView1.Rows[rows].Cells[kitapID].Text%>&sil=aktif">
                                    <i class="fa fa-trash fa-3x" aria-hidden="true"></i></a>
                               </div>
                 </div>
               <% } %>
                  <br />
                  <!-- UPDATE BUTTON --> 
               <%
                    if (Session["KullaniciID"].Equals("1")){ %>
                  <div class="col-2 col-sm-2 col-md-2 text-right">
                               <div class="btn btn-outline-danger btn-xs">
                                    <a href="?kitapid=<%=GridView1.Rows[rows].Cells[kitapID].Text%>&kitapadi=<%=GridView1.Rows[rows].Cells[kitapAdi].Text%>&kitapfiyat=<%=GridView1.Rows[rows].Cells[kitapFiyat].Text%>&güncelleme=aktif">
                                    <i class="fa fa-refresh fa-3x" aria-hidden="true"></i></a>
                               </div>
                 </div>
               <% } %>

              <%
                 if (Session["KullaniciID"].Equals("2"))
                 { %>
                  <a href="Giris.aspx"><span>Satın Almak İçin üye ol.</span></a>
                  <% }
                 
                  else if (Session["KullaniciID"].Equals("1")||!Session["KullaniciID"].Equals("1")&&!Session["KullaniciID"].Equals("2"))
                 { %>

                  <!-- ADD TO CARD LINK --> 
                <a href="?kitapid=<%=GridView1.Rows[rows].Cells[kitapID].Text%>&kitapadi=<%=GridView1.Rows[rows].Cells[kitapAdi].Text%>&kitapfiyat=<%=GridView1.Rows[rows].Cells[kitapFiyat].Text%>&yazaradi=<%=GridView1.Rows[rows].Cells[yazarAdi].Text%>"><span>+Sepete Ekle</span></a>
                              
                  <%} %> 

              </div>
            </div>
          </div

        <% } %>

            </div>
          </div>
        </div>

            <!-- DENEME KISMI.... -->
    <div class="call-to-action">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="inner-content">
              <div class="row">
                <div class="col-md-8">
                  <h4>Creative &amp; Unique <em>Sixteen</em> Products</h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque corporis amet elite author nulla.</p>
                </div>
                <div class="col-md-4">
                  <a href="#" class="filled-button">Purchase Now</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</asp:Content>
