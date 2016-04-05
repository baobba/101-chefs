<?php
$fb = new Facebook\Facebook([
	'app_id' => FACEBOOK_APP_ID,
	'app_secret' => FACEBOOK_APP_SECRET,
	'default_graph_version' => 'v2.4',
]);

$helper = $fb->getRedirectLoginHelper();

$permissions = ['email']; // Optional permissions

$loginUrl = $helper->getLoginUrl('http://101chefs.com.br/app/fb_callback', $permissions);
?>

<script>
	jQuery(document).ready(function() {
		
		jQuery('a.show-menu-mobile').click(function(){
			jQuery(this).toggleClass('open');
			jQuery(this).children('span:first-child').toggleClass('rot');
			jQuery(this).children('span:last-child').toggleClass('rot');
			jQuery(this).next().next('.menu-header').slideToggle();
			jQuery('#mask-mobile-hide').toggleClass('open');
			return false;
		});
		jQuery('#mask-mobile-hide').click(function(){
			jQuery(this).removeClass('open');
			jQuery('a.show-menu-mobile').removeClass('open');
			jQuery('a.show-menu-mobile').children('span:first-child').removeClass('rot');
			jQuery('a.show-menu-mobile').children('span:last-child').removeClass('rot');
			jQuery('header').children('.menu-header').slideToggle();
			return false;
		});
		
	});
	$(window).resize(function() {
		if($(window).width() > 786){
			$('header .menu-header').addClass('excecao');
		}else if($(window).width() < 786){
			$('header .menu-header').removeClass('excecao');
		}
	});
</script>

