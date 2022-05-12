<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Mybook.Perfil" %>
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

   
    .form-control:hover
    {
         border: solid 1px #fe5823
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
   





        
     <section id="team" data-stellar-background-ratio="1">
          <div class="container">
               <div class="row">
                    <div class="col-md-6 col-sm-6">
                         <div class="about-info">
                              <h2 class="wow fadeInUp" data-wow-delay="0.1s">MyText</h2>                  
                             <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>
                            
                             
                              <!-- Botão Modal -->
                    <div class="container">
  
                    <!-- Button to Open the Modal -->
                    <div runat="server" id="teste1" style="visibility:hidden"> 
                   <button type="button" class="btn1" data-toggle="modal" data-target="#myModal1" id="testemodal">
                    Adicionar Texto
                    </button></div>

                     <!-- The Modal -->
                    <div class="modal" id="myModal1">
                    <div class="modal-dialog">
                    <div class="modal-content">
      
                    <!-- Modal Header -->
                    <div class="modal-header">
                    <h4 class="modal-title">Adicionar Texto</h4>
                    </div>                 
                    <!-- Modal body -->
                    <div class="modal-body">
                    <div>
                         <div class="mb-3">
                    <label for="message-genero" class="col-form-label">Género</label><br />
                         <asp:DropDownList ID="dpr_genero" runat="server" DataSourceID="SqlDataSourceGenero" DataTextField="generos_livro" DataValueField="id_generos_livro"></asp:DropDownList>
                    </div>
                        <br />
                        <div class="mb-3">
                            <asp:FileUpload ID="FileUpload1" runat="server" /></div>
                    <div class="mb-3">
                    <label for="recipient-name" class="col-form-label">Titulo</label>
                      <asp:TextBox ID="txt_titulo" class="form-control" runat="server" ></asp:TextBox>
                    </div>
                    <div class="mb-3">
                    <label for="message-text" class="col-form-label">Resumo</label>
                      <asp:TextBox ID="txt_resumo" class="form-control" runat="server" MaxLength="200" TextMode="MultiLine" Rows="5" style = "resize:none"></asp:TextBox>
                    </div>
                     <div class="mb-3">
                    <label for="message-text" class="col-form-label">Texto</label>
                         <script src="ckeditor/ckeditor.js"></script>
                      <asp:TextBox ID="txt_texto" class="form-control" runat="server" TextMode="MultiLine" Rows="10" style = "resize:none"></asp:TextBox>
                         <script>
                                            CKEDITOR.replace('<%=txt_texto.ClientID%>',
                                                {
                                                    customConfig: 'ckeditor/custom/editor_config.js'
                                                }
                                            ); //tem que se por ValidateRequest="false" la em cima

                         </script>
                    </div>
                    
                    </div>
                    </div>
                    <br />
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <asp:Button ID="btn_adicionar" class="btn btn-bordered" runat="server" Text="Adicionar" CommandName="btn_adicionar" OnClick="btn_adicionar_Click" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                    </div>
                        
                         
                    </div>
                    </div>
                    </div>
  
                    </div>
                             </div>
                        
                        <br />
                    </div>

                        
                    <div class="clearfix">

                    </div>
                   <div><p>O Mybook é uma página referenciada aos textos que o criador do website foi desenvolvendo ao longo do tempo, para que, deste modo, possam servir de inspiração para todos os que lêem.
                            Nesta página conseguem retirar várias ideias, cativando a escrever sobre o que mais fizer sentido.
                        </p></div>
                   <br />
                   <asp:Label ID="lbl_mensagem" runat="server"  class="" role="alert" Text="" Visible="False"></asp:Label>  


                       <asp:SqlDataSource ID="SqlDataSourceGenero" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tab_generos_livro]"></asp:SqlDataSource>

         <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSourceTextos" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
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
         <asp:ImageButton ID="btn_editar" ImageUrl="images/editar.png"  runat="server" width="20" height="20" /><asp:ImageButton ID="btn_apagar" ImageUrl="images/eliminar.png" runat="server" width="20" height="20" />

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
        
         <asp:ImageButton ID="btn_editar" ImageUrl="images/editar.png"  runat="server" width="20" height="20" /><asp:ImageButton ID="btn_apagar" ImageUrl="images/eliminar.png" runat="server" width="20" height="20" />
        

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

        <asp:SqlDataSource ID="SqlDataSourceTextos" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tab_texto.id_texto, tab_texto.id_pessoa, tab_pessoa.nome, tab_pessoa.email, tab_texto.titulo, tab_texto.resumo, tab_generos_livro.generos_livro, tab_texto.binarios, tab_texto.data FROM     tab_generos_livro INNER JOIN tab_texto ON tab_generos_livro.id_generos_livro = tab_texto.id_generos_livro INNER JOIN tab_pessoa ON tab_texto.id_pessoa = tab_pessoa.id_pessoa where tab_pessoa.email=@email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="email" />
            </SelectParameters>
        </asp:SqlDataSource>


            </div>
          </div>


     </section> 
    


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
