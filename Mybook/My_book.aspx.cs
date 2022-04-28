using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class My_book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_criartexto.Enabled = false;
            btn_criartexto.Visible = false;
            if (Session["email"] != null)
            { 

                if (Session["id_perfil"].ToString() == "1")
                {
                    btn_criartexto.Visible = true;
                    btn_criartexto.Enabled = true;

                }
            }
        }
        protected void btn_criartexto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adicionar_texto.aspx");
        }
    }
}