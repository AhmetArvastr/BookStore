<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="InternetProgramciligi2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="assets/css/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/css/noscript.css" /></noscript>
	<link rel="stylesheet" type="text/css" href="assets/css/style.css"/>
	<link href='http://fonts.googleapis.com/css?family=Comfortaa' rel='stylesheet' type='text/css'/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--FORM OBJECTS -->
    <form id="form1" method="post">
        <div>
            <asp:TextBox ID="KullaniciAdi" runat="server" placeholder="Adınızı Giriniz"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="NameValidation" runat="server" ErrorMessage="Ad boş bırakılamaz" ControlToValidate="KullaniciAdi" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="KullaniciSoyadi" runat="server" placeholder="Soyadınızı Giriniz"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="SurnameValidation" runat="server" ErrorMessage="Soyad boş bırakılamaz" ControlToValidate="KullaniciSoyadi" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="KullaniciEmail" runat="server" placeholder="Email Giriniz"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="EmailValidation" runat="server" ErrorMessage="Epostanız Standartlar dışındadır" ControlToValidate="KullaniciEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="EmailValidation2" runat="server" ErrorMessage="Eposta boş bırakılamaz" ControlToValidate="KullaniciEmail" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox ID="KullaniciSifre" runat="server" placeholder="Şifrenizi Giriniz" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:RequiredFieldValidator ID="PasswordValidation" runat="server" ErrorMessage="Şifre Boş bırakılamaz" ControlToValidate="KullaniciSifre" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="Giris" runat="server" Text="Giriş Yap" OnClick="Giris_Click" />
            <asp:Button ID="Kayit" runat="server" Text="Kayıt Ol" OnClick="Kayit_Click" />
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
