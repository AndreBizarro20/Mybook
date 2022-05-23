using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class Ver_perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["pagina_guardada"] = "Ver_perfil.aspx";
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
                ((ImageButton)e.Item.FindControl("btn_favorito")).CommandArgument = dr["id_texto"].ToString();
                ((ImageButton)e.Item.FindControl("btn_texto")).CommandArgument = dr["id_texto"].ToString();



                ((ImageButton)e.Item.FindControl("btn_video")).CommandArgument = dr["link_video"].ToString();

                if (dr["link_video"].ToString() == "")
                {
                    ((ImageButton)e.Item.FindControl("btn_video")).Visible = false;

                }


                if (Session["email"] == null)
                {
                    ((ImageButton)e.Item.FindControl("btn_favorito")).Visible = false;

                }
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lbl_info.Visible = true;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                if (e.CommandName == "btn_video")
                {
                    Response.Redirect($"{e.CommandArgument}");
                }
                if (e.CommandName == "btn_texto")
                {
                    Response.Redirect("ler_texto.aspx?id_texto=" + e.CommandArgument);
                }

                if (e.CommandName == "btn_favorito")
                {
                    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Mybook"].ConnectionString);

                    SqlCommand myCommand = new SqlCommand();

                    myCommand.Parameters.AddWithValue("@id_pessoa", Convert.ToInt32(Session["id_pessoa"].ToString()));
                    myCommand.Parameters.AddWithValue("@id_texto", Convert.ToInt32(((ImageButton)e.Item.FindControl("btn_favorito")).CommandArgument));

                    SqlParameter retorno = new SqlParameter();
                    retorno.ParameterName = "@retorno";
                    retorno.Direction = ParameterDirection.Output;
                    retorno.SqlDbType = SqlDbType.Int;
                    myCommand.Parameters.Add(retorno);

                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "favorito";

                    myCommand.Connection = myConn;
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                    int respostaRetorno = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);
                    myConn.Close();

                    if (respostaRetorno == 1)
                    {
                        lbl_info.Attributes.Add("class", "alert alert-success");
                        lbl_info.Text = $"Adicionado aos favoritos";
                    }
                    else
                    {
                        lbl_info.Attributes.Add("class", "alert alert-danger");
                        lbl_info.Text = $"Este texto já se encontra nos favoritos";
                    }

                }
            }
        }
    }
}