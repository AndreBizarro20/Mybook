using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
                ((Label)e.Item.FindControl("lbl_autor")).Text = dr["nome"].ToString();
                ((Label)e.Item.FindControl("lbl_data")).Text = Convert.ToDateTime(dr["data"]).ToShortDateString();
                byte[] binaryData = (byte[])dr["binarios"];
                string image_string = Convert.ToBase64String(binaryData);
                ((Image)e.Item.FindControl("img_texto")).ImageUrl = String.Format($"data:image/.jpg;base64,{image_string}");
                ((ImageButton)e.Item.FindControl("btn_verPerfil")).CommandArgument = dr["id_pessoa"].ToString();
                ((ImageButton)e.Item.FindControl("btn_favorito")).CommandArgument = dr["id_texto"].ToString();
                ((ImageButton)e.Item.FindControl("btn_favorito")).CommandArgument = dr["id_favorito"].ToString();


                if (Session["email"] == null)
                {
                    ((ImageButton)e.Item.FindControl("btn_favorito")).Visible = false;
                    ((ImageButton)e.Item.FindControl("btn_favorito")).Enabled = false;
                    ((ImageButton)e.Item.FindControl("btn_favorito")).Visible = false;
                    ((ImageButton)e.Item.FindControl("btn_favorito")).Enabled = false;
                    ((ImageButton)e.Item.FindControl("btn_favorito")).Attributes.Add("style", "display: none");
                }

            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btn_verPerfil")
            {
                Session["ver_perfil"] = ((ImageButton)e.Item.FindControl("btn_verPerfil")).CommandArgument;

                Response.Redirect("Ver_perfil.aspx");
            }
            lbl_info.Visible = true;
            if (e.CommandName == "btn_favorito")
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Mybook"].ConnectionString);

                SqlCommand myCommand = new SqlCommand();

                myCommand.Parameters.AddWithValue("@id_favorito", Convert.ToInt32(((ImageButton)e.Item.FindControl("btn_favorito")).CommandArgument));

                SqlParameter retorno = new SqlParameter();
                retorno.ParameterName = "@retorno";
                retorno.Direction = ParameterDirection.Output;
                retorno.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(retorno);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "eliminar_fav";

                myCommand.Connection = myConn;
                myConn.Open();
                myCommand.ExecuteNonQuery();

                int respostaRetorno = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);
                myConn.Close();

                if (respostaRetorno == 1)
                {
                   lbl_info.Attributes.Add("class", "alert alert-success");
                   lbl_info.Text = $"Removido com sucesso";
                }

                Repeater1.DataBind();
            }
        }
    }
}