<?php if(!$_SESSION['user_id']){ ?>
	<!-- ======================= HEADER NÃO LOGADO ======================= -->
		<div id="mask-mobile-hide"></div>
		<header class="interna">
			<a href="<?= APP_URI_APP ?>pag-busca-realizada" class="header-busca-mobile"><i class="flaticon-search100"></i></a>
			<a href="/" class="logo"><img src="<?= APP_URI_PUBLIC ?>images/logo-color-beta.svg" style="max-width:100%; height:auto;" /></a>
			<a href="#" class="show-menu-mobile">
				<span></span>
				<span></span>
				<span></span>
			</a>
			<div id="busca-topo">
				<form name="form-busca" method="post" action="<?= APP_URI_APP ?>pag-busca-realizada">
					<i class="flaticon-search100" type="submit"></i><input name="nome_prato" type="text" class="search" placeholder="O que deseja comer?">
				</form>
			</div>
			<div class="menu-header" id="nav">
				<ul>
					<li><a href="#" class="bt-fazer-login">Entrar</a></li>
					<li><a href="<?= APP_URI_APP ?>faq">Ajuda</a></li>
					<!--<li><a href="<?= APP_URI_APP ?>inscricao" class="destaque">Quero ser chef</a></li>-->
				</ul>
				<!-- <div class="busca-mobile">
					<form name="form-busca" method="post" action="< ?= APP_URI_APP ?>pag-busca-realizada">
						<i class="flaticon-search100" type="submit"></i><input name="nome_prato" type="text" class="search" placeholder="O que deseja comer?">
					</form>
				</div> -->
			</div>
		</header>
		
		<div class="mask"></div>
		<div id="box-login">
			<p class="acesseConta">Acesse sua conta</p>
			<a href="<?= $loginUrl ?>" class="bt-login-facebook" onclick="verificaChecks()">Entrar com o facebook</a>
			<p class="sep"><span>ou</span></p>
			<form name="form-login" method="post" action="<?= APP_URI_APP ?>login">
				<input name="login" type="text" placeholder="Seu email">
				<input name="pass" type="password" placeholder="Sua senha">
				<button type="submit">Entrar</button>
			</form>
			<a href="#" class="forgotPass">Esqueci minha senha</a>
			<a href="<?= APP_URI_APP ?>inscricao" class="forgotPass">Ainda não sou cadastrado</a>
		</div>
		
<?php } else { ?>    

	<!-- ======================= HEADER LOGADO USER COMUM ======================= -->
		<div id="mask-mobile-hide"></div>
		<header class="interna" style="display:none;">
			<a href="<?= APP_URI_APP ?>pag-busca-realizada" class="header-busca-mobile"><i class="flaticon-search100"></i></a>
			<a href="<?= APP_URI_APP ?>pag-prato-edit" class="header-addPlate-mobile"><i class="flaticon-plus79"></i></a>
			<a href="/" class="logo l-simple"><img src="<?= APP_URI_PUBLIC ?>images/logo-simple-color-beta.svg" style="max-width:100%; height:auto;" /></a>
			<a href="#" class="show-menu-mobile">
				<span></span>
				<span></span>
				<span></span>
			</a>
			<div id="busca-topo">
				<form name="form-busca" method="post" action="<?= APP_URI_APP ?>pag-busca-realizada">
					<i class="flaticon-search100" type="submit"></i><input name="nome_prato" type="text" class="search" placeholder="O que deseja comer?">
				</form>
			</div>
			<div class="menu-header" id="nav">
				<ul>
					<li class="hover-sub">
						<p onclick="window.location.href='<?= APP_URI_APP ?>abertura';" class="name-user"><?= $perfil_nome ?></p>
						<div class="photo-perfil-mobile">
							<span class="photo-perfil">
								<?php if($perfil_foto <> ""){ ?>
									<div class="img foto_menu" style="background: url(<?= APP_URI_PUBLIC ?>upload_perfil/<?= $perfil_foto ?>) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div>
								<?php } else { ?>
									<div class="img" style="background: url(public/images/no_foto_thumb.png) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div>
								<?php } ?>								
							</span>
						</div>
						<span class="sub-menu">
							<a href="<?= APP_URI_APP ?>pag-perfil-edit">Editar perfil</a>
							<a href="<?= APP_URI_APP ?>logout" class="sair">Sair</a>
						</span>
					</li>
					<li><a href="<?= APP_URI_APP ?>faq" class="ajuda">Ajuda</a></li>
					<?php if($flag_cpf != ''){ ?>
						<li class="hover-sub">
							<p onclick="window.location.href='<?= APP_URI_APP ?>pag-meus-pratos';">Meus pratos</p>
							<span class="sub-menu">
								<a href="<?= APP_URI_APP ?>pag-meus-pratos">Meus pratos</a>
								<a href="<?= APP_URI_APP ?>pag-prato-edit">Adicionar prato</a>
							</span>
						</li>
						<li><a href="#" class="ajuda-mobile">Ajuda</a></li>
						<li><a href="<?= APP_URI_APP ?>logout" class="sair-mobile">Sair</a></li>
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

		<header class="interna">
			<a href="<?= APP_URI_APP ?>pag-busca-realizada" class="header-busca-mobile"><i class="flaticon-search100"></i></a>
			<a href="<?= APP_URI_APP ?>pag-prato-edit" class="header-addPlate-mobile"><i class="flaticon-plus79"></i></a>
			<a href="/" class="logo l-simple"><img src="<?= APP_URI_PUBLIC ?>images/logo-simple-color-beta.svg" style="max-width:100%; height:auto;" /></a>
			<a href="#" class="show-menu-mobile">
				<span></span>
				<span></span>
				<span></span>
			</a>
			<div id="busca-topo">
				<form name="form-busca" method="post" action="<?= APP_URI_APP ?>pag-busca-realizada">
					<i class="flaticon-search100" type="submit"></i><input name="nome_prato" type="text" class="search" placeholder="O que deseja comer?">
				</form>
			</div>
			<div class="menu-header" id="nav">
				<ul>
					<li class="hover-sub">
						<p onclick="window.location.href='<?= APP_URI_APP ?>abertura';" class="name-user"><?= $perfil_nome ?></p>
						<div class="photo-perfil-mobile">
							<span class="photo-perfil">
								<?php if($perfil_foto <> ""){ ?>
									<div class="img foto_menu" style="background: url(<?= APP_URI_PUBLIC ?>upload_perfil/<?= $perfil_foto ?>) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div>
								<?php } else { ?>
									<div class="img" style="background: url(public/images/no_foto_thumb.png) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div>
								<?php } ?>								
							</span>
						</div>
						<span class="sub-menu">
							<a href="<?= APP_URI_APP ?>abertura">Ver meu perfil</a>
							<a href="<?= APP_URI_APP ?>pag-perfil-edit">Editar perfil</a>
							<a href="<?= APP_URI_APP ?>logout" class="sair">Sair</a>
						</span>
					</li>
					<li><a href="<?= APP_URI_APP ?>faq" class="ajuda">Ajuda</a></li>
					<?php if($flag_cpf != ''){ ?>
						<li class="hover-sub">
							<p onclick="window.location.href='<?= APP_URI_APP ?>pag-meus-pratos';">Meus pratos</p>
							<span class="sub-menu">
								<a href="<?= APP_URI_APP ?>pag-meus-pratos">Meus pratos</a>
								<a href="<?= APP_URI_APP ?>pag-prato-edit">Adicionar prato</a>
							</span>
						</li>
						<li><a href="#" class="ajuda-mobile">Ajuda</a></li>
						<li><a href="<?= APP_URI_APP ?>logout" class="sair-mobile">Sair</a></li>
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
	    
	<!-- ======================= HEADER LOGADO USER CHEF ======================= -->
<?php } ?>