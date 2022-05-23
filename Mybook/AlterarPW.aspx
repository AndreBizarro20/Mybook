<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlterarPW.aspx.cs" Inherits="Mybook.AlterarPWaspx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/Login.css"/>
</head>
<body>
    <form id="form1" runat="server">
      
        <div id="login-box">
                     <section class="preloader">
          <div class="spinner">

               <span class="spinner-rotate"></span>
               
          </div>
                    </section>
  <div class="left">
    <h1>Recuperação de palavra-passe</h1>
      <br />

      <asp:TextBox ID="tb_email" placeholder="E-mail" runat="server"></asp:TextBox>
     
      <br />
      
      

      <asp:Button ID="btn_alterar" runat="server" Text="Alterar" OnClick="btn_alterar_Click" />

      
  </div>
  <div class="right">
    
      <div> 
          <a href="Index.aspx">
           <img src="images/logo icon.png" class="logoregisto"/>
          </a>
      </div>

      <asp:Button ID="btn_login" runat="server" CausesValidation="false" Text="Login" OnClick="btn_login_Click"/>
  </div>
          
  <div class="or">OU</div>
</div>
        <div style="padding-left:45%">
            <asp:Label ID="lbl_info" runat="server" role="alert" Text="" Visible="False"></asp:Label>  
        </div>
    </form>
</body>
</html>
