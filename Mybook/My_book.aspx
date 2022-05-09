<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" Debug="true" CodeBehind="My_book.aspx.cs" Inherits="Mybook.My_book" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/myBook.css">
    <style>
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

  





     <section id="team" data-stellar-background-ratio="1">
          <div class="container">
               <div class="row">
                    <div class="col-md-6 col-sm-6">
                         <div class="about-info">
                              <h2 class="wow fadeInUp" data-wow-delay="0.1s">Mybook</h2>                  
                             <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>
                            
                             
                              <!-- Botão Modal -->
                    <div class="container">
  
                    <!-- Button to Open the Modal -->
                    <div runat="server" id="teste1" style="visibility:hidden"> 
                   <button type="button" class="btn1" data-toggle="modal" data-target="#myModal" id="testemodal">
                    Adicionar Texto
                    </button></div>

                     <!-- The Modal -->
                    <div class="modal" id="myModal">
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
                         <asp:DropDownList ID="dpr_genero" runat="server" DataSourceID="SqlDataSource1" DataTextField="generos_livro" DataValueField="id_generos_livro"></asp:DropDownList>
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
                    <asp:Button ID="btn_adicionar" class="btn btn-bordered" runat="server" Text="Adicionar" CommandName="btn_adicionar" OnClick="btn_adicionar_Click"/>
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


                   <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource2" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
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
        <img src="images/icon_pessoa.png" width="20" height="20" alt="user__image" class="user__image">
        <div class="user__info">
          <h5>
              <asp:Label ID="lbl_autor" runat="server" Text=""></asp:Label></h5>
          <small>
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
        <img src="images/icon_pessoa.png" width="20" height="20" alt="user__image" class="user__image">
        <div class="user__info">
          <h5>
              <asp:Label ID="lbl_autor" runat="server" Text=""></asp:Label></h5>
          <small>
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


                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tab_texto.id_texto, tab_texto.id_pessoa, tab_pessoa.nome, tab_texto.titulo, tab_texto.resumo, tab_generos_livro.generos_livro, tab_texto.binarios, tab_texto.data FROM     tab_generos_livro INNER JOIN tab_texto ON tab_generos_livro.id_generos_livro = tab_texto.id_generos_livro INNER JOIN tab_pessoa ON tab_texto.id_pessoa = tab_pessoa.id_pessoa where tab_texto.id_pessoa='1'"></asp:SqlDataSource>

              </div>
          </div>


     </section> 
    



    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tab_generos_livro]"></asp:SqlDataSource>

</asp:Content>
