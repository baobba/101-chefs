<?php include('_header.tpl'); ?>

	<script>
	jQuery(document).ready(function() {
		if(jQuery(window).width() > 768){
			jQuery(window).scroll(function(){
				var y = jQuery(window).scrollTop();
				if (y >= 384){
					jQuery('header').addClass('bg');
					jQuery('header').addClass('header-fixed');
					jQuery('header a.logo.l-white').css('display','none');
					jQuery('header a.logo.l-color').css('display','block');
					jQuery('header.interna a.logo.l-color').css('display','block');
					jQuery('header.interna a.logo.l-white').css('display','none');
					jQuery('header .menu-header ul li a').css('color','#5a5a5a');
					jQuery('header .menu-header ul li a.destaque').css('color','#ffffff');
				}else {
					jQuery('header').removeClass('bg');
					jQuery('header').removeClass('header-fixed');
					jQuery('header a.logo.l-white').css('display','block');
					jQuery('header a.logo.l-color').css('display','none');
					jQuery('header.interna a.logo.l-color').css('display','block');
					jQuery('header.interna a.logo.l-white').css('display','none');
					jQuery('header .menu-header ul li a').css('color','#ffffff');
				}
				
			});
		}
		/*
		jQuery('a.bt-comoFunciona').click(function(){
			jQuery(this).parents('body').find('header').addClass('open-comoFunciona');
			jQuery('#como-funciona').slideDown();
			return false;
		});
		jQuery('a.close-como-funciona').click(function(){
			jQuery('#como-funciona').slideUp();
			jQuery(this).parents('body').find('header').delay(100).removeClass('open-comoFunciona');
		});
		*/
		
		jQuery('a.show-menu-mobile').click(function(){
			jQuery(this).toggleClass('open');
			jQuery(this).children('span:first-child').toggleClass('rot');
			jQuery(this).children('span:last-child').toggleClass('rot');
			jQuery(this).next('.menu-header').slideToggle();
			jQuery('#mask-mobile-hide').toggleClass('open');
			return false;
		});
		jQuery('#mask-mobile-hide').click(function(){
			jQuery(this).removeClass('open');
			jQuery('a.show-menu-mobile').removeClass('open');
			jQuery('a.show-menu-mobile').children('span:first-child').removeClass('rot');
			jQuery('a.show-menu-mobile').children('span:last-child').removeClass('rot');
			jQuery(this).next('header').find('.menu-header').slideToggle();
			return false;
		});
		
	});
	</script>
