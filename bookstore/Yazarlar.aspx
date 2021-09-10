<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Yazarlar.aspx.cs" Inherits="InternetProgramciligi2.Yazarlar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
        </Columns>
    </asp:GridView>

                        <!-- UPDATE PARAMETERS -->
            <%String updatecontrol = Request.QueryString["guncelleme"];
               YazarAdi.Text = Request.QueryString["yazaradi"];
               YazarUlke.Text = Request.QueryString["yazarulke"];

                    if (Session["KullaniciID"].Equals("1")&&updatecontrol == "aktif")
                {

                %>

            <!--FORM OBJECTS -->
	 <form id="form1" method="post">
        <div>
         <asp:TextBox ID="YazarAdi" runat="server" placeholder="Yazarın Adı"></asp:TextBox><br />
         <asp:TextBox ID="YazarUlke" runat="server" placeholder="Yazarın Ülkesi"></asp:TextBox><br /><br />
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
                     int yazarID = 0;
                     int yazarAdi = 1;
                     int yazarUlke = 2;
                     int yazarResim = 3;
                    %>

            <!-- PUSHING GRIDVIEW CELLS --> 
          <div class="col-md-4">
            <div class="product-item">
              <a href="#"><img src="Images/<%=GridView1.Rows[rows].Cells[yazarResim].Text%>" alt=""></a>
              <div class="down-content">

                <a href="#"><h4><%=GridView1.Rows[rows].Cells[yazarAdi].Text%></h4></a>
                  <br />
                <p><%=GridView1.Rows[rows].Cells[yazarUlke].Text%></p>
                  
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
                if (Session["KullaniciID"].Equals("1"))
                { %>
                  <div class="col-2 col-sm-2 col-md-2 text-right">
                               <div class="btn btn-outline-danger btn-xs">
                                    <a href="?yazarid=<%=GridView1.Rows[rows].Cells[yazarID].Text%>&sil=aktif">
                                    <i class="fa fa-trash fa-3x" aria-hidden="true"></i></a>
                               </div>
                 </div>
               <% } %>
                  <br />

                                    <!-- UPDATE BUTTON --> 
               <%
                if (Session["KullaniciID"].Equals("1"))
                { %>
                  <div class="col-2 col-sm-2 col-md-2 text-right">
                               <div class="btn btn-outline-danger btn-xs">
                                    <a href="?yazarid=<%=GridView1.Rows[rows].Cells[yazarID].Text%>&yazaradi=<%=GridView1.Rows[rows].Cells[yazarAdi].Text%>&yazarulke=<%=GridView1.Rows[rows].Cells[yazarUlke].Text%>&yazarresim=<%=GridView1.Rows[rows].Cells[yazarResim].Text%>&guncelleme=aktif">
                                    <i class="fa fa-refresh fa-3x" aria-hidden="true"></i></a>
                               </div>
                 </div>
               <% } %>

              </div>
            </div>
          </div>
            <% } %>

            </div>
          </div>
        </div>

</asp:Content>
