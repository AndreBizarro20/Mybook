using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class My_book : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            Session["pagina_guardada"] = "My_book.aspx";
            if (Session["email"] != null)
            {

                if (Session["id_perfil"].ToString() == "1")
                {
                    teste1.Attributes["style"] = "display:block";

                }
            }


        }

        protected void btn_adicionar_Click(object sender, EventArgs e)
        {

            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Mybook"].ConnectionString);

            SqlCommand myCommand = new SqlCommand();

            Stream imgStream = FileUpload1.PostedFile.InputStream;

            int tamanho_array = FileUpload1.PostedFile.ContentLength;

            byte[] imgBinaryData = new byte[tamanho_array];

            imgStream.Read(imgBinaryData, 0, tamanho_array);


            myCommand.Parameters.AddWithValue("@tipo_livro", Convert.ToInt32(dpr_genero.SelectedValue));
            myCommand.Parameters.AddWithValue("@titulo", txt_titulo.Text);
            myCommand.Parameters.AddWithValue("@resumo", txt_resumo.Text);
            myCommand.Parameters.AddWithValue("@texto", txt_texto.Text);
            myCommand.Parameters.AddWithValue("@link", txt_link.Text);
            myCommand.Parameters.AddWithValue("@id_pessoa", Convert.ToInt32(Session["id_pessoa"].ToString()));
            myCommand.Parameters.AddWithValue("@data", Convert.ToDateTime(DateTime.Now.ToShortDateString()));
            myCommand.Parameters.AddWithValue("@binarios", imgBinaryData);


            SqlParameter retorno = new SqlParameter();
            retorno.ParameterName = "@retorno";
            retorno.Direction = ParameterDirection.Output;
            retorno.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(retorno);

            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "adicionar_texto";

            myCommand.Connection = myConn;
            myConn.Open();
            myCommand.ExecuteNonQuery();
            int respostaRetorno = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);
            myConn.Close();

            lbl_mensagem.Visible = true;

            if (respostaRetorno == 1)
            {
                lbl_mensagem.Attributes.Add("class", "alert alert-success");
                lbl_mensagem.Text = "Texto adicionado com sucesso.";

                txt_resumo.Text = string.Empty;
                txt_texto.Text = string.Empty;
                txt_titulo.Text = string.Empty;
            }
            else
            {

                lbl_mensagem.Attributes.Add("class", "alert alert-danger");
                lbl_mensagem.Text = "O texto já está insirido no sistema.";
            }

            Repeater1.DataBind();
        }

        protected void Repeater1_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
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
                ((ImageButton)e.Item.FindControl("btn_texto")).CommandArgument = dr["id_texto"].ToString();
                ((ImageButton)e.Item.FindControl("btn_video")).CommandArgument = dr["link_video"].ToString();

                if (dr["link_video"].ToString() == "")
                {
                    ((ImageButton)e.Item.FindControl("btn_video")).Visible = false;
                    
                }

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
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.CommandName == "btn_video")
                {
                    Response.Redirect($"{e.CommandArgument}");
                }
                if (e.CommandName == "btn_texto")
                {
                    Response.Redirect("ler_texto.aspx?id_texto="+e.CommandArgument);
                }
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

        protected void ddl_genero_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = $"SELECT tab_texto.id_texto, tab_texto.id_pessoa, tab_pessoa.nome, tab_texto.titulo,tab_texto.link_video, tab_texto.resumo, tab_generos_livro.generos_livro, tab_texto.binarios, tab_texto.data FROM     tab_generos_livro INNER JOIN tab_texto ON tab_generos_livro.id_generos_livro = tab_texto.id_generos_livro INNER JOIN tab_pessoa ON tab_texto.id_pessoa = tab_pessoa.id_pessoa where tab_texto.id_pessoa='1' and tab_generos_livro.generos_livro='{ddl_genero.SelectedItem}'";

            Repeater1.DataBind();
        }
    }
}
