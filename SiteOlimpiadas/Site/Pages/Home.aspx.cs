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

                DataTable dt1 = new DataTable();
                dt1.Columns.Add("Nome");
                dt1.Columns.Add("ID");

                List<InformacaoBH> lstHoteis = new InformacaoDAL().ListarHoteis();

                foreach (InformacaoBH i in lstHoteis)
                {
                    dt1.Rows.Add(i.Titulo, i.ID);
                }

                rptHoteis.DataSource = dt1;
                rptHoteis.DataBind();

                DataTable dt2 = new DataTable();
                dt2.Columns.Add("Nome");
                dt2.Columns.Add("ID");

                List<InformacaoBH> lstRest = new InformacaoDAL().ListarRestaurantes();

                foreach (InformacaoBH i in lstRest)
                {
                    dt2.Rows.Add(i.Titulo, i.ID);
                }

                rptRestaurantes.DataSource = dt2;
                rptRestaurantes.DataBind();

                DataTable dt3 = new DataTable();
                dt3.Columns.Add("Nome");
                dt3.Columns.Add("ID");

                List<InformacaoBH> lstPontos = new InformacaoDAL().ListarPontos();

                foreach (InformacaoBH i in lstPontos)
                {
                    dt3.Rows.Add(i.Titulo, i.ID);
                }

                rptPontos.DataSource = dt3;
                rptPontos.DataBind();
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

        protected void lnkCidade_Command(object sender, CommandEventArgs e)
        {

            try
            {
                int IDInfo = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Informacao.aspx?InfoID=" + IDInfo);
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnlRest_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int IDInfo = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Informacao.aspx?InfoID=" + IDInfo);
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnlPontos_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int IDInfo = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Informacao.aspx?InfoID=" + IDInfo);
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