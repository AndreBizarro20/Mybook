using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
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

                ((Label)e.Item.FindControl("lbl_perfil")).Text= dr["perfil"].ToString();
                ((DropDownList)e.Item.FindControl("txt_cidade")).SelectedValue = dr["id_cidade"].ToString();
                ((DropDownList)e.Item.FindControl("txt_genero")).SelectedValue = dr["id_genero"].ToString();
                ((Button)e.Item.FindControl("btn_update")).CommandArgument = dr["id_pessoa"].ToString();
                ((Button)e.Item.FindControl("btn_alterar")).CommandArgument = dr["id_pessoa"].ToString();

                if (dr["id_genero"].ToString() == "1")
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/male.png";

                } else if (dr["id_genero"].ToString() == "2")
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/female.png";
                } else
                {
                    ((Image)e.Item.FindControl("img_peca")).ImageUrl = "images/outro.jpeg";
                }

               


            }
        }


        protected void RepeaterPerfil_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btn_update")
            {

                try
                {
                    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    SqlCommand myCommand = new SqlCommand();

                    myCommand.Parameters.AddWithValue("@id_pessoa", ((Button)e.Item.FindControl("btn_update")).CommandArgument);
                    myCommand.Parameters.AddWithValue("@nome", ((TextBox)e.Item.FindControl("txt_nome")).Text);
                    myCommand.Parameters.AddWithValue("@apelido", ((TextBox)e.Item.FindControl("txt_apelido")).Text);
                    myCommand.Parameters.AddWithValue("@email", ((TextBox)e.Item.FindControl("txt_email")).Text);
                   // myCommand.Parameters.AddWithValue("@ativo", ((DropDownList)e.Item.FindControl("txt_ativo")).SelectedValue);
                    myCommand.Parameters.AddWithValue("@id_genero", ((DropDownList)e.Item.FindControl("txt_genero")).SelectedValue);
                    myCommand.Parameters.AddWithValue("@id_cidade", ((DropDownList)e.Item.FindControl("txt_cidade")).SelectedValue);

                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "atualizar_perfil";

                    myCommand.Connection = myConn;
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                    myConn.Close();

                    lbl_info.Visible = true;
                    lbl_info.Text = "Perfil alterado com sucesso!";
                }
                catch (Exception)
                {

                }


            }
            if (e.CommandName == "btn_alterar")
            {
                if (((TextBox)e.Item.FindControl("txt_pw")).Text == ((TextBox)e.Item.FindControl("txt_pw2")).Text && ((TextBox)e.Item.FindControl("txt_pw")).Text != null)
                {
                    SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                    SqlCommand myCommand = new SqlCommand();


                    myCommand.Parameters.AddWithValue("@id_pessoa", ((Button)e.Item.FindControl("btn_alterar")).CommandArgument);
                    myCommand.Parameters.AddWithValue("@pass", EncryptString(((TextBox)e.Item.FindControl("txt_pw")).Text));


                    myCommand.CommandType = CommandType.StoredProcedure;
                    myCommand.CommandText = "atualizar_pw";

                    myCommand.Connection = myConn;
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                    myConn.Close();

                    lbl_info.Visible = true;
                    lbl_info.Text = "Palavra-passe alterada com sucesso!";
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
    }
}