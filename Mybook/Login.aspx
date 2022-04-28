<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Mybook.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/Login.css">
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
            <asp:Label ID="lbl_mensagem" runat="server" Text="" ForeColor="Red"></asp:Label>
      <br />

      <asp:TextBox ID="tb_email" placeholder="E-mail" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*CAMPO OBRIGATORIO*" ControlToValidate="tb_email" ForeColor="Red"></asp:RequiredFieldValidator>
      <asp:TextBox ID="tb_password" placeholder="Palavra-Passe" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*CAMPO OBRIGATORIO*" ControlToValidate="tb_password" ForeColor="Red"></asp:RequiredFieldValidator>
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
      <!--
      <div style="position:absolute; top:260px; ">
      <asp:Button ID="vtn_voltar" runat="server" Text="Voltar" CausesValidation="false" OnClick="vtn_voltar_Click"/>

      </div>
    <!--<input type="voltar" name="back" value="Voltar"/> -->
  </div>
          
  <div class="or">OU</div>

           
</div>
    </form>
</body>
</html>
