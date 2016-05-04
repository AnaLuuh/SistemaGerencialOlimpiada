<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.Eventos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cssEventos.min.css" rel="stylesheet" />
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <section id="sectionTotal">
        <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>
        <section id="sectionAdicionar">
            <asp:LinkButton runat="server" ID="lnkAdicionar" Text="Adicionar Evento" OnClick="lnkAdicionar_Click" CssClass="Link"></asp:LinkButton>
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
                        <div class="divDados">
                            <asp:LinkButton runat="server" ID="lnkEditar" Text="Editar" CommandArgument='<%# Eval("ID") %>' CssClass="Link" OnCommand="lnkEditar_Command"></asp:LinkButton>
                            &nbsp&nbsp
                            <asp:LinkButton runat="server" ID="lnkExcluir" Text="Excluir" CommandArgument='<%# Eval("ID") %>' CssClass="Link" OnCommand="lnkExcluir_Command"></asp:LinkButton>
                        </div>
                    </section>
                </section>
            </ItemTemplate>
        </asp:Repeater>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript" runat="server">
</asp:Content>
