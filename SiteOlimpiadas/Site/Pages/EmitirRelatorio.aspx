<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="EmitirRelatorio.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.EmitirRelatorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cssEmitirRelatorio.min.css" rel="stylesheet" />
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>

    <section id="sectionEmitir">
        <section id="sectionTitle">
            Emitir Relatório de Eventos
        </section>
        <section id="sectionSelect">
            <asp:DropDownList runat="server" ID="ddlEvento" CssClass="TextBox">
                <asp:ListItem Value="1" Text="Modalidade"></asp:ListItem>
                <asp:ListItem Value="2" Text="Data e Hora"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button runat="server" ID="btnFiltrar" Text="Filtrar" OnClick="btnFiltrar_Click" CssClass="Button" />
        </section>
        <asp:Repeater runat="server" ID="rptEventos">
            <ItemTemplate>
                <section class="sectionTitle">
                    <%# Eval("Modalidade") %>
                </section>
                <section id="sectionEvento">
                    <section id="sectionTitleEvento">
                        <div class="divTitle">
                        </div>
                        <div class="divTitle">
                            Local
                        </div>
                        <div class="divTitle">
                            Data
                        </div>
                        <div class="divTitle">
                            Horário
                        </div>
                    </section>
                    <section id="sectionDadosEvento">
                        <div class="divDados">
                            <%# Eval("Evento") %>
                        </div>
                        <div class="divDados">
                            <%# Eval("Local") %>
                        </div>
                        <div class="divDados">
                            <%# Eval("Data") %>
                        </div>
                        <div class="divDados">
                            <%# Eval("Horario") %>
                        </div>
                    </section>
                </section>
            </ItemTemplate>
        </asp:Repeater>
        <section id="sectionButton">
            <asp:Button runat="server" ID="btnEmitir" Text="Emitir" CssClass="Button" OnClick="btnEmitir_Click" />
        </section>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript" runat="server">
</asp:Content>
