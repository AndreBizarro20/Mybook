<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ler_texto.aspx.cs" Inherits="Mybook.ler_texto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="https://fonts.googleapis.com/css?family=Lovers+Quarrel" rel="stylesheet">
        <link rel="stylesheet" href="css/ler_texto.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />

<div class="book">
  <div id="pages" class="pages">
      <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" OnItemCommand="Repeater1_ItemCommand">
          <HeaderTemplate>
          
          </HeaderTemplate>
          <ItemTemplate>



      <div id="wrapper">
    <div id="container">

        <section class="open-book">
            <header>
                <h1><span id="id_cliente" class="tag tag-red" runat="server">
               <asp:Label ID="lbl_genero" runat="server" Text=""></asp:Label>
                   </span></h1>
                <h6><asp:Label ID="lbl_autor" runat="server" Text="Label"></asp:Label></h6>
                <h1><asp:Label ID="lbl_data" runat="server" Text=""></asp:Label></h1>
            </header>
            <article>
                <h2 class="chapter-title"><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
         <center><asp:Image style="width:350px; height:200px;" ID="img_texto" runat="server" /></center>
                <dl>
                    
                    <dt><h4><strong>Resumo</strong></h4></dt>
                    <dd style="text-align:center">
                        <em></em><br>
                       <asp:Label ID="lbl_resumo" runat="server" Text="" Width="300" Height="300"></asp:Label>
                    </dd>
                </dl>
                <p>
                    <asp:Literal ID="lt_texto" runat="server"></asp:Literal>
                   
                </p>
                
            </article>
            <footer>
                
                <ol id="page-numbers">
                    <li>1</li>
                    <li>2</li>
                </ol>
            </footer>
        </section>

    </div>
</div>
</div>
</div>
              </ItemTemplate>
          <FooterTemplate>

          </FooterTemplate>
          </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tab_texto.id_texto, tab_texto.titulo, tab_texto.binarios, tab_pessoa.nome, tab_generos_livro.generos_livro, tab_texto.link_video, tab_texto.texto, tab_texto.data, tab_texto.resumo FROM     tab_pessoa INNER JOIN tab_texto ON tab_pessoa.id_pessoa = tab_texto.id_pessoa INNER JOIN tab_generos_livro ON tab_texto.id_generos_livro = tab_generos_livro.id_generos_livro where id_texto=@id_texto">
        <SelectParameters>
            <asp:QueryStringParameter Name="id_texto" QueryStringField="id_texto" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
