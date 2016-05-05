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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Usu == null)
                    Response.Redirect("Login.aspx");

                if (!IsPostBack)
                    CarregaDados();
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
                Ingresso ing = new IngressoDAL().ObterEvento(Convert.ToInt32(ddlEvento.SelectedItem.Value));
                string valor;
                if (ing == null)
                    valor = "-";
                else
                    valor = "R$" + ing.Valor;

                lblDescricao.Text = "<p><strong>" + evento.NomeEvento + "</strong></p><p><strong>Data: </strong>" + evento.Data.ToShortDateString() + "</p><p><strong>Horário: </strong> " + evento.Horario + "<p><strong>Local: </strong>" + evento.Local.DescLocal + "</p><p><strong>Valor: </strong>" + valor + "</p>";
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
                ev.Evento_ID = Convert.ToInt32(ddlEvento.SelectedValue);
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