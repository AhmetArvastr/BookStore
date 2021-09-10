<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="InternetProgramciligi2.WebForm2" %>
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
            <h1>Giriş yap</h1>
    <asp:TextBox ID="KullaniciEmail" runat="server" placeholder="Email Giriniz"></asp:TextBox>
    <asp:TextBox ID="KullaniciSifre" runat="server" placeholder="Şifrenizi Giriniz" TextMode="Password"></asp:TextBox>
    <asp:Label ID="HATA1" runat="server" Text="" CssClass="alert alert-danger"></asp:Label><br /><br />
            <asp:RequiredFieldValidator ID="EmailValidation" runat="server" ErrorMessage="Email Boş bırakılamaz" ControlToValidate="KullaniciEmail" SetFocusOnError="True"></asp:RequiredFieldValidator><br /><br />
            <asp:RequiredFieldValidator ID="PasswordValidation" runat="server" ErrorMessage="Şifre Boş bırakılamaz" SetFocusOnError="True" ControlToValidate="KullaniciSifre"></asp:RequiredFieldValidator><br />
            <br/>
    <asp:Button ID="Button1" runat="server" OnClick="Giris_Click" Text="Giriş" />
    <asp:Button ID="Button2" runat="server" OnClick="KayitOl_Click" Text="Kayıt Ol" />
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
