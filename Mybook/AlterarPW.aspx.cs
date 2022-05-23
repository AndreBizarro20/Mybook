using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mybook
{
    public partial class AlterarPWaspx : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_info.Visible = false;
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btn_alterar_Click(object sender, EventArgs e)
        {
            SqlConnection myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["Mybook"].ConnectionString);

            SqlCommand myCommand = new SqlCommand();

            myCommand.Parameters.AddWithValue("@email", tb_email.Text);
            myCommand.Parameters.AddWithValue("@pass", EncryptString(pw));

            SqlParameter retorno = new SqlParameter();
            retorno.ParameterName = "@retorno";
            retorno.Direction = ParameterDirection.Output;
            retorno.SqlDbType = SqlDbType.Int;
            myCommand.Parameters.Add(retorno);




            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.CommandText = "recuperar_pw";

            myCommand.Connection = myConn;
            myConn.Open();
            myCommand.ExecuteNonQuery();
            int respostaRetorno = Convert.ToInt32(myCommand.Parameters["@retorno"].Value);



            myConn.Close();

            lbl_info.Visible = true;
            if (respostaRetorno == 1)
            {
                
                lbl_info.Attributes.Add("class", "alert alert-success");
                lbl_info.Text = "A NOVA PALAVRA-PASSE FOI ENVIADA PARA O SEU EMAIL";
                enviaMail();
            }
            else if (respostaRetorno == 2)
            {
                
                lbl_info.Attributes.Add("class", "alert alert-danger");
                lbl_info.Text = "CONTA NÃO EXISTE ";

            }
        }

        private void enviaMail()
        {
            MailMessage mail = new MailMessage();
            SmtpClient smtp = new SmtpClient();

            mail.From = new MailAddress("geral@mybook.com");
            mail.To.Add(new MailAddress(tb_email.Text));
            mail.Subject = "Ativacao";
            mail.IsBodyHtml = true;

            mail.Body = $"A sua nova pw é a {pw}";

            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new NetworkCredential("Testesbizarro@gmail.com", "ABC123abc");

            smtp.EnableSsl = true;
            smtp.Send(mail);
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
        public static string GerarPW(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        public static string pw = GerarPW(5);
    }
}