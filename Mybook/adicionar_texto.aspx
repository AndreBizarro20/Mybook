<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adicionar_texto.aspx.cs" Inherits="Mybook.adicionar_texto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title></title>
    <!-- build:css assets/css/app.min.css -->
    <!--== Leaflet Min CSS ==-->
    <link href="assets/css/leaflet.min.css" rel="stylesheet" />
    <!--== Nice Select Min CSS ==-->
    <link href="assets/css/nice-select.min.css" rel="stylesheet" />
    <!--== Slick Slider Min CSS ==-->
    <link href="assets/css/slick.min.css" rel="stylesheet" />
    <!--== Magnific Popup Min CSS ==-->
    <link href="assets/css/magnific-popup.min.css" rel="stylesheet" />
    <!--== Slicknav Min CSS ==-->
    <link href="assets/css/slicknav.min.css" rel="stylesheet" />
    <!--== Animate Min CSS ==-->
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <!--== Ionicons Min CSS ==-->
    <link href="assets/css/ionicons.min.css" rel="stylesheet" />
    <!--== Font-Awesome Min CSS ==-->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <!--== Main Style CSS ==-->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!--== Helper Min CSS ==-->
    <link href="assets/css/helper.min.css" rel="stylesheet" />
    <!-- endbuild -->

    <!--[if lt IE 9]>
<script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>    
        <div class="contact-form-wrapper sm-top">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="contact-form-content">
                                <h2>Adicionar texto</h2>

                                <div class="contact-form-wrap">
                                    <div action="//whizthemes.com/mail-php/raju/gariongso/mail.php" method="post" id="contact-form">
                                        <div class="contact-form-inner">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="input-item">
                                                        <label class="sr-only" for="subject">subject</label>
                                                        <input type="text" name="titulo" id="subject" placeholder="Título" required />
                                                    </div>
                                                </div>
                                                    <div class="col-12">
                                                    <div class="input-item">
                                                        <label class="sr-only" for="message">message</label>
                                                        <textarea name="message" id="resumo" cols="30" rows="8" placeholder="Resumo" required></textarea>
                                                    </div>
                                                </div>
                                                   <div class="col-12">
                                                    <div class="input-item">
                                                        <asp:Label ID="lbl1" runat="server" Text="Deseja que os utilizadores saibam quem escreveu?"></asp:Label>
                                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Height="10px">
                                                            <asp:ListItem>Sim</asp:ListItem>
                                                            <asp:ListItem>Não</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="input-item">
                                                        <label class="sr-only" for="message">message</label>
                                                        <textarea name="message" id="texto" cols="30" rows="15" placeholder="Texto" required></textarea>
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <div class="input-item">
                                                        <button class="btn btn-brand">Send a Message</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Form Submission Notification -->
                                        <div class="form-message"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    <!--== End Page Content Wrapper ==-->
    <!--== Start Responsive Menu Wrapper ==-->
    <aside class="off-canvas-wrapper off-canvas-menu">
        <div class="off-canvas-overlay"></div>
        <div class="off-canvas-inner">
            <!-- Start Off Canvas Content -->
            <div class="off-canvas-content">
                <div class="off-canvas-header">
                    <div class="logo">
                        <a href="index.html"><img src="assets/img/logo.png" alt="Logo"></a>
                    </div>
                    <div class="close-btn">
                        <button class="btn-close"><i class="ion-android-close"></i></button>
                    </div>
                </div>

                <!-- Content Auto Generate Form Main Menu Here -->
                <div class="res-mobile-menu mobile-menu">

                </div>
            </div>
        </div>
        </div>        

    </aside>
    <!--== End Responsive Menu Wrapper ==-->


    <!--=======================Javascript============================-->
    <!-- build:js assets/js/app.min.js -->
    <!--=== Modernizr Min Js ===-->
    <script src="assets/js/modernizr-3.6.0.min.js"></script>
    <!--=== jQuery Min Js ===-->
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <!--=== jQuery Migration Min Js ===-->
    <script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
    <!--=== Popper Min Js ===-->
    <script src="assets/js/popper.min.js"></script>
    <!--=== Slicknav Min Js ===-->
    <script src="assets/js/jquery.slicknav.min.js"></script>
    <!--=== Magnific Popup Min Js ===-->
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <!--=== Slick Slider Min Js ===-->
    <script src="assets/js/slick.min.js"></script>
    <!--=== Nice Select Min Js ===-->
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <!--=== Leaflet Min Js ===-->
    <script src="assets/js/leaflet.min.js"></script>
    <!--=== Countdown Js ===-->
    <script src="assets/js/countdown.js"></script>

    <!--=== Active Js ===-->
    <script src="assets/js/active.js"></script>
    <!-- endbuild -->

</asp:Content>
