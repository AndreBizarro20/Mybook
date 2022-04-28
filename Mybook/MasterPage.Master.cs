using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if(Session["email"] == null)
            {
                ibtn_logout.Visible = false;
                ibtn_logout.Enabled = false;
                lbl_nome.Visible = false;
                lbl_nome.Enabled= false;
                nome_perfil.Attributes.Add("style", "display: none");
            }
            if (Session["email"] != null)
            {
                ibtn_login.Visible = false;
                ibtn_login.Enabled = false;
                lbl_nome.Visible = true;
                lbl_nome.Enabled = true;
                lbl_nome.Text = Session["nome"].ToString();
                nome_perfil.Attributes.Add("style", "display: block");

            }
        }
        protected void ibtn_login_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Login.aspx");
        }


        protected void ibtn_logout_Click1(object sender, ImageClickEventArgs e)
        {
            Session["email"] = null;
            Response.Redirect("Index.aspx");
        }

        protected void lbl_nome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil.aspx");
        }
    }
}