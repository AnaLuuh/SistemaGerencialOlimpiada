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
    public partial class Ajuda : BaseSite
    {
        Site.Geral.UserControls.UserErro msgErro;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    CarregaLinks();
                    sectionLoginPopUp.Style.Add("display", "none");
                    sectionLoginPopUp.ClientIDMode = System.Web.UI.ClientIDMode.Static;
                }          
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }      
        }

        private void CarregaLinks()
        {
            try
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Texto");

                List<Tutorial> lstAjuda = new TutorialDAL().Listar();

                foreach (Tutorial t in lstAjuda)
                {
                    dt.Rows.Add(t.ID, t.NomeTutorial);
                }

                rptLinks.DataSource = dt;
                rptLinks.DataBind();
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnkAjudaLogin_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int IDTutorial = Convert.ToInt32(e.CommandArgument);
                Tutorial t = new TutorialDAL().Obter(IDTutorial);
                lblDescricao.Text = t.DescTutorial;
                sectionLoginPopUp.Style.Add("display", "block");                
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnkFechar_Click(object sender, EventArgs e)
        {
            try
            {
                sectionLoginPopUp.Style.Add("display", "none");
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