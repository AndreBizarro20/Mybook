<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Mybook.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       
    <style>
        body {
    background: white;
}

.form-control:focus {
    box-shadow: none;
    border-color: #fe5823
}
/*
.profile-button {
    background: rgb(99, 39, 120);
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #682773
}

.profile-button:focus {
    background: #682773;
    box-shadow: none
}

.profile-button:active {
    background: #682773;
    box-shadow: none
}
*/
.back:hover {
    color: #fe5823;
    cursor: pointer
}

.labels {
    font-size: 11px
}

.add-experience:hover {
    background: #fe5823;
    color: #fff;
    cursor: pointer;
    border: solid 1px #fe5823
}


.btn1
{
    background: #fe5823;
    border: 0;
    border-radius: 3px;
    color: #ffffff;
    font-size: inherit;
    font-weight: 500;
    padding: 8px 10px;
    transition: transform 0.1s ease-in;
    transform: translateX(0);
}

.btn1:hover {
    transform: translateY(-5px);
  }
    </style>


 


 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
  



    <!--== End Page Header Area ==-->

    <!--== Start Page Content Wrapper ==-->
    <div class="page-content-wrapper sp-y">
        <div class="blog-page-content-wrap">
            <div class="container container-wide">
                <div class="row">

		


   <asp:Repeater ID="RepeaterPerfil" DataSourceID="SqlDataSourcePerfil" runat="server" OnItemCommand="RepeaterPerfil_ItemCommand" OnItemDataBound="RepeaterPerfil_ItemDataBound">
        <HeaderTemplate>

        </HeaderTemplate>
        <ItemTemplate>
             <div class="container rounded bg-white mt-5 mb-5">
                
        
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><asp:Image ID="img_peca" runat="server" class="rounded-circle mt-5" width="150px"/><br /><span class="font-weight-bold"><asp:Label ID="txt_utilizador" runat="server" ></asp:Label></span><span class="text-black-50"></span><span> </span>

            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-center">Perfil <asp:Label ID="lbl_perfil" runat="server" Text=""></asp:Label></h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Nome</label>
        <asp:TextBox ID="txt_nome" class="form-control" placeholder="Nome" Text="" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6"><label class="labels">Apelido</label><asp:TextBox ID="txt_apelido" class="form-control" placeholder="Apelido"  runat="server"></asp:TextBox></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Email</label><asp:TextBox ID="txt_email" class="form-control" placeholder="Email" Text="" runat="server"></asp:TextBox></div>
                   
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Genero</label><asp:DropDownList ID="txt_genero" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="genero" DataValueField="id_genero"></asp:DropDownList></div>
                    <div class="col-md-6"><label class="labels">Cidade</label> <asp:DropDownList ID="txt_cidade" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="cidade" DataValueField="id_cidade"></asp:DropDownList></div>
                </div>
                <br />
                <div style="padding-left:40%">
                <asp:Button ID="btn_update" class="btn1" runat="server" Text="Update" CommandName="btn_update" />
                   </div>
                <br />
                <div style="padding-left:25%" >

                     <!-- Botão Modal -->
                    <div class="container">
  
                    <!-- Button to Open the Modal -->
                    
                   <button type="button" class="btn1" data-toggle="modal" data-target="#myModal">
                    Alterar palavra-passe
                    </button>

                     <!-- The Modal -->
                    <div class="modal" id="myModal">
                    <div class="modal-dialog">
                    <div class="modal-content">
      
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">Alteração de palavra-passe</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                    <label class="labels">Palavra-passe atual</label> <asp:TextBox ID="txt_pw" class="form-control" placeholder="Palavra-passe atual" runat="server" TextMode="Password" Text="*"></asp:TextBox>
                    <br />
                    <label class="labels">Nova palavra-passe</label><asp:TextBox ID="txt_pw2" class="form-control" placeholder=" Nova Palavra-passe" runat="server" TextMode="Password" Text="*"></asp:TextBox>
                    </div>
                    <br />
                  
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <asp:Button ID="btn_alterar" class="btn btn-bordered" runat="server" Text="Alterar" CommandName="btn_alterar"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    </div>
                      
                    </div>
                    </div>
                    </div>
  
                    </div>

                </div>
                 
            </div>

        </div>
    
    </div>
                 
</div>
             </div>

        </ItemTemplate>
        <FooterTemplate>

        </FooterTemplate>
    </asp:Repeater>
          
                    
    <asp:SqlDataSource ID="SqlDataSourcePerfil" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tab_pessoa.id_pessoa, tab_pessoa.nome, tab_pessoa.email, tab_pessoa.pass, tab_pessoa.apelido, tab_pessoa.id_cidade, tab_perfil.perfil, tab_pessoa.id_genero FROM     tab_perfil INNER JOIN tab_pessoa ON tab_perfil.id_perfil = tab_pessoa.id_perfil WHERE  (tab_pessoa.email = @email)">
        <SelectParameters>
            <asp:SessionParameter Name="email" SessionField="email" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tab_cidade]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tab_genero]"></asp:SqlDataSource>
                
 <!--==label de informação ==-->
                    <br /><br />
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:Label ID="lbl_info" runat="server"  class="" role="alert" Text="" Visible="False"></asp:Label>  
    
                    </div>
            </div>
        </div>
   
    <!--== Start Responsive Menu Wrapper ==-->
    <aside class="off-canvas-wrapper off-canvas-menu">
        <div class="off-canvas-overlay"></div>
        <div class="off-canvas-inner">
           
                <!-- Content Auto Generate Form Main Menu Here -->
                <div class="res-mobile-menu mobile-menu">

                </div>
            </div>
    </aside>
    <!--== End Responsive Menu Wrapper ==-->
    
   </div>


 
    
    



   
</asp:Content>
