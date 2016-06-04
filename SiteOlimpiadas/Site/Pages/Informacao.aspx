<%@ Page Title="" Language="C#" MasterPageFile="~/Site/Master/Site.Master" AutoEventWireup="true" CodeBehind="Informacao.aspx.cs" Inherits="SiteOlimpiadas.Site.Pages.Informacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style>
        #divImagem {
            float: left;
            width: 90%;
            margin-left: 5%;
            margin-top: 15px;
        }

        .Imagem {
            width: 50%;
            height: 340px;
            border-radius: 10px;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #map {
            float: left;
            width: 90%;
            margin-left: 5%;
            height: 350px;
            margin-top: 15px;
            padding-bottom: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <div id="divTotal" style="width: 100%; height: auto; padding-bottom: 100px; float: left">
        <asp:HiddenField runat="server" ID="hdfLat" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdfDesc" ClientIDMode="Static" />
        <asp:HiddenField runat="server" ID="hdfLon" ClientIDMode="Static" />

        <div id="divTitle" style="float: left; width: 90%; margin-left: 5%; margin-top: 15px; font-size: 25px; font-weight: bold;">
            <asp:Label runat="server" ID="lbLTitulo"></asp:Label>
        </div>
        <div id="divImagem">
            <asp:Image runat="server" ID="imgInfo" CssClass="Imagem" />
        </div>
        <div id="divdescricao" style="float: left; width: 90%; margin-left: 5%; margin-top: 15px">
            <asp:Label runat="server" ID="lblDescricao"></asp:Label>
        </div>
        <div id="divLocalizacao" style="float: left; width: 90%; margin-left: 5%; margin-top: 15px; font-size: 25px; font-weight: bold;">
            Localização
        </div>
        <div id="map"></div>
    </div>
    <script type="text/javascript">

        var map;
        var marker;
        function initMap() {

            var lati = document.getElementById("hdfLat").value;
            var long = document.getElementById("hdfLon").value;
            var desc = document.getElementById("hdfDesc").value;

            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: parseFloat(lati), lng: parseFloat(long) },
                zoom: 20
            });

            marker = new google.maps.Marker({
                position: new google.maps.LatLng(parseFloat(lati), parseFloat(long)),
                title: desc,
                map: map,
                icon: '/Imagens/marcador.png'
            });

            var infowindow = new google.maps.InfoWindow(), marker;

            google.maps.event.addListener(marker, 'click', (function (marker, i) {
                return function () {
                    infowindow.setContent(desc);
                    infowindow.open(map, marker);
                }
            })(marker))
        }

    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvF4jMcvyqNAW1UXOKYi_LcL_Rhxoaavg&callback=initMap">
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript" runat="server">
</asp:Content>
