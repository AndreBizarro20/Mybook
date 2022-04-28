<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="My_book.aspx.cs" Inherits="Mybook.My_book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <section id="team" data-stellar-background-ratio="1">
          <div class="container">
               <div class="row">
                    <div class="col-md-6 col-sm-6">
                         <div class="about-info">
                              <h2 class="wow fadeInUp" data-wow-delay="0.1s">Mybook</h2>                  
                             <asp:ScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ScriptManager>
                             <asp:Button ID="btn_criartexto" class="section-btn btn btn-default smoothScroll" runat="server" Text="Adicionar texto" OnClick="btn_criartexto_Click"/>
                            
                             
                             
                             <!--
                             <asp:Panel ID="panel_texto" runat="server">
                                 <asp:TextBox ID="tb_titulo" runat="server" placeholder="Titulo" Font-Size="Larger"></asp:TextBox>
                                 <br />
                                 <asp:TextBox ID="tb_resumo" runat="server" placeholder="Resumo" Font-Size="Larger" TextMode="MultiLine"></asp:TextBox>
                                 <br />
                                 <asp:TextBox ID="tb_texto" runat="server" placeholder="Texto" Font-Size="Larger"></asp:TextBox>
                                 <br />
                                 <asp:Button ID="btn_avançar" runat="server" Font-Size="Larger" Text="Avançar" />
                                 <ModalPopupExtender ID="ModalPopupextender1" TargetControlID="btn_criartexto" PopupControlID="panel_texto" runat="server"></ModalPopupExtender>
                             </asp:Panel>
                             -->



                             </div>
                        
                        <br />
                    </div>

                        
                    <div class="clearfix">

                    </div>
                   <div><p>O Mybook é uma página referenciada aos textos que o criador do website foi desenvolvendo ao longo do tempo, para que, deste modo, possam servir de inspiração para todos os que lêem.
                            Nesta página conseguem retirar várias ideias, cativando a escrever sobre o que mais fizer sentido.
                        </p></div>
                    <div class="col-md-4 col-sm-6">

                         <div class="team-thumb wow fadeInUp" data-wow-delay="0.2s">
                              <img src="images/team-image1.jpg" class="img-responsive" alt="">

                                   <div class="team-info">
                                        <h3>Nate Baston</h3>
                                        <p>General Principal</p>
                                        <div class="team-contact-info">
                                             <p><i class="fa fa-phone"></i> 010-020-0120</p>
                                             <p><i class="fa fa-envelope-o"></i> <a href="#">general@company.com</a></p>
                                        </div>
                                        <ul class="social-icon">
                                             <li><a href="#" class="fa fa-linkedin-square"></a></li>
                                             <li><a href="#" class="fa fa-envelope-o"></a></li>
                                        </ul>
                                   </div>

                         </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                         <div class="team-thumb wow fadeInUp" data-wow-delay="0.4s">
                              <img src="images/team-image2.jpg" class="img-responsive" alt="">

                                   <div class="team-info">
                                        <h3>Jason Stewart</h3>
                                        <p>Pregnancy</p>
                                        <div class="team-contact-info">
                                             <p><i class="fa fa-phone"></i> 010-070-0170</p>
                                             <p><i class="fa fa-envelope-o"></i> <a href="#">pregnancy@company.com</a></p>
                                        </div>
                                        <ul class="social-icon">
                                             <li><a href="#" class="fa fa-facebook-square"></a></li>
                                             <li><a href="#" class="fa fa-envelope-o"></a></li>
                                             <li><a href="#" class="fa fa-flickr"></a></li>
                                        </ul>
                                   </div>

                         </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                         <div class="team-thumb wow fadeInUp" data-wow-delay="0.6s">
                              <img src="images/team-image3.jpg" class="img-responsive" alt="">

                                   <div class="team-info">
                                        <h3>Miasha Nakahara</h3>
                                        <p>Cardiology</p>
                                        <div class="team-contact-info">
                                             <p><i class="fa fa-phone"></i> 010-040-0140</p>
                                             <p><i class="fa fa-envelope-o"></i> <a href="#">cardio@company.com</a></p>
                                        </div>
                                        <ul class="social-icon">
                                             <li><a href="#" class="fa fa-twitter"></a></li>
                                             <li><a href="#" class="fa fa-envelope-o"></a></li>
                                        </ul>
                                   </div>

                         </div>
                    </div>
                    
               </div>
          </div>
     </section>
     <section id="team" data-stellar-background-ratio="1">
          <div class="container">
               <div class="row">
                    <div class="col-md-4 col-sm-6">
                         <div class="team-thumb wow fadeInUp" data-wow-delay="0.2s">
                              <img src="images/team-image1.jpg" class="img-responsive" alt="">

                                   <div class="team-info">
                                        <h3>Nate Baston</h3>
                                        <p>General Principal</p>
                                        <div class="team-contact-info">
                                             <p><i class="fa fa-phone"></i> 010-020-0120</p>
                                             <p><i class="fa fa-envelope-o"></i> <a href="#">general@company.com</a></p>
                                        </div>
                                        <ul class="social-icon">
                                             <li><a href="#" class="fa fa-linkedin-square"></a></li>
                                             <li><a href="#" class="fa fa-envelope-o"></a></li>
                                        </ul>
                                   </div>

                         </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                         <div class="team-thumb wow fadeInUp" data-wow-delay="0.4s">
                              <img src="images/team-image2.jpg" class="img-responsive" alt="">

                                   <div class="team-info">
                                        <h3>Jason Stewart</h3>
                                        <p>Pregnancy</p>
                                        <div class="team-contact-info">
                                             <p><i class="fa fa-phone"></i> 010-070-0170</p>
                                             <p><i class="fa fa-envelope-o"></i> <a href="#">pregnancy@company.com</a></p>
                                        </div>
                                        <ul class="social-icon">
                                             <li><a href="#" class="fa fa-facebook-square"></a></li>
                                             <li><a href="#" class="fa fa-envelope-o"></a></li>
                                             <li><a href="#" class="fa fa-flickr"></a></li>
                                        </ul>
                                   </div>

                         </div>
                    </div>

                    <div class="col-md-4 col-sm-6">
                         <div class="team-thumb wow fadeInUp" data-wow-delay="0.6s">
                              <img src="images/team-image3.jpg" class="img-responsive" alt="">

                                   <div class="team-info">
                                        <h3>Miasha Nakahara</h3>
                                        <p>Cardiology</p>
                                        <div class="team-contact-info">
                                             <p><i class="fa fa-phone"></i> 010-040-0140</p>
                                             <p><i class="fa fa-envelope-o"></i> <a href="#">cardio@company.com</a></p>
                                        </div>
                                        <ul class="social-icon">
                                             <li><a href="#" class="fa fa-twitter"></a></li>
                                             <li><a href="#" class="fa fa-envelope-o"></a></li>
                                        </ul>
                                   </div>

                         </div>
                    </div>
                    
               </div>
          </div>
     </section>

</asp:Content>
