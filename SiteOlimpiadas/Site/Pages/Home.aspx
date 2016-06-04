<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/cssHome.min.css" rel="stylesheet" />
    <link href="../Geral/UserControls/cssErro.min.css" rel="stylesheet" />
    <style>
        #img {
            width: 80%;
            margin-left: 5%;
            height: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <section id="sectionHome">
        <asp:PlaceHolder runat="server" ID="placeholder"></asp:PlaceHolder>

        <section id="sectionDados">
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
                                <asp:LinkButton runat="server" ID="lnkVerDetahes" Text="Ver" CommandArgument='<%# Eval("ID") %>' CssClass="Link" OnCommand="lnkVerDetahes_Command"></asp:LinkButton>
                            </div>
                        </section>
                    </section>
                </ItemTemplate>
            </asp:Repeater>
            <div style="float: left; width: 100%; margin-top: 15px; font-weight: bold; font-size: 25px; text-align: center">
                Sua localização
            </div>
            <div id="mapholder" style="float: left; width: 100%; text-align: center; margin-top: 15px"></div>
            <div style="float: left; width: 100%; margin-top: 15px; font-weight: bold; font-size: 25px; text-align: center">
                Sobre Belo Horizonte
            </div>
            <div style="float: left; width: 90%; margin-left: 5%; margin-top: 5px; font-weight: bold; font-size: 25px">
                Hotéis
            </div>
            <ul style="list-style: none; float: left; width: 90%; margin-left: 5%">
                <asp:Repeater runat="server" ID="rptHoteis">
                    <ItemTemplate>
                        <li>
                            <asp:LinkButton runat="server" ID="lnkCidade" CommandArgument='<%# Eval("ID") %>' CssClass="Link" OnCommand="lnkCidade_Command"> - <%# Eval("Nome") %></asp:LinkButton>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div style="float: left; width: 90%; margin-left: 5%; margin-top: 5px; font-weight: bold; font-size: 25px">
                Restaurantes
            </div>
            <ul style="list-style: none; float: left; width: 90%; margin-left: 5%">
                <asp:Repeater runat="server" ID="rptRestaurantes">
                    <ItemTemplate>
                        <li>
                            <asp:LinkButton runat="server" ID="lnlRest" CommandArgument='<%# Eval("ID") %>' CssClass="Link" OnCommand="lnlRest_Command"> - <%# Eval("Nome") %></asp:LinkButton>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <div style="float: left; width: 90%; margin-left: 5%; margin-top: 5px; font-weight: bold; font-size: 25px">
                Pontos Turísticos
            </div>
            <ul style="list-style: none; float: left; width: 90%; margin-left: 5%">
                <asp:Repeater runat="server" ID="rptPontos">
                    <ItemTemplate>
                        <li>
                            <asp:LinkButton runat="server" ID="lnlPontos" CommandArgument='<%# Eval("ID") %>' CssClass="Link" OnCommand="lnlPontos_Command"> - <%# Eval("Nome") %></asp:LinkButton>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </section>
    </section>

    <script>

        (function () {
            getLocation();
        })();

        var x = document.getElementById("demo");
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            }
            else { x.innerHTML = "Geolocation is not supported by this browser."; }
        }

        function showPosition(position) {
            var latlon = position.coords.latitude + "," + position.coords.longitude;

            var img_url = "http://maps.googleapis.com/maps/api/staticmap?center="
            + latlon + "&zoom=15&size=400x300&sensor=false";
            document.getElementById("mapholder").innerHTML = "<img id='img' src='" + img_url + "'>";
        }

        function showError(error) {
            switch (error.code) {
                case error.PERMISSION_DENIED:
                    x.innerHTML = "User denied the request for Geolocation."
                    break;
                case error.POSITION_UNAVAILABLE:
                    x.innerHTML = "Location information is unavailable."
                    break;
                case error.TIMEOUT:
                    x.innerHTML = "The request to get user location timed out."
                    break;
                case error.UNKNOWN_ERROR:
                    x.innerHTML = "An unknown error occurred."
                    break;
            }
        }
    </script>
</asp:Content>
