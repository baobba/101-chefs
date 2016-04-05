<?php
session_destroy();
session_start();

require('config/config.php'); 

$fb = new Facebook\Facebook([
'app_id' => FACEBOOK_APP_ID,
'app_secret' => FACEBOOK_APP_SECRET,
'default_graph_version' => 'v2.4',
'persistent_data_handler'=>'session'
]);

$helper = $fb->getRedirectLoginHelper();

$permissions = ['public_profile', 'email'];

$accessToken = $helper->getAccessToken();  

$loginUrl = $helper->getLoginUrl('http://101chefs.com.br/app/fb_callback', $permissions);

?>
<!DOCTYPE html>
<html lang="en"><head>
    <meta charset="utf-8">
    <title>101Chefs</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <meta property="og:title" content="">
    <meta property="og:type" content="website">
    <meta property="og:url" content="">
    <meta property="og:site_name" content="">
    <meta property="og:description" content="">

    <!-- Styles -->
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>/landing_res/css/font-awesome.min.css">
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>/landing_res/css/font-awesome-animation-min.css">
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>/landing_res/css/animate.css">
    <link href='http://fonts.googleapis.com/css?family=Lato:300,100,200,400,500,600,700,800,900|Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>/landing_res/css/bootstrap.min.css">
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>/landing_res/css/main.css">

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
    <script src="<?= APP_URI_PUBLIC ?>js/jquery.bxslider.min.js"></script>

    <script src="<?= APP_URI_PUBLIC ?>js/slippry.min.js"></script>
    <script src="<?= APP_URI_PUBLIC ?>js/funcoes.js" type="text/javascript"></script>
    <script src="<?= APP_URI_PUBLIC ?>js/jquery.localscroll-1.2.7-min.js" type="text/javascript"></script>
    <script src="<?= APP_URI_PUBLIC ?>js/jquery.scrollTo-1.4.2-min.js" type="text/javascript"></script>


    <script src="<?= APP_URI_PUBLIC ?>/landing_res/js/modernizr-2.7.1.js"></script>
    <script>
        jQuery(document).ready(function() {

            jQuery('a.bt-fazer-login').click(function(){
                jQuery('.mask, #box-login').fadeIn();
            });
            jQuery('.mask').click(function(){
                jQuery(this).fadeOut();
                jQuery('#box-login').fadeOut();
            });

        });
    </script>
    </head>

    <body> 
        <script>
            function verificaChecks(){
                var msgErro = "";

                if(jQuery('#termos:checkbox:checked').length == 0)
                    msgErro++;
                if(jQuery('#politica:checkbox:checked').length == 0)
                    msgErro++;

                if(msgErro > 0){
                    jQuery('#erro').removeAttr('style');
                } else {
                    jQuery('#erro').attr('style', 'display: none;');
                    window.location.href="<?= $loginUrl ?>";
                }
            }

            function msgAlerta(){
                //alert('Ao clicar para se inscrever vc está concordando com os termos e blablabla');
                window.location.href="<?= $loginUrl ?>";
            }

            jQuery(document).ready(function() {
                //jQuery('#salvar').attr("disabled","disabled");
            });
        </script>

        <?php if($flag == 'erro'){ ?>
        <section class="insc" id="erro">
            <p>Erro de inscrição!</p>
        </section>
        <?php } ?>
        <?php if($flag == 'email'){ ?>
        <section class="insc" id="erro">
            <p>Já existe uma conta com esse e-mail.</p>
        </section>
        <?php } ?>
        <?php if($flag == 'nosenha'){ ?>
        <section class="insc" id="erro">
            <p>Senha incorreta.</p>
        </section>
        <?php } ?>
        <?php if($flag == 'noinscricao'){ ?>
        <section class="insc" id="erro">
            <p>Esse e-mail não está cadastrado.</p>
        </section>
        <?php } ?>
        <header>
            <!--        <div style="top: -10px; width: 100%; height: 100%; position: absolute; background:rgba(0,0,0,0.10);"></div>-->

            <div class="container">
                <section id="head">
                    <div class="row header-info-top wow fadeIn" data-wow-delay="0.5s">
                        <div class="col-xs-12">
                            <a href="#"><img src="<?= APP_URI_PUBLIC ?>/landing_res/img/logo.svg" style="width:180px; height:auto;" alt="Logo"></a>
                        </div>
                        <!--
