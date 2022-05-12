<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ver_perfil.aspx.cs" Inherits="Mybook.Ver_perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="css/myBook.css">
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
  

    .btn1:hover 
    {
    transform: translateY(-5px);
    }
    .form-control:hover
    {
         border: solid 1px #fe5823
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="page-content-wrapper sp-y">
        <div class="blog-page-content-wrap">
            <div class="container container-wide">
                <div class="row">

		


   <asp:Repeater ID="RepeaterPerfil" DataSourceID="SqlDataSourcePerfil" runat="server" OnItemDataBound="RepeaterPerfil_ItemDataBound">
        <HeaderTemplate>

        </HeaderTemplate>
        <ItemTemplate>
             <div class="container rounded bg-white mt-5 mb-5">
                
        
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><asp:Image ID="img_peca" runat="server" class="rounded-circle mt-5" width="150px"/>

            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-center">Perfil <asp:Label ID="lbl_perfil" runat="server" Text=""></asp:Label></h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Nome</label>
        <asp:Label ID="txt_nome" class="form-control"  runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-6"><label class="labels">Apelido</label><asp:Label ID="txt_apelido" class="form-control" runat="server" Text=""></asp:Label></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Genero</label><asp:Label ID="txt_genero" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="genero" DataValueField="id_genero" Text=""></asp:Label></div>
                    <div class="col-md-6"><label class="labels">Cidade</label><asp:Label ID="txt_cidade" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="cidade" DataValueField="id_cidade" Text=""></asp:Label></div>
                </div>
                <br />
            </div>

        </div>
    
    </div>
                 
</div>
             </div>

        </ItemTemplate>
        <FooterTemplate>

        </FooterTemplate>
    </asp:Repeater>
          
                    
    <asp:SqlDataSource ID="SqlDataSourcePerfil" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tab_pessoa.id_pessoa, tab_pessoa.nome,tab_pessoa.email, tab_pessoa.apelido, tab_genero.genero, tab_cidade.cidade FROM tab_cidade INNER JOIN tab_pessoa ON tab_cidade.id_cidade = tab_pessoa.id_cidade INNER JOIN tab_genero ON tab_pessoa.id_genero = tab_genero.id_genero WHERE  (tab_pessoa.id_pessoa= @ver_perfil)">
        <SelectParameters>
            <asp:SessionParameter Name="ver_perfil" SessionField="ver_perfil" />
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

                               <div>
                                 <asp:Label ID="Label1" runat="server" role="alert" Text="" Visible="False"></asp:Label>  
                           </div>
      <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnitemDataBound="Repeater1_ItemDataBound">
                      <HeaderTemplate>
                           <section id="team" data-stellar-background-ratio="1">

                    <div class="container">
               <div class="row">
                       </HeaderTemplate>
                       <ItemTemplate>
                            <div class="col-md-4 col-sm-6">
  <div class="card">
    <div class="card__header">
        <asp:Image ID="img_texto" runat="server" alt="card__image" class="card__image" width="300"  Height="100"/>
    </div>
    <div class="card__body">
      <span id="id_cliente" class="tag tag-red" runat="server">
          <asp:Label ID="lbl_genero" runat="server" Text=""></asp:Label></span>
      <h4>
          <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h4>
      <p>
          <asp:Label ID="lbl_resumo" runat="server" Text="" Height="300"></asp:Label></p>
    </div>
      <br />
      <br />
    <div class="card__footer">
      <div class="user">
            <asp:ImageButton ID="btn_texto" runat="server" ImageUrl="images/literature_25px.png" Width="17px" Height="17px"/><asp:ImageButton ID="btn_favorito" ImageUrl="images/Favorite_25px.png" runat="server" Width="20px" Height="20px" CommandName="btn_favorito" />

        <div class="user__info">
          <small>
              <br />
              <asp:Label ID="lbl_data" runat="server" Text=""></asp:Label></small>
        </div>
      </div>
    </div>
  </div>
                       </div>
                          
                       </ItemTemplate>



                       <AlternatingItemTemplate>
                             <div class="col-md-4 col-sm-6">
  <div class="card">
    <div class="card__header">
        <asp:Image ID="img_texto" runat="server" alt="card__image" class="card__image" width="300"  Height="100"/>
    </div>
    <div class="card__body">
      <span id="id_cliente" class="tag tag-red" runat="server">
          <asp:Label ID="lbl_genero" runat="server" Text=""></asp:Label></span>
      <h4>
          <asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h4>
      <p>
          <asp:Label ID="lbl_resumo" runat="server" Text="" Height="300"></asp:Label></p>
    </div>
      <br />
      <br />
    <div class="card__footer">
      <div class="user">
            <asp:ImageButton ID="btn_texto" runat="server" ImageUrl="images/literature_25px.png" Width="17px" Height="17px"/><asp:ImageButton ID="btn_favorito" ImageUrl="images/Favorite_25px.png" runat="server" Width="20px" Height="20px" CommandName="btn_favorito" />

        <div class="user__info">
          <small>
              <br />
              <asp:Label ID="lbl_data" runat="server" Text=""></asp:Label></small>
        </div>
      </div>
    </div>
  </div>
                       </div>
                          
                          
                       </AlternatingItemTemplate>


                       <FooterTemplate>
                           </div>
                        </div>
    </section>
                       </FooterTemplate>
                   </asp:Repeater>

                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tab_texto.id_texto, tab_texto.id_pessoa, tab_pessoa.nome, tab_texto.titulo, tab_texto.resumo, tab_generos_livro.generos_livro, tab_texto.binarios, tab_texto.data FROM     tab_generos_livro INNER JOIN tab_texto ON tab_generos_livro.id_generos_livro = tab_texto.id_generos_livro INNER JOIN tab_pessoa ON tab_texto.id_pessoa = tab_pessoa.id_pessoa where tab_texto.id_pessoa=@ver_perfil">
                       <SelectParameters>
                           <asp:SessionParameter Name="ver_perfil" SessionField="ver_perfil" />
                       </SelectParameters>
     </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tab_generos_livro]"></asp:SqlDataSource>


</asp:Content>
