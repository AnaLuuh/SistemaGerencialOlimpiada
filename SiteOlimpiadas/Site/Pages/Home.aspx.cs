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
    public partial class Home : System.Web.UI.Page
    {
        Site.Geral.UserControls.UserErro msgErro;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
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

        protected void btnFiltrar_Click(object sender, EventArgs e)
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

                List<Evento> lstEventos = new List<Evento>();

                if (ddlFiltro.SelectedItem.Value == "1")
                    lstEventos = new EventoDAL().Listar().AsEnumerable().Where(a => a.Data == Convert.ToDateTime(txtFiltro.Text)).ToList();
                if (ddlFiltro.SelectedItem.Value == "2")
                    lstEventos = new EventoDAL().Listar().Where(a => a.Local.DescLocal == txtFiltro.Text).ToList();

                foreach (Evento ev in lstEventos)
                {
                    dt.Rows.Add(ev.Modalidade.DescModalidade, ev.NomeEvento, ev.Local.DescLocal, ev.Data.ToShortDateString(), ev.Horario, ev.ID);
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

        protected void lnkVerDetahes_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int IDEvento = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Detalhes.aspx?EventoID=" + IDEvento);
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