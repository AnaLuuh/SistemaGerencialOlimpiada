<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="Ajuda.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.Ajuda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cssAjuda.min.css" rel="stylesheet" />
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <section id="sectionAjuda">
        <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>
        <asp:Repeater runat="server" ID="rptLinks">
            <ItemTemplate>
                <section id="sectionLinks">
                    <asp:LinkButton runat="server" ID="lnkAjudaLogin" Text='<%# Eval("Texto") %>' CommandArgument='<%# Eval("ID") %>' CssClass="Link" OnCommand="lnkAjudaLogin_Command"></asp:LinkButton>
                </section>
            </ItemTemplate>
        </asp:Repeater>

        <section id="sectionLoginPopUp" style="display: none" runat="server">
            <section id="sectionModal" style="background:#eee">
                <section id="sectionFechar">
                    <asp:LinkButton runat="server" ID="lnkFechar" Text="Fechar" OnClientClick="$('#sectionLoginPopUp').css('display', 'none'); return false;" CssClass="Link"></asp:LinkButton>
                </section>
                <section id="sectionDescricao">
                    <asp:Label runat="server" ID="lblDescricao"></asp:Label>
                </section>
            </section>
        </section>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript" runat="server">
</asp:Content>
