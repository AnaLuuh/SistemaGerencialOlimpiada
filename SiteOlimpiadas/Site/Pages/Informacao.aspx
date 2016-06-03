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
            height: 300px;
            border-radius: 10px;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #map {
            float: left;
            width: 500px;
            height: 500px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Conteudo" runat="server">
    <div id="divTotal">
        <asp:HiddenField runat="server" ID="hdfLat" />
        <asp:HiddenField runat="server" ID="hdfLon" />

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

        (function () {
            //alert("ok");
            //var lati = document.getElementById("hdfLat").value;
            //var long = document.getElementById("hdfLon").value;
            //alert(lati);
            //alert(long);
            initMap();
        })();

        var map;
        function initMap() {

            //var lati = document.getElementById("hdfLat").value;
            //var long = document.getElementById("hdfLon").value;

            //alert(lati);
            //alert(long);

            map = new google.maps.Map(document.getElementById('map'), {
                //center: { lat: parseFloat(lati), lng: parseFloat(long) },
                center: { lat:"-19,93418", lng: "-43,936762" },
                zoom: 8
            });
        }

    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCvF4jMcvyqNAW1UXOKYi_LcL_Rhxoaavg&callback=initMap">
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Javascript" runat="server">
</asp:Content>
