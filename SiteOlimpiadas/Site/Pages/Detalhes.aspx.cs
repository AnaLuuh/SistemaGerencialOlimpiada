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
                Evento evento = new EventoDAL().Obter(EventoID);
                Ingresso ing = new IngressoDAL().ObterEvento(EventoID);
                string valor;
                if (ing == null)
                    valor = "-";
                else
                    valor = "R$" + ing.Valor;
                InformacaoBH info = new InformacaoDAL().Obter();

                lblNomeEsporte.Text = evento.Modalidade.DescModalidade;
                lblDescricao.Text = "<p><strong>" + evento.NomeEvento + "</strong></p><p>" + evento.Modalidade.InfoModalidade + "</p><p><strong>Data: </strong>" + evento.Data.ToShortDateString() + "</p><p><strong>Horário: </strong>" + evento.Horario + "</p><p><strong>Local:</strong> " + evento.Local.DescLocal + "</p><p><strong>Valor: " + valor + "</strong></p>";

                if (evento.Local.DescLocal == "Belo Horizonte")
                    lblDescricao.Text += "<strong>Sobre BH: </strong>" + info.Informacao;
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
                EventoUsuario ev = new EventoUsuario();
                ev.Evento_ID = EventoID;
                ev.Usuario_ID = Usu.ID;
                ev.ID = new EventoUsuarioDAL().Adicionar(ev);
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