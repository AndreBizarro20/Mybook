using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class Ver_perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RepeaterPerfil_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("txt_nome")).Text = dr["nome"].ToString();
                ((Label)e.Item.FindControl("txt_apelido")).Text = dr["apelido"].ToString();

                //((Label)e.Item.FindControl("lbl_perfil")).Text = dr["perfil"].ToString();
                ((Label)e.Item.FindControl("txt_cidade")).Text = dr["cidade"].ToString();
                ((Label)e.Item.FindControl("txt_genero")).Text = dr["genero"].ToString();


                if (dr["genero"].ToString() == "Masculino")
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/male.png";

                }
                else if (dr["genero"].ToString() == "Feminino")
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/female.png";
                }
                else
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/outro.jpeg";
                }




            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("lbl_genero")).Text = dr["generos_livro"].ToString();

                string x = dr["generos_livro"].ToString();

                string y = dr["generos_livro"].ToString();



                if (dr["generos_livro"].ToString() == "Ficção")
                {
                    ((HtmlGenericControl)(e.Item.FindControl("id_cliente"))).Attributes["class"] = "tag tag-blue";


                }
                else if (dr["generos_livro"].ToString() == "Romance")
                {
                    ((HtmlGenericControl)(e.Item.FindControl("id_cliente"))).Attributes["class"] = "tag tag-red";

                }
                else if (dr["generos_livro"].ToString() == "Aventura")
                {
                    ((HtmlGenericControl)(e.Item.FindControl("id_cliente"))).Attributes["class"] = "tag tag-brown";

                }
                else if (dr["generos_livro"].ToString() == "Conto")
                {
                    ((HtmlGenericControl)(e.Item.FindControl("id_cliente"))).Attributes["class"] = "tag tag-green";

                }
                else if (dr["generos_livro"].ToString() == "Fantasia")
                {
                    ((HtmlGenericControl)(e.Item.FindControl("id_cliente"))).Attributes["class"] = "tag tag-orange";

                }

                ((Label)e.Item.FindControl("lbl_titulo")).Text = dr["titulo"].ToString();
                ((Label)e.Item.FindControl("lbl_resumo")).Text = dr["resumo"].ToString();
                ((Label)e.Item.FindControl("lbl_data")).Text = Convert.ToDateTime(dr["data"]).ToShortDateString();
                byte[] binaryData = (byte[])dr["binarios"];
                string image_string = Convert.ToBase64String(binaryData);
                ((Image)e.Item.FindControl("img_texto")).ImageUrl = String.Format($"data:image/.jpg;base64,{image_string}");

            }
        }
    }
}