using PersistLayer.DAL;
using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteOlimpiadas.Site.Master
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string recCli;
            recCli = Util.Cookies.RecuperaCookie("Usuario", Request);
            Usuario Usu = null;

            if (!recCli.Equals(string.Empty))
            {
                int cliID = Convert.ToInt32(Util.Criptografia.Decriptar(Geral.CRIPTO.CHAVE, Geral.CRIPTO.VETOR, recCli.ToString()));
                Usu = new UsuarioDAL().Obter(cliID);
            }

            if (Usu != null)
            {
                liLogin.Visible = false;
                liSair.Visible = true;
                liUser.Visible = true;

                if (Usu.Perfil_ID == 8)
                    liAdmin.Visible = true;
                else
                    liAdmin.Visible = false;
            } 
            else
            {
                liUser.Visible = false;
                liAdmin.Visible = false;
                liSair.Visible = false;
            }
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void lnkDadosPessoais_Click(object sender, EventArgs e)
        {
            Response.Redirect("DadosPessoais.aspx");
        }

        protected void lnkComprar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ComprarIngresso.aspx");
        }

        protected void lnlRelatorio_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmitirRelatorio.aspx");
        }

        protected void lnkEventos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Eventos.aspx");
        }

        protected void lnkSair_Click(object sender, EventArgs e)
        {
            Util.Cookies.DeletaCookie("Usuario", Response, Request);
            Response.Redirect("Home.aspx", false);
        }
    }
}