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
    public partial class Informacao : System.Web.UI.Page
    {
        public int InfoID
        {
            get
            {
                try
                {
                    if (Request.QueryString["InfoID"] != null)
                        return Convert.ToInt32(Request.QueryString["InfoID"].ToString());

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
            InformacaoBH info = new InformacaoDAL().Obter(InfoID);
            lbLTitulo.Text = info.Titulo;
            lblDescricao.Text = info.Descricao;
            imgInfo.ImageUrl = "/Imagens/Infos/" + info.Imagem;
            hdfLat.Value = info.Latitude.ToString();
            hdfLon.Value = info.Longitude.ToString();
        }
    }
}