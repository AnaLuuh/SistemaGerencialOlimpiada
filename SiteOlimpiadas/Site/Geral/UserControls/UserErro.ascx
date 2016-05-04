<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserErro.ascx.cs" Inherits="SiteOlimpiadas.Site.Geral.UserControls.UserErro" %>

<section class="sectionOuterErro" style="z-index: 2">
    <section class="sectionInnerErro">
        <section class="sectionIconeErro">
        </section>
        <header class="sectionTituloErro" style="font-weight: 100">
            <asp:Label runat="server" ID="lblTituloErro"></asp:Label>
        </header>
        <section class="sectionTextoErro" style="font-weight: 100">
            <asp:Label runat="server" ID="lblErro"></asp:Label>
        </section>
        <footer class="footerErro">
            <asp:Button runat="server" ID="btnOK" Text="OK" ClientIDMode="Static" OnClientClick="$('.sectionOuterErro').css('display', 'none'); return false;" />
        </footer>
    </section>
</section>
