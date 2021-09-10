<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="KitapEkle.aspx.cs" Inherits="InternetProgramciligi2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/css/noscript.css" /></noscript>
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
	<link href='http://fonts.googleapis.com/css?family=Comfortaa' rel='stylesheet' type='text/css'>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--FORM OBJECTS -->
	 <form id="form1" method="post">
        <div>
         <asp:TextBox ID="Yazar" runat="server" placeholder="Yazarın Adı"></asp:TextBox><br />
         <asp:TextBox ID="Ulke" runat="server" placeholder="Yazarın Ülkesi"></asp:TextBox><br />
            <asp:FileUpload ID="DosyaYukle2" runat="server" /><br />
         <asp:TextBox ID="Kitap" runat="server" placeholder="Kitabın İsmi"></asp:TextBox><br />
         <asp:TextBox ID="Fiyat" runat="server" placeholder="Kitabın Fiyatı" TextMode="Number"></asp:TextBox><br /><br />
         <asp:FileUpload ID="DosyaYukle" runat="server" /><br /><br />
         <asp:Button ID="EKLE" runat="server" Text="Ekle" OnClick="EKLE_Click" />
            <asp:Label ID="mesage" runat="server" Text="Kitap Ekleyin...."></asp:Label>
        </div>
    </form>

    <!--JAVA SCRIPTS -->
     <script src="assets/css/js/jquery.min.js"></script>
			<script src="assets/css/js/jquery.dropotron.min.js"></script>
			<script src="assets/css/js/jquery.scrolly.min.js"></script>
			<script src="assets/css/js/jquery.scrollex.min.js"></script>
			<script src="assets/css/js/browser.min.js"></script>
			<script src="assets/css/js/breakpoints.min.js"></script>
			<script src="assets/css/js/util.js"></script>
			<script src="assets/css/js/main.js"></script>

</asp:Content>
