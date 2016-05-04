using PersistLayer.DAL;
using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteOlimpiadas.Site.Pages
{
    public partial class Detalhes : BaseSite
    {
        Site.Geral.UserControls.UserErro msgErro;

        public int EventoID
        {
            get
            {
                try
                {
                    if (Request.QueryString["EventoID"] != null)
                        return Convert.ToInt32(Request.QueryString["EventoID"]);

                    return 0;
                }
                catch (Exception)
                {
                    return 0;
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Usu == null)
                    Response.Redirect("Login.aspx");

                Evento evento = new EventoDAL().Obter(EventoID);
                InformacaoBH info = new InformacaoDAL().Obter();

                lblNomeEsporte.Text = evento.Modalidade.DescModalidade;
                lblDescricao.Text = "<p>" + evento.NomeEvento + "</p><p>" + evento.Modalidade.InfoModalidade + "</p><p>Local:" + evento.Local.DescLocal + "</p>";

                if (evento.Local.DescLocal == "Belo Horizonte")
                    lblDescricao.Text += "Sobre BH: " + info.Informacao;
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ComprarIngresso.aspx?Evento=" + EventoID);
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }
    }
}