</head>
<body>

	<div id="como-funciona">
		<a href="#" class="close-como-funciona"><i class="flaticon-cross"></i></a>
		<div class="steps">
			<ul>
				<li>
					<div class="ilustra"><img src="<?= APP_URI_PUBLIC ?>images/comoFunciona-101chefs-01.png" style="max-width:100%; height:auto;" /></div>
					<h4>01 - Cozinhe</h4>
				</li>
				<li>
					<div class="ilustra"><img src="<?= APP_URI_PUBLIC ?>images/comoFunciona-101chefs-02.png" style="max-width:100%; height:auto;" /></div>
					<h4>02 - Divulgue</h4>
				</li>
				<li>
					<div class="ilustra"><img src="<?= APP_URI_PUBLIC ?>images/comoFunciona-101chefs-03.png" style="max-width:100%; height:auto;" /></div>
					<h4>03 - Escolha</h4>
				</li>
				<li>
					<div class="ilustra"><img src="<?= APP_URI_PUBLIC ?>images/comoFunciona-101chefs-04.png" style="max-width:100%; height:auto;" /></div>
					<h4>04 - Saboreie</h4>
				</li>
				<div class="clear"></div>
			</ul>
		</div>
	</div>
	
	<div id="mask-mobile-hide"></div>

	<?php if(!$_SESSION['user_id']){ ?>
		<!-- ======================= HEADER NÃO LOGADO ======================= -->
		<header class="index">
			<a href="<?= APP_URI_APP ?>pag-busca-realizada" class="header-busca-mobile"><i class="flaticon-search100"></i></a>
			<a href="#" class="logo l-white"><img src="<?= APP_URI_PUBLIC ?>images/logo-white-beta.svg" style="width:100%; height:auto;" /></a>
			<a href="#" class="logo l-color"><img src="<?= APP_URI_PUBLIC ?>images/logo-color-beta.svg" style="width:100%; height:auto;" /></a>
			<a href="#" class="show-menu-mobile">
				<span></span>
				<span></span>
				<span></span>
			</a>
			<div class="menu-header" id="nav">
				<ul>
					<li><a href="#" class="bt-fazer-login">Entrar</a></li>
					<li><a href="<?= APP_URI_APP ?>faq">Ajuda</a></li>
					<li><a href="<?= APP_URI_APP ?>inscricao" class="destaque">Quero cozinhar</a></li>
				</ul>
			</div>
		</header>
	<?php } else { ?>
		<!-- ======================= HEADER LOGADO ======================= -->
		<header class="index interna bg header-fixed">
			<a href="<?= APP_URI_APP ?>pag-busca-realizada" class="header-busca-mobile"><i class="flaticon-search100"></i></a>
			<a href="#" class="logo l-white" style="display: none;"><img src="<?= APP_URI_PUBLIC ?>images/logo-white-beta.svg" style="width:100%; height:auto;" /></a>
			<a href="#" class="logo l-color" style="display: block;"><img src="<?= APP_URI_PUBLIC ?>images/logo-color-beta.svg" style="width:100%; height:auto;" /></a>
			<a href="#" class="show-menu-mobile">
				<span></span>
				<span></span>
				<span></span>
			</a>
			<div class="menu-header" id="nav">
				<ul>
					<li class="hover-sub">
						<p onclick="window.location.href='<?= APP_URI_APP ?>abertura';" class="name-user"><?= $perfil_nome ?></p>
						<?php if($perfil_foto <> ""){ ?>
									<span class="photo-perfil"><div class="img" style="background: url(<?= APP_URI_PUBLIC ?>upload_perfil/<?= $perfil_foto ?>) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div></span>
								<?php } else { ?>
									<span class="photo-perfil"><div class="img" style="background: url(public/images/no_foto_thumb.png) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div></span>
								<?php } ?>		
						<span class="sub-menu">
							<a href="<?= APP_URI_APP ?>abertura" style="color: #5a5a5a !important;">Ver meu perfil</a>
							<a href="<?= APP_URI_APP ?>pag-perfil-edit" style="color: #5a5a5a !important;">Editar perfil</a>
							<a href="<?= APP_URI_APP ?>logout" class="sair" style="color: #5a5a5a !important;">Sair</a>
						</span>
					</li>
					<?php if($flag_cpf != ''){ ?>
						<li><a href="<?= APP_URI_APP ?>faq" class="ajuda" style="color: #5a5a5a !important;">Ajuda</a></li>
						<li class="hover-sub">
							<p onclick="window.location.href='<?= APP_URI_APP ?>pag-meus-pratos';">Meus pratos</p>
							<span class="sub-menu">
								<a href="<?= APP_URI_APP ?>pag-meus-pratos" style="color: #5a5a5a !important;">Meus pratos</a>
								<a href="<?= APP_URI_APP ?>pag-prato-edit" style="color: #5a5a5a !important;">Adicionar prato</a>
							</span>
						</li>
						<li><a href="<?= APP_URI_APP ?>faq" class="ajuda-mobile" style="color: #5a5a5a !important;">Ajuda</a></li>
						<li><a href="<?= APP_URI_APP ?>logout" class="sair-mobile" style="color: #5a5a5a !important;">Sair</a></li>
					<?php } ?>
					<div class="clear"></div>
				</ul>
				<!-- <div class="busca-mobile">
					<form name="form-busca" method="post" action="<?= APP_URI_APP ?>pag-busca-realizada">
						<i class="flaticon-search100" type="submit"></i><input name="nome_prato" type="text" class="search" placeholder="O que deseja comer?">
					</form>
				</div> -->
			</div>
		</header>
	<?php } ?>
	
	<div class="mask"></div>
	<div id="box-login"> 
		<?php
		$fb = new Facebook\Facebook([
			'app_id' => FACEBOOK_APP_ID,
			'app_secret' => FACEBOOK_APP_SECRET,
			'default_graph_version' => 'v2.4',
		]);

		$helper = $fb->getRedirectLoginHelper();

		$permissions = ['public_profile', 'email'];

		$loginUrl = $helper->getLoginUrl('http://101chefs.com.br/app/fb_callback', $permissions);
		?>
		<p class="acesseConta">Acesse sua conta</p>
		<a href="<?= $loginUrl ?>" class="bt-login-facebook" onclick="verificaChecks()">Entrar com o facebook</a>
		<p class="sep"><span>ou</span></p>
		<form name="form-login" method="post" action="<?= APP_URI_APP ?>login">
			<input name="login" type="text" placeholder="Seu email/usuário">
			<input name="pass" type="password" placeholder="Sua senha">
			<button type="submit">Entrar</button>
		</form>
		<a href="<?= APP_URI_APP ?>esqueci-senha" class="forgotPass">Esqueci minha senha</a>
		<a href="<?= APP_URI_APP ?>inscricao" class="forgotPass">Ainda não sou cadastrado</a>
	</div>
	
	<section id="destaque">
		<div class="box-texto">
			<h2>Comida feita com amor</h2>
			<h3>Conectando quem gosta de cozinhar a quem quer comer bem</h3>
			<!-- a href="#" class="bt-comoFunciona">Como funciona?</a -->
		</div>
		<div class="bar-busca">
			<div class="area-input">
				<form name="form-busca" method="post" action="<?= APP_URI_APP ?>pag-busca-realizada">

					<select name="localizacao" style="display: none;">
						<option value="">Selecione</option>
						<?php foreach($cidades as $key_c => $values_c){ ?>
							<option value="<?= $values_c ?>"><?= $values_c ?></option>
						<?php } ?>
					</select>

					<input name="nome_prato" type="text" placeholder="O que deseja comer?">

					<select name="prato_categoria[]">
						<option value="0">Selecione categoria</option>
						<?php
						foreach($lista_categorias2 as $keyc => $valuec){
							
							$checked = '';
							if($categorias[$keyc] == $keyc){
								$checked = 'checked';
							}
							
							?>
							<option value="<?= $keyc ?>"><?= $valuec ?></option>
							<?php
						}
						?>
					</select>

					<button type="submit">Buscar</button>
				</form>
				<div class="clear"></div>
			</div>
			<a href="<?= APP_URI_APP ?>pag-busca-realizada" class="btn-busca-mobile"><i class="flaticon-search100"></i> O que deseja comer?</a>
		</div>
	</section>
	
	<section id="como-funciona-full">
		<div class="box-passo">
			<h2 class="title-box">Como funciona</h2>
			<div class="col col-50">
				<span class="img-ilustra"><img src="<?= APP_URI_PUBLIC ?>images/cena-02.jpg" style="max-width:100%; height:auto;" /></span>
				<div class="area-text">
					<p>Quem adora cozinhar, e quer vender suas especialidades, posta seus pratos no 101Chefs, que é a vitrine online de quem empreende na cozinha.</p>
				</div>
			</div>
			<div class="col col-50">
				<span class="img-ilustra"><img src="<?= APP_URI_PUBLIC ?>images/cena-03.jpg" style="max-width:100%; height:auto;" /></span>
				<div class="area-text">
