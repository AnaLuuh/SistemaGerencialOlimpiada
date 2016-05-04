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
    public partial class DadosPessoais : BaseSite
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
                txtNome.Text = Usu.Nome;
                txtCPF.Text = Usu.CPF;
                txtDataNasc.Text = Usu.DataNascimento;
                txtLogradouro.Text = Usu.Logradouro;
                txtNumero.Text = Usu.Numero.ToString();
                txtBairro.Text = Usu.Bairro;
                txtCidade.Text = Usu.Cidade;
                txtUF.Text = Usu.UF;
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
                Usuario usuario = new UsuarioDAL().Obter(Usu.ID);

                if (txtNome.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo NOME é obrigatório!");
                if (txtCPF.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo CPF é obrigatório!");
                if (txtLogradouro.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo LOGRADOURO é obrigatório!");
                if (txtNumero.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo NUMERO é obrigatório!");
                if (txtBairro.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo BAIRRO é obrigatório!");
                if (txtCidade.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo CIDADE é obrigatório!");
                if (txtUF.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo UF é obrigatório!");
                if (txtDataNasc.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo DATA DE NASCIMENTO é obrigatório!");

                usuario.Nome = txtNome.Text;
                usuario.CPF = txtCPF.Text;
                usuario.Logradouro = txtLogradouro.Text;
                usuario.Numero = Convert.ToInt32(txtNumero.Text);
                usuario.Bairro = txtBairro.Text;
                usuario.Cidade = txtCidade.Text;
                usuario.UF = txtUF.Text;
                usuario.DataNascimento = txtDataNasc.Text;
                usuario.ID = usuario.ID;

                new UsuarioDAL().Atualizar(usuario);

                lblSucesso.Text = "Dados atualizados com sucesso!";
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