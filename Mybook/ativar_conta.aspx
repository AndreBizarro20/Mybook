<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ativar_conta.aspx.cs" Inherits="Mybook.ativar_conta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link rel="stylesheet" type="text/css" href="empty_page/empty.css"/>
    <link rel="stylesheet" href="login/css/style.css"/>

    <style>
        .conta
        {
            text-align:center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
            <div class="conta">
                <br /><br /><br />
                    <div >  <img src="images/certo.png" width="130" height="130" class="img-fluid mb-4 mr-3"> </div>
                         <div >  <h3><strong>Conta ativada com sucesso.</strong></h3> </div>

                              <div ><h4>Lê um pouco dos textos e inspira o próximo</h4></div>


                    <div ><br /> <asp:Button ID="btn_ativar" class="section-btn btn btn-default smoothScroll" runat="server" Text="Pagina principal" OnClick="btn_ativar_Click" /></div>
                       
            </div>                       

</asp:Content>
