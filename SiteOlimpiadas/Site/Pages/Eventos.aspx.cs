using PersistLayer.DAL;
using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteOlimpiadas.Site.Pages
{
    public partial class Eventos : BaseSite
    {
        Site.Geral.UserControls.UserErro msgErro;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Usu == null)
                    Response.Redirect("Login.aspx");

                if (!IsPostBack)
                    CarregaEvento();
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }      
        }

        private void CarregaEvento()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("Modalidade");
                dt.Columns.Add("Evento");
                dt.Columns.Add("Local");
                dt.Columns.Add("Data");
                dt.Columns.Add("Horario");
                dt.Columns.Add("ID");

                List<Evento> lstEventos = new EventoDAL().Listar();

                foreach (Evento e in lstEventos)
                {
                    dt.Rows.Add(e.Modalidade.DescModalidade, e.NomeEvento, e.Local.DescLocal, e.Data.ToShortDateString(), e.Horario, e.ID);
                }

                rptEventos.DataSource = dt;
                rptEventos.DataBind();
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnkAdicionar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("EditarEvento.aspx");
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnkEditar_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int IDEvento = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("EditarEvento.aspx?EventoID=" + IDEvento);
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnkExcluir_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int IDEvento = Convert.ToInt32(e.CommandArgument);
                EventoDAL ed = new EventoDAL();
                Evento eve = ed.Obter(IDEvento);
                List<EventoUsuario> lstEven = new EventoUsuarioDAL().ListarEve(IDEvento);
                List<Ingresso> lstIngr = new IngressoDAL().ListarEve(IDEvento);

                if (lstEven.Count() > 0 || lstIngr.Count() > 0)
                    throw new ApplicationException("O EVENTO possui relacionamentos então não pode ser deletado!");
                else
                    ed.Remover(eve); ;
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