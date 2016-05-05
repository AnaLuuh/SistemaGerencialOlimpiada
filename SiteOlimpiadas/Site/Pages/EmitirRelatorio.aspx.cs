using PersistLayer.DAL;
using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteOlimpiadas.Site.Pages
{
    public partial class EmitirRelatorio : BaseSite
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
                DataTable dt = new DataTable();
                dt.Columns.Add("Modalidade");
                dt.Columns.Add("Evento");
                dt.Columns.Add("Local");
                dt.Columns.Add("Data");
                dt.Columns.Add("Horario");
                dt.Columns.Add("ID");

                List<EventoUsuario> lstEventosUsuario = new EventoUsuarioDAL().ListarUsu(Usu.ID).OrderBy(a => a.Evento.Data).ToList();

                foreach (EventoUsuario e in lstEventosUsuario)
                {
                    dt.Rows.Add(e.Evento.Modalidade.DescModalidade, e.Evento.NomeEvento, e.Evento.Local.DescLocal, e.Evento.Data.ToShortDateString(), e.Evento.Horario, e.ID);
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

                List<EventoUsuario> lstEventosUsuario = new List<EventoUsuario>();

                if (ddlEvento.SelectedItem.Value == "1")
                    lstEventosUsuario = new EventoUsuarioDAL().ListarUsu(Usu.ID).OrderBy(a => a.Evento.Modalidade.DescModalidade).ToList();
                if (ddlEvento.SelectedItem.Value == "2")
                {
                    DateTime data = Convert.ToDateTime(txtData.Text);
                    lstEventosUsuario = new EventoUsuarioDAL().ListarUsu(Usu.ID).Where(b => b.Evento.Data == data).OrderBy(a => a.Evento.Data).ToList();
                }

                foreach (EventoUsuario eve in lstEventosUsuario)
                {
                    dt.Rows.Add(eve.Evento.Modalidade.DescModalidade, eve.Evento.NomeEvento, eve.Evento.Local.DescLocal, eve.Evento.Data.ToShortDateString(), eve.Evento.Horario, eve.ID);
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

        protected void btnEmitir_Click(object sender, EventArgs e)
        {
            try
            {
                List<EventoUsuario> lstEventosUsuario = new List<EventoUsuario>();

                if (ddlEvento.SelectedItem.Value == "1")
                    lstEventosUsuario = new EventoUsuarioDAL().ListarUsu(Usu.ID).OrderBy(a => a.Evento.Modalidade.DescModalidade).ToList();
                if (ddlEvento.SelectedItem.Value == "2")
                    lstEventosUsuario = new EventoUsuarioDAL().ListarUsu(Usu.ID).OrderBy(a => a.Evento.Data).ToList();
                else
                    lstEventosUsuario = new EventoUsuarioDAL().ListarUsu(Usu.ID);

                string result = "";
                foreach (EventoUsuario eve in lstEventosUsuario)
                {
                    result += "<p><strong>Evento: </strong>" + eve.Evento.NomeEvento + "</p>";
                    result += "<p><strong>Modalidade: </strong>" + eve.Evento.Modalidade.DescModalidade + "</p>";
                    result += "<p><strong>Data: </strong>" + eve.Evento.Data.ToShortDateString() + "</p>";
                    result += "<p><strong>Horario: </strong>" + eve.Evento.Horario + "</p>";
                    result += "<p><strong>Local: </strong>" + eve.Evento.Local.DescLocal + "</p>";
                }

                string path = Server.MapPath("/Geral/Relatorios/RelatEventos" + Usu.Nome + ".html");
                string directory = Server.MapPath("/Geral/Relatorios");

                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                StreamWriter writer = new StreamWriter(path, false, System.Text.Encoding.UTF8);
                writer.WriteLine(result);
                writer.Flush();
                writer.Close();

                Process.Start(path);
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void ddlEvento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlEvento.SelectedValue == "2")
                txtData.Visible = true;
        }
    }
}