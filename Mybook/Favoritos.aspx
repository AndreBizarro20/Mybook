<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="Mybook.Favoritos" %>
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
                              <h2 class="wow fadeInUp" data-wow-delay="0.1s">Favoritos</h2>                  
                             <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>
                     </div>
                    <div class="clearfix">

                    </div>
                            <div>
                                 <asp:Label ID="lbl_info" runat="server" role="alert" Text="" Visible="False"></asp:Label>  
                           </div>
                             </div>
                   <br />
                       


     <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource2" runat="server" OnitemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
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
                  <asp:ImageButton ID="btn_verPerfil" ImageUrl="images/icon_pessoa.png" commandName="btn_verPerfil" runat="server" width="20" height="20" alt="user__image" class="user__image" /><asp:Label ID="lbl_autor" runat="server" Text=""></asp:Label><asp:ImageButton ID="btn_favorito" ImageUrl="images/Favorite_black_25px.png" runat="server" Width="20px" Height="20px" CommandName="btn_favorito" /><asp:ImageButton ID="btn_texto" runat="server" ImageUrl="images/literature_25px.png" Width="17px" Height="17px"/></h5>
       </div>       
         </div>
        <div class="card__footer">
             <div class="user">
                <small><asp:Label ID="lbl_data" runat="server" Text=""></asp:Label></small>
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
                  <asp:ImageButton ID="btn_verPerfil" ImageUrl="images/icon_pessoa.png" commandName="btn_verPerfil" runat="server" width="20" height="20" alt="user__image" class="user__image" /><asp:Label ID="lbl_autor" runat="server" Text=""></asp:Label><asp:ImageButton ID="btn_favorito" ImageUrl="images/Favorite_black_25px.png" runat="server" Width="20px" Height="20px" CommandName="btn_favorito" /><asp:ImageButton ID="btn_texto" runat="server" ImageUrl="images/literature_25px.png" Width="17px" Height="17px"/></h5>
       </div>       
         </div>
        <div class="card__footer">
             <div class="user">
                <small><asp:Label ID="lbl_data" runat="server" Text=""></asp:Label></small>
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

                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tab_texto.titulo,tab_texto.resumo, tab_texto.binarios, tab_texto.data, tab_pessoa.nome, tab_generos_livro.generos_livro, tab_favorito.id_favorito, tab_favorito.id_pessoa, tab_favorito.id_texto FROM tab_texto INNER JOIN tab_pessoa ON tab_texto.id_pessoa = tab_pessoa.id_pessoa INNER JOIN tab_generos_livro ON tab_texto.id_generos_livro = tab_generos_livro.id_generos_livro INNER JOIN tab_favorito ON tab_texto.id_texto = tab_favorito.id_texto  where tab_favorito.id_pessoa=@id_pessoa">
                       <SelectParameters>
                           <asp:SessionParameter DefaultValue="" Name="id_pessoa" SessionField="id_pessoa" Type="Int32" />
                       </SelectParameters>
                    </asp:SqlDataSource>

                   </div>
              </div>
         

         </section>
</asp:Content>


