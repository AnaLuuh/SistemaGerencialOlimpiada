<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="ComprarIngresso.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.ComprarIngresso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cssComprarIngresso.min.css" rel="stylesheet" />
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>
    <section id="sectionComprar">
        <section id="sectionTitle">
            Selecione o evento
        </section>
        <section id="sectionSelect">
            <asp:DropDownList runat="server" ID="ddlEvento" CssClass="TextBox">
            </asp:DropDownList>
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click" CssClass="Button" />
        </section>
        <section id="sectionDescricao">
            <asp:Label runat="server" ID="lblDescricao"></asp:Label>
        </section>
        <section id="sectionButton">
            <asp:Button runat="server" ID="btnComprar" Text="Comprar" CssClass="Button" OnClick="btnComprar_Click" />
        </section>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript" runat="server">
</asp:Content>
