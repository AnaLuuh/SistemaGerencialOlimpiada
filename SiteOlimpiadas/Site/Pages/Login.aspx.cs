using Facebook;
using PersistLayer.DAL;
using PersistLayer.Model;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteOlimpiadas.Site.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        Site.Geral.UserControls.UserErro msgErro;
        string facebook_urlAuthorize_base = "https://graph.facebook.com/oauth/authorize";
        string facebook_urlGetToken_base = "https://graph.facebook.com/oauth/access_token";
        string facebook_AppID = "572954889505756";
        string facebook_AppSecret = "e500a496ec3372cf791523305c8de375";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Configurar app: https://developers.facebook.com/sa/apps/572954889505756/settings/
            try
            {
                if (!IsPostBack)
                {
                    if (Request["code"] != null)
                    {
                        string authorizationCode = Request["code"];
                        string access_token = Facebook_GetAccessToken(authorizationCode);
                        if (access_token == "")
                        {
                            Response.Write("Could not get access_token");
                            return;
                        }

                        DetalhesDoUsuario(access_token);
                    }

                }
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtEmail.Text.Equals(""))
                    throw new ApplicationException("O campo EMAIL é obrigatório!");

                if (txtSenha.Text.Equals(""))
                    throw new ApplicationException("O campo SENHA é obrigatório!");

                Usuario user = new Usuario();
                user = new UsuarioDAL().Buscar(txtEmail.Text, Util.Criptografia.EncryptMd5(txtSenha.Text));

                if (user == null)
                    throw new ApplicationException("Combinação EMAIL/SENHA não encontrados!");
                else
                {
                    Util.Cookies.CreateCookie("Usuario", Util.Criptografia.Encriptar(Geral.CRIPTO.CHAVE, Geral.CRIPTO.VETOR, user.ID.ToString()), 60, Response);
                    Response.Redirect("Home.aspx", false);
                }
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void lnkCadastrar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Cadastro.aspx");
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        protected void btnLogFacebook_Click(object sender, EventArgs e)
        {
            try
            {
                Facebook_AuthorizeApplication();
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }
        private void Facebook_AuthorizeApplication()
        {
            try
            {
                string scope = "email,user_likes,public_profile,publish_actions, user_birthday,user_about_me,user_hometown,user_events";
                string urlAuthorize = facebook_urlAuthorize_base;
                urlAuthorize += "?client_id=" + facebook_AppID;
                urlAuthorize += "&redirect_uri=" + Facebook_GetRedirectUri();
                urlAuthorize += "&scope=" + scope;

                Response.Redirect(urlAuthorize, true);
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        private string Facebook_GetAccessToken(string pAuthorizationCode)
        {
            string urlGetAccessToken = facebook_urlGetToken_base;
            urlGetAccessToken += "?client_id=" + facebook_AppID;
            urlGetAccessToken += "&client_secret=" + facebook_AppSecret;
            urlGetAccessToken += "&redirect_uri=" + Facebook_GetRedirectUri();
            urlGetAccessToken += "&code=" + pAuthorizationCode;

            string responseData = RequestResponse(urlGetAccessToken);
            if (responseData == "")
            {
                return "";
            }
            NameValueCollection qs = HttpUtility.ParseQueryString(responseData);
            string access_token = qs["access_token"] == null ? "" : qs["access_token"];

            return access_token;
        }

        public void DetalhesDoUsuario(string acess_token)
        {
            try
            {
                if (acess_token != "")
                {
                    var _fb = new FacebookClient(acess_token);

                    #region Request
                    //var request = _fb.Get("me");
                    //string nome = _fb.Get("me/name").ToString();
                    //string email = _fb.Get("me/email").ToString();
                    #endregion

                    var result = (IDictionary<string, object>)_fb.Get("me");
                    var name = (string)result["name"];
                    var email = (string)result["email"];

                    Session["NomeCliente"] = name;
                    Session["EmailCliente"] = email;

                    Response.Redirect("/usuarioface");
                }
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        private void Facebook_WriteWall(string pAccessToken, string pMessage)
        {
            try
            {
                string username = "me";
                string datatype = "feed";
                string urlWriteWall = "https://graph.facebook.com/" + username + "/" + datatype + "?access_token=" + pAccessToken;

                string entityMessage = "message=" + Session["message"];
                entityMessage += "&picture=http://webmodelling.com/_images/jewelpit.png";
                entityMessage += "&link=http://webmodelling.com";
                entityMessage += "&name=Rasmus";
                entityMessage += "&caption=Writing to Facebook wall";

                HttpPost(urlWriteWall, entityMessage);
            }
            catch (Exception ex)
            {
                msgErro = (Geral.UserControls.UserErro)LoadControl("../Geral/UserControls/UserErro.ascx");
                msgErro.Text = ex.Message;
                placeholder.Controls.Add(msgErro);
            }
        }

        private string Facebook_GetRedirectUri()
        {
            string urlCurrentPage = Request.Url.AbsoluteUri.IndexOf('?') == -1 ? Request.Url.AbsoluteUri : Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.IndexOf('?'));
            NameValueCollection nvc = new NameValueCollection();
            foreach (string key in Request.QueryString) { if (key != "code") { nvc.Add(key, Request.QueryString[key]); } }
            string qs = "";
            foreach (string key in nvc)
            {
                qs += qs == "" ? "?" : "&";
                qs += key + "=" + nvc[key];
            }
            string redirect_uri = urlCurrentPage + qs;

            return redirect_uri;
        }

        private string HttpPost(string pUrl, string pPostData)
        {
            HttpWebRequest webRequest = (HttpWebRequest)HttpWebRequest.Create(pUrl);
            webRequest.ContentType = "application/x-www-form-urlencoded";
            webRequest.Method = "POST";
            byte[] bytes = System.Text.Encoding.UTF8.GetBytes(pPostData);
            Stream requestWriter = webRequest.GetRequestStream();
            requestWriter.Write(bytes, 0, bytes.Length);
            requestWriter.Close();

            Stream responseStream = null;
            StreamReader responseReader = null;
            string responseData = "";
            try
            {
                WebResponse webResponse = webRequest.GetResponse();
                responseStream = webResponse.GetResponseStream();
                responseReader = new StreamReader(responseStream);
                responseData = responseReader.ReadToEnd();
            }
            catch (Exception exc)
            {
                throw new Exception("could not post : " + exc.Message);
            }
            finally
            {
                if (responseStream != null)
                {
                    responseStream.Close();
                    responseReader.Close();
                }
            }

            return responseData;
        }

        private string RequestResponse(string pUrl)
        {
            HttpWebRequest webRequest = System.Net.WebRequest.Create(pUrl) as HttpWebRequest;
            webRequest.Method = "GET";
            webRequest.ServicePoint.Expect100Continue = false;
            webRequest.Timeout = 20000;

            Stream responseStream = null;
            StreamReader responseReader = null;
            string responseData = "";
            try
            {
                WebResponse webResponse = webRequest.GetResponse();
                responseStream = webResponse.GetResponseStream();
                responseReader = new StreamReader(responseStream);
                responseData = responseReader.ReadToEnd();
            }
            catch (Exception exc)
            {
                Response.Write("<br /><br />ERROR : " + exc.Message);
            }
            finally
            {
                if (responseStream != null)
                {
                    responseStream.Close();
                    responseReader.Close();
                }
            }

            return responseData;
        }
    }
}