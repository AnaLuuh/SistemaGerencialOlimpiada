<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.Cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro</title>
    <link href="../Styles/cssCadastro.min.css" rel="stylesheet" />
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>
        <asp:ScriptManager runat="server" ID="script" EnablePageMethods="true"></asp:ScriptManager>
        <section id="sectionPage">
            <section id="sectionHeader">
                <section id="sectionLogo"></section>
            </section>
            <article id="articleCadastro">
                <section id="sectionTitle">
                    Cadastre-se
                </section>
                <section class="sectionTexto">
                    Nome
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtNome" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    CPF
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtCPF" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Data Nascimento
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtDataNasc" TextMode="Date" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Logradouro
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtLogradouro" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Numero
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtNumero" CssClass="TextBox" TextMode="Number" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Bairro
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtBairro" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Cidade
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtCidade" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    UF
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtUF" CssClass="TextBox" ClientIDMode="Static" MaxLength="2"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Email
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Senha
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtSenha" CssClass="TextBox" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                </section>
                <section class="sectionTexto">
                    Confirme a senha
                </section>
                <section class="sectionControl">
                    <asp:TextBox runat="server" ID="txtConfirmeSenha" CssClass="TextBox" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                </section>

                <section id="sectionSucesso">
                    <asp:Label runat="server" ID="lblSucesso"></asp:Label>
                </section>
                <section class="sectionControl">
                    <asp:Button runat="server" ID="btnCadastrar" CssClass="Button" OnClick="btnCadastrar_Click" Text="Cadastrar" />
                </section>
            </article>
        </section>
    </form>
</body>
</html>
