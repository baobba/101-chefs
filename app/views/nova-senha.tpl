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
		jQuery('#salvar').attr("disabled","disabled");
	});
	</script>

	<?php if($flag == 'erro'){ ?>
		<section id="erro">
			Erro de inscrição!
		</section>
	<?php } ?>

	<section id="pag-redefinir-senha">
		<div class="box-redefinir">
			<h3>Redefinir Senha</h3>
			
			<form name="form-senha" method="post" action="<?= APP_URI_APP ?>perfil/save_senha">
				<input type="hidden" name="user_id" value="<?= $id ?>">
				<input type="password" name="senha_nova" id="senha" value="" placeholder="Digite nova senha" style="margin-bottom: 15px;">
				<input type="password" name="senha2" value="" placeholder="Digite a senha novamente" onkeyup="verificaCamposDuplos(jQuery('#senha').val(), this.value);">
				<span class="msg"></span>
				<input type="submit" name="salvar" id="salvar" value="Salvar" class="btn-send">
			</form>
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
