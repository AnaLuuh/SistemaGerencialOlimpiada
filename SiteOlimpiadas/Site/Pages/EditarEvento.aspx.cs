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
    public partial class EditarEvento : BaseSite
    {
        Site.Geral.UserControls.UserErro msgErro;

        public int EventoID
        {
            get
            {
                try
                {
                    if (Request.QueryString["EventoID"] != null)
                        return Convert.ToInt32(Request.QueryString["EventoID"].ToString());

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
                {
                    CarregaDrop();

                    if (EventoID > 0)
                        CarregaEvento();
                }            
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
                Evento evento = new EventoDAL().Obter(EventoID);
                txtNomeEvento.Text = evento.NomeEvento;
                ddlModalidade.ClearSelection();
                ddlModalidade.Items.FindByValue(evento.Modalidade_ID.ToString()).Selected = true;
                ddlLocal.ClearSelection();
                ddlLocal.Items.FindByValue(evento.Local_ID.ToString()).Selected = true;
                txtData.Text = evento.Data.ToString("yyyy-MM-dd");
                txtHorario.Text = evento.Horario;
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        private void CarregaDrop()
        {
            try
            {
                List<Modalidade> lstModalidade = new ModalidadeDAL().Listar();

                foreach (Modalidade m in lstModalidade)
                    ddlModalidade.Items.Add(new ListItem() { Value = m.ID.ToString(), Text = m.DescModalidade });

                List<Local> lstLocal = new LocalDAL().Listar();

                foreach (Local l in lstLocal)
                    ddlLocal.Items.Add(new ListItem() { Value = l.ID.ToString(), Text = l.DescLocal });
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            try
            {
                Evento ev = new Evento();
                EventoDAL ed = new EventoDAL();

                if (EventoID > 0)
                    ev = ed.Obter(EventoID);

                ev.NomeEvento = txtNomeEvento.Text;
                ev.Modalidade_ID = Convert.ToInt32(ddlModalidade.SelectedValue);
                ev.Local_ID = Convert.ToInt32(ddlLocal.SelectedValue);
                ev.Data = Convert.ToDateTime(txtData.Text);
                ev.Horario = txtHorario.Text;

                if(EventoID > 0)
                {
                    ev.ID = EventoID;
                    ed.Atualizar(ev);
                    lblSucesso.Text = "Evento Editado com Sucesso!";
                }
                else
                {
                    ev.ID = ed.Adicionar(ev);
                    lblSucesso.Text = "Evento Adicionado com Sucesso!";
                }
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