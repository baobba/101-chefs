<?php include('_header.tpl'); ?>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery('li.hover-sub').hover(function(){
				jQuery(this).children('span.sub-menu').stop().slideDown();
			},function(){
				jQuery(this).children('span.sub-menu').stop().slideUp();
			});
			
			jQuery(".bt-share a.click-share").click(function(){
				jQuery(".share-prato").fadeOut();
				jQuery(this).next(".share-prato").fadeIn();
				return false;
			});
			jQuery(".bt-share a.close-share").click(function(){
				jQuery(this).parent(".share-prato").fadeOut();
				return false;
			});
			jQuery(".bar-filtros a.filtro").click(function(){
				jQuery(this).children("span.circle").toggleClass("ok");
				return false;
			});
		});
	</script>
</head>
<body>

<?php include('_menu.tpl'); ?>


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
	

	<section id="pag-reg">
		<div class="main">
			<div class="box-formas-inscricao">
				<div class="insc-face">
					<div id="erro" style="display: none;">
						Preencha os campos solicitados.
					</div>
					<form>
						<a href="<?= $loginUrl ?>" class="big-bt bigbt-face">Inscrever-se com o facebook</a>
						<!-- <div class="concordo">
							<label for="face-termos"><input name="termos" id="termos" value="1" type="checkbox" id="face-termos" required>
							<span></span> Eu concordo com os <a href="#">Termos de uso</a> e <a href="#">Política de privacidade</a> do 101 Chefs.</label>
						</div>
						<div class="concordo">
							<input name="politica" id="politica" value="1" type="checkbox" id="face-politica" required>
							<label for="face-politica"><span></span> Eu concordo com a <a href="#">Política de privacidade.</a></label>
						</div>-->
					</form>
				</div>
				<div class="sep">
					<span class="line"></span>
					<p>ou</p>
					<span class="line"></span>
				</div>
				<div class="insc-form">
					<h3>Inscrever-se com seu endereço de e-mail</h3>
					<form name="form-site" method="post" action="<?= APP_URI_APP ?>cadastro_site">
						<ul>
							<!--onkeyup="verificaCamposDuplos(jQuery('#email').val(), this.value)"-->
							<li><input name="nome" type="text" placeholder="Nome" required></li>
							<li><input name="email" id="email" type="text" placeholder="E-mail" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"></li>
							<li><input name="email2" type="text" placeholder="Confirmar E-mail" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" ><span class="msg"></span></li>
							<li><input name="senha" type="password" placeholder="Senha" required></li>
						</ul>
						<!--<div class="concordo">
							<input name="termos" type="checkbox" id="email-termos" required>
							<label for="email-termos"><span></span> Eu concordo com os <a href="#">Termos e condições do 101 Chefs.</a></label>
						</div>
						<div class="concordo">
							<input name="politica" type="checkbox" id="email-politica" required>
							<label for="email-politica"><span></span> Eu concordo com a <a href="#">Política de privacidade.</a></label>
						</div>-->
						<button class="big-bt bigbt-concluir" id="salvar" type="submit">Inscrever-se</button>
					</form>
				</div>

				<div class="aviso-politica-termos">
<!--
					<p>Li, entendi e concordo com os <a href="<?= APP_URI_APP ?>termos-servico">Termos de Serviços</a> e a <a href="<?= APP_URI_APP ?>politicas-privacidade">Política de Privacidade</a>.</p>
					<p>Ao continuar e enviar meus dados, eu concordo que o 101Chefs e seus representantes podem entrar em contato comigo por e-mail, telefone, SMS e aplicativos de bate-papo, no endereço de e-mail ou número que eu forneci, incluindo para finalidades de marketing. </p>
-->
                    <p>Ao continuar e enviar meus dados, eu concordo com os <a href="<?= APP_URI_APP ?>termos-servico">Termos de Serviços</a> e a <a href="<?= APP_URI_APP ?>politicas-privacidade">Política de Privacidade</a> e que o 101Chefs e seus representantes podem entrar em contato comigo por e-mail, telefone, SMS e aplicativos de bate-papo, no endereço de e-mail ou número que eu forneci, incluindo para finalidades de marketing.</p>
				</div>

				<p class="cadastrado">Já tem uma conta? <a href="#" class="bt-fazer-login">Entrar</a></p>
			</div>
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
