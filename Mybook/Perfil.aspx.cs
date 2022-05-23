using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class Perfil : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] == null)
            {
                string message = "Para aceder a esta página tem de fazer login.";
                string url = "Index.aspx";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += url;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
            }

            if (Session["email"] != null)
            {

                    teste1.Attributes["style"] = "display:block";

            }

            lbl_info.Visible = false;


        }



        protected void RepeaterPerfil_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((Label)e.Item.FindControl("txt_utilizador")).Text = dr["nome"].ToString();

                ((TextBox)e.Item.FindControl("txt_pw")).Text = dr["pass"].ToString();
                ((TextBox)e.Item.FindControl("txt_pw2")).Text = dr["pass"].ToString();
                ((TextBox)e.Item.FindControl("txt_nome")).Text = dr["nome"].ToString();
                ((TextBox)e.Item.FindControl("txt_apelido")).Text = dr["apelido"].ToString();
                ((TextBox)e.Item.FindControl("txt_email")).Text = dr["email"].ToString();

                ((Label)e.Item.FindControl("lbl_perfil")).Text = dr["perfil"].ToString();
                ((DropDownList)e.Item.FindControl("txt_cidade")).SelectedValue = dr["id_cidade"].ToString();
                ((DropDownList)e.Item.FindControl("txt_genero")).SelectedValue = dr["id_genero"].ToString();
                ((Button)e.Item.FindControl("btn_update")).CommandArgument = dr["id_pessoa"].ToString();
                ((Button)e.Item.FindControl("btn_alterar")).CommandArgument = dr["id_pessoa"].ToString();

                if (dr["id_genero"].ToString() == "1")
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/male.png";

                }
                else if (dr["id_genero"].ToString() == "2")
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/female.png";
                }
                else
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/outro.jpeg";
                }




            }
        }


        protected void RepeaterPerfil_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btn_update")
            {
                //((Label)e.Item.FindControl("lbl_info")).Text = "";
               // ((Label)e.Item.FindControl("lbl_info")).Visible = false;

                try
                {
                    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    SqlCommand myCommand = new SqlCommand();

                    myCommand.Parameters.AddWithValue("@id_pessoa", ((Button)e.Item.FindControl("btn_update")).CommandArgument);
                    myCommand.Parameters.AddWithValue("@nome", ((TextBox)e.Item.FindControl("txt_nome")).Text);
                    myCommand.Parameters.AddWithValue("@apelido", ((TextBox)e.Item.FindControl("txt_apelido")).Text);
                    myCommand.Parameters.AddWithValue("@email", ((TextBox)e.Item.FindControl("txt_email")).Text);
                    myCommand.Parameters.AddWithValue("@id_genero", ((DropDownList)e.Item.FindControl("txt_genero")).SelectedValue);
                    myCommand.Parameters.AddWithValue("@id_cidade", ((DropDownList)e.Item.FindControl("txt_cidade")).SelectedValue);

                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "atualizar_perfil";

                    myCommand.Connection = myConn;
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                    myConn.Close();

                   lbl_info.Visible = true;
                    lbl_info.Attributes.Add("class", "alert alert-success");
                    lbl_info.Text = $"Perfil alterado com sucesso!";
                    RepeaterPerfil.DataBind();

                }
                catch (Exception)
                {

                }


            }

            if (e.CommandName == "btn_alterar")
            {



                if (((TextBox)e.Item.FindControl("txt_pw2")).Text == "")
                {
                    lbl_info.Visible = true;
                    lbl_info.Attributes.Add("class", "alert alert-danger");
                    lbl_info.Text = $"Insira uma nova palavra-passe";
                    /* ((Label)e.Item.FindControl("lbl_info")).Visible = true;
                     ((Label)e.Item.FindControl("lbl_info")).Attributes.Add("class", "alert alert-danger");
                     ((Label)e.Item.FindControl("lbl_info")).Text = "Insira uma nova palavra - passe";*/



                }
                else if (((TextBox)e.Item.FindControl("txt_pw")).Text != null && ((TextBox)e.Item.FindControl("txt_pw2")).Text != null)
                {
                    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    SqlCommand myCommand = new SqlCommand();


                    myCommand.Parameters.AddWithValue("@id_pessoa", ((Button)e.Item.FindControl("btn_alterar")).CommandArgument);
                    myCommand.Parameters.AddWithValue("@pass", EncryptString(((TextBox)e.Item.FindControl("txt_pw")).Text));
                    myCommand.Parameters.AddWithValue("@nova_pass", EncryptString(((TextBox)e.Item.FindControl("txt_pw2")).Text));

                    SqlParameter retorno = new SqlParameter();
                    retorno.ParameterName = "@retorno";
                    retorno.Direction = ParameterDirection.Output;
                    retorno.SqlDbType = SqlDbType.Int;
                    myCommand.Parameters.Add(retorno);

                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "atualizar_pw";

                    myCommand.Connection = myConn;
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                    int respostaRetorno = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);

                    myConn.Close();

                    lbl_info.Visible = true;
                    // ((Label)e.Item.FindControl("lbl_info")).Visible = true;

                    if (respostaRetorno == 1)
                    {
                        lbl_info.Attributes.Add("class", "alert alert-success");
                        lbl_info.Text = "Palavra-passe alterada com sucesso!";

                        /* ((Label)e.Item.FindControl("lbl_info")).Attributes.Add("class", "alert alert-success");
                         ((Label)e.Item.FindControl("lbl_info")).Text = "Palavra-passe alterada com sucesso!";*/
                    }
                    else if (respostaRetorno == 2)
                    {

                        lbl_info.Attributes.Add("class", "alert alert-warning");
                        lbl_info.Text = $"A palavra-passe atual não coincide...";
                        /* ((Label)e.Item.FindControl("lbl_info")).Attributes.Add("class", "alert alert-warning");
                         ((Label)e.Item.FindControl("lbl_info")).Text = "A palavra-passe atual não coincide...";*/
                    }
                    else if (respostaRetorno == 3)
                    {
                        lbl_info.Attributes.Add("class", "alert alert-danger");
                        lbl_info.Text = $"A palavra-passe atual e a nova não podem ser iguais";
                        /* ((Label)e.Item.FindControl("lbl_info")).Attributes.Add("class", "alert alert-danger");
                         ((Label)e.Item.FindControl("lbl_info")).Text = "A palavra-passe atual e a nova não podem ser iguais";*/
                    }
                }

            }

        }
        public static string EncryptString(string Message)
        {
            string Passphrase = "MyBook";
            byte[] Results;
            System.Text.UTF8Encoding UTF8 = new System.Text.UTF8Encoding();



            // Step 1. We hash the passphrase using MD5
            // We use the MD5 hash generator as the result is a 128 bit byte array
            // which is a valid length for the TripleDES encoder we use below



            MD5CryptoServiceProvider HashProvider = new MD5CryptoServiceProvider();
            byte[] TDESKey = HashProvider.ComputeHash(UTF8.GetBytes(Passphrase));



            // Step 2. Create a new TripleDESCryptoServiceProvider object
            TripleDESCryptoServiceProvider TDESAlgorithm = new TripleDESCryptoServiceProvider();



            // Step 3. Setup the encoder
            TDESAlgorithm.Key = TDESKey;
            TDESAlgorithm.Mode = CipherMode.ECB;
            TDESAlgorithm.Padding = PaddingMode.PKCS7;



            // Step 4. Convert the input string to a byte[]
            byte[] DataToEncrypt = UTF8.GetBytes(Message);



            // Step 5. Attempt to encrypt the string
            try
            {
                ICryptoTransform Encryptor = TDESAlgorithm.CreateEncryptor();
                Results = Encryptor.TransformFinalBlock(DataToEncrypt, 0, DataToEncrypt.Length);
            }
            finally
            {
                // Clear the TripleDes and Hashprovider services of any sensitive information
                TDESAlgorithm.Clear();
                HashProvider.Clear();
            }



            // Step 6. Return the encrypted string as a base64 encoded string



            string enc = Convert.ToBase64String(Results);
            enc = enc.Replace("+", "KkKkK");
            enc = enc.Replace("/", "JjJjJ");
            enc = enc.Replace("\\", "IiIiI");
            return enc;
        }

        protected void btn_alterar_Click(object sender, EventArgs e)
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
                ((Label)e.Item.FindControl("lbl_data")).Text = Convert.ToDateTime(dr["data"]).ToShortDateString();
                byte[] binaryData = (byte[])dr["binarios"];
                string image_string = Convert.ToBase64String(binaryData);
                ((Image)e.Item.FindControl("img_texto")).ImageUrl = String.Format($"data:image/.jpg;base64,{image_string}");
                ((ImageButton)e.Item.FindControl("btn_apagar")).CommandArgument = dr["id_texto"].ToString();

                ((ImageButton)e.Item.FindControl("btn_editar")).CommandArgument = dr["id_texto"].ToString();
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
           
            myCommand.Parameters.AddWithValue("@data", DateTime.Now.ToString("M/d/yyyy"));
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

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lbl_info.Visible = true;
            if (e.CommandName == "btn_apagar")
            {
                SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Mybook"].ConnectionString);

                SqlCommand myCommand = new SqlCommand();

                myCommand.Parameters.AddWithValue("@id_texto", Convert.ToInt32(((ImageButton)e.Item.FindControl("btn_apagar")).CommandArgument));

                SqlParameter retorno = new SqlParameter();
                retorno.ParameterName = "@retorno";
                retorno.Direction = ParameterDirection.Output;
                retorno.SqlDbType = SqlDbType.Int;
                myCommand.Parameters.Add(retorno);

                myCommand.CommandType = CommandType.StoredProcedure;
                myCommand.CommandText = "eliminar_texto";

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
            if (e.CommandName == "btn_editar")
            {
                //DataRowView dr = (DataRowView)e.Item.DataItem;
                //((TextBox)e.Item.FindControl("txt_titulo")).Text = "OLA";
                Session["id_passar"] = e.CommandArgument;
                RepeaterModalEditar.DataBind();

                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
            }
        }

        protected void RepeaterModalEditar_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                ((DropDownList)e.Item.FindControl("dpr_genero")).SelectedValue = dr["id_generos_livro"].ToString();
                ((TextBox)e.Item.FindControl("txt_titulo2")).Text = dr["titulo"].ToString();
                ((TextBox)e.Item.FindControl("txt_resumo2")).Text = dr["resumo"].ToString();
                ((TextBox)e.Item.FindControl("txt_texto2")).Text = dr["texto"].ToString();
                ((Literal)e.Item.FindControl("literal1")).Text = dr["texto"].ToString();
                
                ((Button)e.Item.FindControl("btn_EditarTexto")).CommandArgument = dr["id_texto"].ToString();


            }
                
        }

        protected void RepeaterModalEditar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btn_EditarTexto")
            {
     

                    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    SqlCommand myCommand = new SqlCommand();

                /*Stream imgStream = FileUpload1.PostedFile.InputStream;

                int tamanho_array = FileUpload1.PostedFile.ContentLength;

                byte[] imgBinaryData = new byte[tamanho_array];

                imgStream.Read(imgBinaryData, 0, tamanho_array);*/

                    myCommand.Parameters.AddWithValue("@id_texto", e.CommandArgument);
                    myCommand.Parameters.AddWithValue("@titulo", ((TextBox)e.Item.FindControl("txt_titulo2")).Text);
                    myCommand.Parameters.AddWithValue("@resumo", ((TextBox)e.Item.FindControl("txt_resumo2")).Text);
                    myCommand.Parameters.AddWithValue("@texto", ((TextBox)e.Item.FindControl("txt_texto2")).Text);
                    myCommand.Parameters.AddWithValue("@id_generos_livro", ((DropDownList)e.Item.FindControl("dpr_genero")).SelectedValue);


                    /*
                    if( FileUpload1.HasFile == true)
                    {
                        myCommand.Parameters.AddWithValue("@binarios", imgBinaryData);
                    }
                    else
                    {
                        
                        myCommand.Parameters.AddWithValue("@binarios", imgBinaryData);
                       
                    }  */

                    SqlParameter retorno = new SqlParameter();
                    retorno.ParameterName = "@retorno";
                    retorno.Direction = ParameterDirection.Output;
                    retorno.SqlDbType = SqlDbType.Int;
                    myCommand.Parameters.Add(retorno);

                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "atualizar_texto";

                    myCommand.Connection = myConn;
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                    myConn.Close();

                    lbl_atualizar_texto.Visible = true;
                    lbl_atualizar_texto.Attributes.Add("class", "alert alert-success");
                    lbl_atualizar_texto.Text = $"Texto alterado com sucesso!";
                    RepeaterModalEditar.DataBind();
                    Repeater1.DataBind();


            }
        }
        
    }
}