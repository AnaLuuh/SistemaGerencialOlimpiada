using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteOlimpiadas.Site.Geral.UserControls
{
    public partial class UserErro : System.Web.UI.UserControl
    {
        public string Text { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblTituloErro.Text = "Erro";

            if (Text != "")
                lblErro.Text = Text;
        }
    }
}