<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="DadosPessoais.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.DadosPessoais" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cssDadosPessoais.min.css" rel="stylesheet" />
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>
    <asp:ScriptManager runat="server" ID="script" EnablePageMethods="true"></asp:ScriptManager>
    <section id="sectionPage">
        <article id="articleCadastro">
            <section id="sectionTitle">
                Editar Dados Pessoais
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
                <asp:TextBox runat="server" ID="txtDataNasc" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
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
                <asp:TextBox runat="server" ID="txtNumero" CssClass="TextBox" ClientIDMode="Static"></asp:TextBox>
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
            
            <section id="sectionSucesso">
                <asp:Label runat="server" ID="lblSucesso"></asp:Label>
            </section>
            <section class="sectionControl">
                <asp:Button runat="server" ID="btnSalvar" CssClass="Button" OnClick="btnSalvar_Click" Text="Salvar" />
            </section>
        </article>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript" runat="server">
</asp:Content>