<!--					<p>Quem quer comida pronta, saborosa e não industrializada, encontra no 101Chefs e faz sua encomenda.</p>-->
					<p>Quem quer comida saborosa e não industrializada encontra aqui e combina com o chef os detalhes, o pagamento e a entrega ou retirada do pedido.</p>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="box-passo">
			<h2 class="title-box">Quero vender </h2>
			<div class="col col-25">
				<span class="img-ilustra"><img src="<?= APP_URI_PUBLIC ?>images/cena-01.jpg" style="max-width:100%; height:auto;" /></span>
			</div>
			<div class="col col-75">
				<div class="area-text">
					<p><b>Veja as vantagens</b> de se cadastrar no 101Chefs:</p>
                    <p>&nbsp;</p>
					<ul>
						<li><p>Você pode fazer uma renda extra e viver de sua paixão pela comida, fazendo tudo do seu jeito e no seu tempo.</p></li>
						<li><p>Você amplia sua clientela pois estará conectado a novos clientes possíveis desde o primeiro momento.</p></li>
						<li><p>Você compartilha o que faz de melhor e o 101Chefs vai ajudar você na divulgação, e com dicas de preparo, embalagem, e melhores práticas.</p></li>
						<li><p>Você terá sua vitrine online e poderá construir uma base de clientes frequentes e fiéis.</p></li>
						<li><p>O 101Chefs está construindo todas as ferramentas para facilitar cada vez mais a experiência do pedido, a cobrança e o atendimento. Sua única preocupação é com o que ama fazer, que é cozinhar.</p></li>
					</ul>
				</div>
				<a href="<?= APP_URI_APP ?>inscricao" class="queroVender">Quero cozinhar</a>
			</div>
			<div class="clear"></div>
		</div>
		<div class="box-passo">
			<h2 class="title-box">Quero comer </h2>
			<div class="col col-50">
				<div class="area-text">
					<p>Estamos construindo uma plataforma que conecta quem cozinha em casa a quem busca comer bem e pagar um valor justo por isso.</p>
					<div class="bloco-sep">
						<p><strong>Aqui você poderá:</strong></p>
						<ul>
							<li><p>Ter acesso a muitos pratos saborosos que serão comercializados em sua região.</p></li>
							<li><p>Ter maior diversidade e novas opções de refeição além das que tem hoje, mais gostosas, mais saudáveis, diferentes, feitas de forma mais artesanal.</p></li>
							<li><p>Conhecer as pessoas que vivem na sua vizinhança e são cozinheiros de mão cheia.</p></li>
						</ul>
					</div>
					<p>Cadastre-se aqui e acompanhe as novidades em primeira mão.</p>
				</div>
			</div>
			<div class="col col-50">
				<span class="img-ilustra"><img src="<?= APP_URI_PUBLIC ?>images/cena-04.jpg" style="max-width:100%; height:auto;" /></span>
			</div>
			<div class="clear"></div>
			<div class="area-cadastro">
				<p class="sub"><strong>Cadastre-se aqui e acompanhe as novidades em primeira mão.</strong></p>
				<div>
					<form id="signup-form" method="post" action="#">
						<input type="text" name="email_news" id="email_news" value="" placeholder="Email"></input>
						<input type="button" value="enviar" onClick="enviaEmail()"></input>
					</form>
				</div>
				<div id="sucesso"></div>
				<script>
				function enviaEmail(){
					jQuery.ajax({
						method: "POST",
						url: "<?= APP_URI_APP ?>mailNews",
						data: { email: jQuery('#email_news').val() }
					})
					.done(function( msg ) {
						jQuery('#email_news').val('');
						jQuery('#sucesso').html('Obrigado!');
					});
				}
				</script>
			</div>
		</div>
		
	</section>
    
<?php include('_footer.tpl'); ?>
