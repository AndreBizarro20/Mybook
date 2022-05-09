<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Mybook.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Isto é tudo o que vai aparecer nesta página -->

    <section id="home" class="slider" data-stellar-background-ratio="0.5">
          <div class="container">
               <div class="row">

                         <div class="owl-carousel owl-theme">
                              <div class="item item-first">
                                   <div class="caption">
                                        <div class="col-md-offset-1 col-md-10">
                                             <h3>Inspira-te nestas palavras destinadas para ti</h3>
                                             <h1>My Book</h1>
                                             <a href="My_book.aspx" class="section-btn btn btn-default smoothScroll">Vem aprender</a>
                                        </div>
                                   </div>
                              </div>

                              <div class="item item-second">
                                   <div class="caption">
                                        <div class="col-md-offset-1 col-md-10">
                                             <h3>Cria já o teu texto</h3>
                                             <h1>Your Book</h1>
                                             <a href="#about" class="section-btn btn btn-default btn-gray smoothScroll">Agarra-te ao teclado</a>
                                        </div>
                                   </div>
                              </div>

                              <div class="item item-third">
                                   <div class="caption">
                                        <div class="col-md-offset-1 col-md-10">
                                             <h3>Alguma questão sobre o tema ou texto?</h3>
                                             <h1>Faz-me uma pergunta</h1>
                                             <a href="#news" class="section-btn btn btn-default btn-orange smoothScroll">Questões</a>
                                        </div>
                                   </div>
                              </div>
                         </div>

               </div>
          </div>
     </section>


     
     <section id="about">
          <div class="container">
               <div class="row">

                    <div class="col-md-6 col-sm-6">
                         <div class="about-info">
                              <h2 class="wow fadeInUp" data-wow-delay="0.6s">Um pouco sobre mim</h2>
                              <div class="wow fadeInUp" data-wow-delay="0.8s">
                                  <p>Olá, sou o André Bizarro, tenho 20 anos e sou de Lisboa. Frequento o curso de licenciatura informática, no Instituto Superior de Tecnologias Avançadas.</p> 
                                  <p>Escrevo desde os catorze anos e como tal, quero inspirar-te a escreveres um pouco como eu e quem saiba no futuro, sejas tu quem me enisne.</p>
                                    <div class="contact-info">
                        <p><i class="fa fa-envelope-o"></i> <a href="#">andre.bizarro@my.istec.pt</a></p>
                                    </div>
                              </div>
                         </div>
                    </div>
                    
                    
               </div>
          </div>
     </section>




</asp:Content>
