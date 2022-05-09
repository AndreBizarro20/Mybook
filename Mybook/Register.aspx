<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Mybook.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/Register.css">
</head>
<body>

    <form id="form1" runat="server">
        <div id="login-box">
  <div class="left">
    <h1>Regista-te</h1>


     <asp:TextBox ID="tb_name" placeholder="Nome" runat="server"></asp:TextBox>


      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*NOME OBRIGATORIO*" ControlToValidate="tb_name" ForeColor="Red">*</asp:RequiredFieldValidator>

      <asp:TextBox ID="tb_apelido" placeholder="Apelido" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*APELIDO OBRIGATORIO*" ControlToValidate="tb_apelido" ForeColor="Red">*</asp:RequiredFieldValidator>
      <asp:TextBox ID="tb_email" placeholder="Email" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*EMAIL OBRIGATORIO*" ControlToValidate="tb_email" ForeColor="Red">*</asp:RequiredFieldValidator>
      <asp:TextBox ID="tb_password" placeholder="Palavra-Passe" runat="server"  TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*PALAVRA-PASSE OBRIGATORIA*" ControlToValidate="tb_password" ForeColor="Red">*</asp:RequiredFieldValidator>
      <asp:CompareValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*As palavras-passes não coincidem*" ControlToValidate="tb_confirm_password" ControlToCompare="tb_password" ForeColor="Red" Text="*"></asp:CompareValidator>
      <asp:TextBox ID="tb_confirm_password" placeholder="Confirmar Palavra-Passe" runat="server" TextMode="Password"></asp:TextBox>

      

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Mybook %>" SelectCommand="SELECT * FROM [tab_genero]"></asp:SqlDataSource>

    <asp:Button ID="btn_entrar" type="submit" runat="server" Text="Registar" OnClick="btn_entrar_Click" />
  </div>

  <div class="right">
    
      <div>
          <a href="Index.aspx">
           <img src="images/logo icon.png" class="logoregisto"/>
           </a>
          <asp:TextBox ID="TextBox2" placeholder="Genero" runat="server" Enabled="false"></asp:TextBox>
          <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="genero" DataValueField="id_genero" Font-Bold="False"></asp:RadioButtonList><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*GENERO OBRIGATORIO*" ControlToValidate="RadioButtonList1" ForeColor="Red">*</asp:RequiredFieldValidator>
          <asp:TextBox ID="TextBox3" placeholder="Distrito" runat="server" Enabled="false"></asp:TextBox><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="cidade" DataValueField="id_cidade"></asp:DropDownList><asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*CAMPO OBRIGATORIO*" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Mybook %>" SelectCommand="SELECT * FROM [tab_cidade]"></asp:SqlDataSource>
      </div>
                  
                  <asp:Button ID="btn_voltar" class="voltar" CausesValidation="false" runat="server" Text="Iniciar sessão" OnClick="btn_voltar_Click" />

  </div>

</div>
        <div style="margin-left:44%">
        <asp:ValidationSummary ID="ValidationSummary1" Width="300px" class="alert alert-danger" role="alert" runat="server" ForeColor="Red"/>
        </div>
        <div style="margin-left:44%">
            <asp:Label ID="lbl_mensagem" runat="server"  class="alert alert-danger" role="alert" Text="" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>
