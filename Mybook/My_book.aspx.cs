using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Mybook
{
    public partial class My_book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            myCommand.Parameters.AddWithValue("@id_pessoa", Convert.ToInt32(Session["id_pessoa"].ToString()));
            myCommand.Parameters.AddWithValue("@data", DateTime.Now.ToShortDateString());
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

        }

    }
}
