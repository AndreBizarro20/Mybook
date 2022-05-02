<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Mybook.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       
    <style>
        body {
    background: rgb(99, 39, 120)
}

.form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
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
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 11px
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
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
<div >
		


   <asp:Repeater ID="RepeaterPerfil" DataSourceID="SqlDataSourcePerfil" runat="server" OnItemCommand="RepeaterPerfil_ItemCommand" OnItemDataBound="RepeaterPerfil_ItemDataBound">
        <HeaderTemplate>

        </HeaderTemplate>
        <ItemTemplate>
             <div class="container rounded bg-white mt-5 mb-5">
                
        
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><asp:Image ID="img_peca" runat="server" class="rounded-circle mt-5" width="150px"/><br /><span class="font-weight-bold"><asp:Label ID="txt_utilizador" runat="server" ></asp:Label></span><span class="text-black-50"></span><span> </span></div>
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
                <br /><div class="mt-5 text-center"><asp:Button ID="btn_update" class="btn btn-bordered" runat="server" Text="Update" CommandName="btn_update" />
                     <asp:Button ID="btn_alterar" class="btn btn-bordered" runat="server" Text="Alterar palavra-passe" CommandName="btn_alterar"/>

                      </div>
                 
            </div>

        </div>
        <!--<div class="col-md-4">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center experience"><span><h4 class="text-right">Mudar Palavra-passe</h4></span></div><br>
                <div class="col-md-12"><label class="labels">Nova palavra-passe</label> <asp:TextBox ID="txt_pw" class="form-control" placeholder="Palavra-passe" runat="server" TextMode="Password" Text="*"></asp:TextBox></div>
                <br />
                <div class="col-md-12"><label class="labels">Confirme palavra-passe</label><asp:TextBox ID="txt_pw2" class="form-control" placeholder=" Confirme Palavra-passe" runat="server" TextMode="Password" Text="*"></asp:TextBox></div>
            </div>
        </div>-->
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
    
 


                    </div>
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

     
    <div class="mt-5 text-center"><asp:Label ID="lbl_info" runat="server" Text="" Visible="False"></asp:Label></div>
</asp:Content>
