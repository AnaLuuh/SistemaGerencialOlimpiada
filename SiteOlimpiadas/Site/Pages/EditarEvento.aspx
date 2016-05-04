<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="EditarEvento.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.EditarEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
    <link href="../Styles/cssDadosPessoais.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>
    <section id="sectionPage">
        <article id="articleCadastro">
            <section id="sectionTitle">
                Editar/Adicionar Evento
            </section>
            <section class="sectionTexto">
                Nome Evento
            </section>
            <section class="sectionControl">
                <asp:TextBox runat="server" ID="txtNomeEvento" CssClass="TextBox"></asp:TextBox>
            </section>
            <section class="sectionTexto">
                Modalidade
            </section>
            <section class="sectionControl">
                <asp:DropDownList runat="server" ID="ddlModalidade" CssClass="TextBox"></asp:DropDownList>
            </section>
            <section class="sectionTexto">
                Local
            </section>
            <section class="sectionControl">
                <asp:DropDownList runat="server" ID="ddlLocal" CssClass="TextBox"></asp:DropDownList>
            </section>
            <section class="sectionTexto">
                Data
            </section>
            <section class="sectionControl">
                <asp:TextBox runat="server" ID="txtData" CssClass="TextBox" TextMode="Date"></asp:TextBox>
            </section>
            <section class="sectionTexto">
                Horario
            </section>
            <section class="sectionControl">
                <asp:TextBox runat="server" ID="txtHorario" TextMode="Time" CssClass="TextBox"></asp:TextBox>
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
