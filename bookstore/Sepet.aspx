<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="InternetProgramciligi2.Sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
        <!--DATASOURCE AND GRIDVIEW -->
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:baglantikutuphane %>"></asp:SqlDataSource>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        </Columns>
    </asp:GridView>
    <br />

    <!-- SHOPPING CARD -->
   <div class="container">
   <div class="card shopping-cart">
            <div class="card-header bg-dark text-light">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                Alış Veriş Kartı
                <a href="index.aspx" class="btn btn-outline-info btn-sm pull-right">Alış Verişe Devam Et</a>
                <div class="clearfix"></div>
            </div>
            <div class="card-body">
                <!-- GRID VIEW PARAMETERS -->
                    <%    for (int rows = 0; rows < GridView1.Rows.Count; rows++)
                        {
                            int kitapID= 0;
                            int kitapAdi = 1;
                            int kitapResim = 2;
                            int KitapFiyat = 3;
                            int yazarAdi = 4;
                    %>
                    <!-- PRODUCT AND GET GRIDVIEW CELLS -->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-2 text-center">
                                <img class="img-responsive" src="Images/<%=GridView1.Rows[rows].Cells[kitapResim].Text%>" alt="prewiew" width="120" height="80">
                        </div>
                        <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                            <h4 class="product-name"><strong> <%=GridView1.Rows[rows].Cells[kitapAdi].Text%></strong></h4>
                            <h4>
                                <small><%=GridView1.Rows[rows].Cells[yazarAdi].Text%></small>
                            </h4>
                        </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                <h6><strong><%=GridView1.Rows[rows].Cells[KitapFiyat].Text%><span class="text-muted">x</span></strong></h6>
                            </div>
                            <div class="col-4 col-sm-4 col-md-4">
                                <div class="quantity">
                                    <input type="button" value="+" class="plus">
                                    <input type="number" step="1" max="99" min="1" value="1" title="Qty" class="qty" size="4">
                                    <input type="button" value="-" class="minus">
                                </div>
                            </div>
                            <div class="col-2 col-sm-2 col-md-2 text-right">
                               <div class="btn btn-outline-danger btn-xs">
                                    <a href="Sepet.aspx?kitapid=<%=GridView1.Rows[rows].Cells[kitapID].Text%>">
                                    <i class="fa fa-trash fa-3x" aria-hidden="true"></i></a></div>
                                
                            </div>
                        </div>
                    </div>
                    <hr>
                        <% } %>
                         <asp:Label ID="HATA1" runat="server"></asp:Label>
                    <!-- END PRODUCT -->
                   
                <div class="pull-right">
                    <a href="" class="btn btn-outline-secondary pull-right">
                        Alışveriş kartını güncelle
                    </a>
                </div>
            </div>
       <!-- CARD FOOTER -->
            <div class="card-footer">
                <div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
                    <div class="row">
                        <div class="col-6">
                            <input type="text" class="form-control" placeholder="Kupon Kodu">
                        </div>
                        <div class="col-6">
                            <input type="submit" class="btn btn-default" value="Kupon kullan">
                        </div>
                    </div>
                </div>
                <div class="pull-right" style="margin: 10px">
                    <a href="" class="btn btn-success pull-right">Ödeme</a>
                    <div class="pull-right" style="margin: 5px">
                        Toplam fiyat: <b>50.00€</b>
                    </div>
                </div>
            </div>
        </div>
</div>
</asp:Content>