<div class="col-xs-6" style="text-align:right;">
<ul class="list-inline social">
<li>Siga nos</li>
<li><a href="https://www.facebook.com/101chefs"><i class="fa fa-facebook"></i></a></li>
<li><a href="https://www.instagram.com/101chefs/"><i class="fa fa-instagram"></i></a></li>
</ul>
</div>
-->
                        <!--
<div class="col-xs-4" style="text-align:right;">
<a href="#" class="btn btn-101 btn-lg btn-block bt-fazer-login">Já sou 101Chefs!</a>
</div>
-->

                    </div>
                </section>
                <section id="content">
                    <div class="row header-info">
                        <div class="col-md-8">
                            <h1 class="wow fadeIn" data-wow-delay="0.5s">Ganhe dinheiro cozinhando</h1>
                            <br />
                            <h4 class="wow fadeIn txth4" data-wow-delay="0.85s" style="width:74%;">Faça uma renda extra de sua paixão pela comida.<br><b>101Chefs</b> faz a ponte entre seus pratos e os clientes.<br></h4><h4>Veja como funciona:</h4>
                            <br /> 
                            <div class="videoWrapper wow fadeIn" data-wow-delay="1s">
                                <div><iframe width="853" height="480" src="https://www.youtube.com/embed/vM100ivbpGI?autoplay=0&controls=1&rel=0" frameborder="0" allowfullscreen></iframe></div>                                               
                            </div>  
                            <div class="seta"><a href="#comofunciona"><i class="fa fa-angle-down fa-5x faa-float animated"></i></a></div>
                        </div>


                        <div class="col-md-4 lead wow fadeIn formtop" data-wow-delay="1.5s">

                            <!-- START Login -->
                            <div class="panel panel-default panel-login">      		
                                <div class="login-form">
                                    <div class="form-group">
                                        <div style="text-align:right;">
                                            <a href="#" class="btn btn-101 btn-lg btn-block bt-fazer-login">JÁ TENHO UMA CONTA</a>
                                        </div>

                                        <div class="sep"><span class="linefull"></span></div>
                                        <p class="text-center fontW600">CRIAR UMA CONTA</p>
                                        <div class="insc-face">
                                            <div id="erro" style="display: none;">
                                                Preencha os campos solicitados.
                                            </div>
                                            <form>
