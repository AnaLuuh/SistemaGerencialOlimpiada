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
    public partial class ComprarIngresso : BaseSite
    {
        Site.Geral.UserControls.UserErro msgErro;

        public int EventoID
        {
            get
            {
                try
                {
                    if (Request.QueryString["EventoID"] != null)
                        return Convert.ToInt32(Util.Criptografia.Decriptar(Geral.CRIPTO.CHAVE, Geral.CRIPTO.VETOR, Request.QueryString["EventoID"].ToString()));

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

                if (!IsPostBack)
                    CarregaDados();

                if (EventoID != 0)
                {
                    ddlEvento.ClearSelection();
                    ddlEvento.Items.FindByValue(EventoID.ToString()).Selected = true;
                }
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }         
        }

        private void CarregaDados()
        {
            try
            {
                List<Evento> lstEvento = new EventoDAL().Listar();

                foreach (Evento ev in lstEvento)
                {
                    ddlEvento.Items.Add(new ListItem() { Value = ev.ID.ToString(), Text = ev.NomeEvento });
                }
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }       
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Evento evento = new EventoDAL().Obter(Convert.ToInt32(ddlEvento.SelectedItem.Value));
                Ingresso ingresso = new IngressoDAL().ObterEvento(Convert.ToInt32(ddlEvento.SelectedItem.Value));

                lblDescricao.Text = "<p>" + evento.NomeEvento + "</p><p>" + evento.Modalidade.InfoModalidade + "</p><p>Local: " + evento.Local + "</p><p>Valor: " + ingresso.Valor + "</p>";
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
                new EventoUsuarioDAL().Adicionar(ev);
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