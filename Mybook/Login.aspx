<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mybook.Login" %>

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
    <h1>Inicio de Sessão</h1>
      <br />

      <asp:TextBox ID="tb_email" placeholder="E-mail" runat="server"></asp:TextBox>
      <asp:TextBox ID="tb_password" placeholder="Palavra-Passe" runat="server" TextMode="Password"></asp:TextBox>
      <br />
      <asp:Button ID="btn_entrar" runat="server" Text="Entrar" OnClick="btn_entrar_Click" />

      
     
      
  </div>
  <div class="right">
    
      <div> 
          <a href="Index.aspx">
           <img src="images/logo icon.png" class="logoregisto"/>
          </a>
      </div>

      <asp:Button ID="btn_register" runat="server" CausesValidation="false" Text="Criar conta" OnClick="btn_register_Click" />
  </div>
          
  <div class="or">OU</div>
</div>
        <div style="padding-left:45%">
            <asp:Label ID="lbl_info" runat="server" role="alert" Text="" Visible="False"></asp:Label>  
        </div>
    </form>
</body>
</html>
