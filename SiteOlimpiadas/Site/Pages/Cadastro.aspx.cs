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
    public partial class Cadastro : System.Web.UI.Page
    {
        Site.Geral.UserControls.UserErro msgErro;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtNome.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo NOME é obrigatório!");
                if (txtCPF.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo CPF é obrigatório!");
                if (!Util.Validacoes.ValidaEmail(txtEmail.Text))
                    throw new ApplicationException("Digite um EMAIl válido!");
                if (txtSenha.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo SENHA é obrigatório!");
                if (txtConfirmeSenha.Text.Equals(string.Empty))
                    throw new ApplicationException("O campo CONFIRME A SENHA é obrigatório!");
                if (txtSenha.Text != txtConfirmeSenha.Text)
                    throw new ApplicationException("Digite a SENHA novamente!");
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

                Usuario user = new UsuarioDAL().BuscarEmail(txtEmail.Text);

                if (user == null)
                    user = new Usuario();
                else
                    throw new ApplicationException("EMAIL já cadastrado no site!");

                user.Nome = txtNome.Text;
                user.CPF = txtCPF.Text;
                user.Email = txtEmail.Text;
                user.Senha = Util.Criptografia.EncryptMd5(txtSenha.Text);
                user.Logradouro = txtLogradouro.Text;
                user.Numero = Convert.ToInt32(txtNumero.Text);
                user.Bairro = txtBairro.Text;
                user.Cidade = txtCidade.Text;
                user.UF = txtUF.Text;
                user.DataNascimento = txtDataNasc.Text;

                user.ID = new UsuarioDAL().Adicionar(user);
                Util.Cookies.CreateCookie("Usuario", Util.Criptografia.Encriptar(Geral.CRIPTO.CHAVE, Geral.CRIPTO.VETOR, user.ID.ToString()), 60, Response);
                Response.Redirect("Home.aspx", false);
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