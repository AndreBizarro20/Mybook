﻿using System;

namespace Mybook
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["pagina_guardada"] = "index.aspx";
        }
    }
}