<!--                                                <a href="https://www.facebook.com/v2.4/dialog/oauth?client_id=415946768614462&amp;state=1a298542d1558e6b752e347c07dc0539&amp;response_type=code&amp;sdk=php-sdk-5.0.0&amp;redirect_uri=http%3A%2F%2F101chefs.com.br%2Fapp%2Ffb_callback&amp;scope=public_profile%2Cemail" class="btn btn-face btn-lg btn-block">--><a href="<?= $loginUrl ?>" class="btn btn-face btn-lg btn-block">

                                                    <span>CADASTRE-SE COM FACEBOOK</span>    
                                                </a> 
                                            </form>
                                        </div>

                                        <div class="sep">
                                            <span class="line"></span>
                                            <p class="text-center fontW600">OU</p>
                                            <span class="line"></span>
                                        </div>

                                        <div class="insc-form">
                                            <p class="text-center" style="font-size: 16px;">CADASTRE-SE COM E-MAIL</p>
                                            <form name="form-site" method="post" action="<?= APP_URI_APP ?>cadastro_site">
                                                <ul>
                                                    <!--onkeyup="verificaCamposDuplos(jQuery('#email').val(), this.value)"-->
                                                    <li><input name="nome" type="text" placeholder="Nome" required></li>
                                                    <li><input name="email" id="email" type="text" placeholder="E-mail" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"></li>
                                                    <li><input name="email2" type="text" placeholder="Confirmar E-mail" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" ><span class="msg"></span></li>
                                                    <li><input name="senha" type="password" placeholder="Senha" required></li>
                                                </ul>
                                                <button type="submit" id="salvar" class="btn btn-block btn-lg btn-success">

                                                    <span>CADASTRE-SE</span>
                                                </button> 
                                            </form>
                                        </div>

                                        <label>
                                            <div class="aviso-politica-termos">
                                                <p>
                                                    <small>Ao continuar e enviar meus dados, eu concordo com os <a href="http://101chefs.com.br/termos-servico"><b><u>Termos de Serviços</u></b></a> e a <a href="http://101chefs.com.br/politicas-privacidade"><b><u>Política de Privacidade</u></b></a>.</small></p>
                                                <p class="small2">Copyright &copy; 2016 - Todos os direitos reservados.<br>
                                                    Desenvolvido por <a href="http://baobbalab.com" target="_blank"><b>Baobba</b></a></p>
                                            </div>
                                        </label>

                                    </div>		
                                </div>
                            </div>

                            <!-- END Login -->

                        </div>                
                    </div>
                </section>
            </div>


            <section class="comoFunciona" id="comofunciona">
                <div class="container" style="text-align:center;" id="comofunciona">
                    <div class="row">
                        <h2 class="title-box">Veja as vantagens de ser o seu próprio chef(e) <i class="fa fa-smile-o"></i></h2>
                        <div class="col-md-2"></div>
                        <div class="col-md-2" id="ilustra">
                            <span class="img-ilustra">
                                <img src="http://101chefs.com.br/public/images/cena-01.jpg">
                            </span>
                            <br><br>
                            <span class="img-ilustra">
                                <img src="http://101chefs.com.br/public/images/cena-02.jpg">
                            </span>                           

                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-5">				
                            <div class="area-text txt_vantagens">
                                <span>Você já tem tudo o que precisa para começar, e tornar sua receita conhecida por mais pessoas.</span>
                                <br><br><br>
                                <span>Liberdade para cozinhar no seu tempo e do seu jeito. Você faz seus horários.</span>
                                <br><br><br>
                                <span>Flexibilidade para escolher "o que" e "quando" quer vender, e o "quanto" quer cobrar.</span>
                                <br><br><br>
                                <span>Tenha sua vitrine online sem precisar fazer um site, nem depender das redes sociais.</span>
                                <br><br><br>
                                <span>O 101Chefs leva quem quer comer bem até você!</span>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="clear"></div>
                    </div> 
                </div>
            </section>

            <div class="mask"></div>
            <div id="box-login"> 

                <p class="text-center fontW600">Acesse sua conta</p>
                <a href="<?= $loginUrl ?>" class="btn btn-face btn-lg btn-block" onclick="verificaChecks()">Entrar com o facebook</a>
                <p class="sep"><span>ou</span></p>
                <div class="insc-form">
                    <form name="form-login" method="post" action="<?= APP_URI_APP ?>login">
                        <ul>
                            <li><input name="login" type="text" placeholder="Seu email/usuário"></li>
                            <li><input name="pass" type="password" placeholder="Sua senha"></li>
                        </ul>
                        <button type="submit" class="btn btn-block btn-lg btn-success">Entrar</button>
                    </form>
                </div>
                <a href="<?= APP_URI_APP ?>esqueci-senha" class="forgotPass">Esqueci minha senha</a><br>
                <a href="<?= APP_URI_APP ?>" class="forgotPass">Ainda não sou cadastrado</a>
            </div>

        </header>



        <!--
<footer>
<div class="container">

<div class="row">
<div class="col-sm-3">
<ul class="list-inline social">
<li>Siga nos</li>
<li><a href="https://www.facebook.com/101chefs"><i class="fa fa-facebook"></i></a></li>
<li><a href="https://www.instagram.com/101chefs/"><i class="fa fa-instagram"></i></a></li>
</ul>
</div>

<div class="col-sm-9 copyright">
<ul class="list-inline">
<li>Copyright &copy; 2016 - Todos os direitos reservados.</li>
<li>Desenvolvido por <a href="http://baobbalab.com">Baobba</a></li>
</ul>	            
</div>
</div>

</div>
</footer>
-->


        <!-- Javascript
================================================== -->

        <!-- Placed at the end of the document so the pages load faster -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="<?= APP_URI_PUBLIC ?>/landing_res/js/wow.min.js"></script>
        <script src="<?= APP_URI_PUBLIC ?>/landing_res/js/bootstrap.min.js"></script>
        <script src="<?= APP_URI_PUBLIC ?>/landing_res/js/main.js"></script>



    </body>
</html>