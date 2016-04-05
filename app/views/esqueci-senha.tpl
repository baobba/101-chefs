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

	</script>

	<?php if($flag == 'erro'){ ?>
		<section id="erro">
			Email inválido!
		</section>
	<?php } ?>
	<?php echo $msg; ?>


	<section id="pag-redefinir-senha">		
		<div class="box-redefinir">
			<h3>Redefinir Senha</h3>
			<p>Insira o e-mail que você usou no cadastro.</p>
			<p>Enviaremos um e-mail com um link para você redefinir sua senha.</p>

			<form name="form-senha" method="post" action="<?= APP_URI_APP ?>email-esqueci-senha">
				<input type="email" name="email" id="email" value="" placeholder="Digite seu email">
				<input type="submit" name="salvar" id="enviar" value="Enviar" class="btn-send">
			</form>
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
