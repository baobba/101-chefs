<?php include('_header.tpl'); ?>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery('.lista-pratos').bxSlider({
				slideWidth: 220,
				minSlides: 1,
				maxSlides: 3,
				slideMargin: 10,
				pager: false,
				moveSlides: 1,
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
			
			jQuery('#open-list-foods').click(function(){
				jQuery(this).next('.select-plate').toggle();
			});
		});
	</script>
</head>
<body>

	<?php include('_menu.tpl'); ?>
	<section id="pag-erro">
		<div class="info-erro">
			<h3>Ops!</h3>
			
			<p class="subtitle">Infelizmente não encontramos a página que você está procurando.</p>
			
			<p class="cod-erro">Código de erro: <b>404</b></p>
			
			<p>Links úteis que podem te ajudar:</p>
			<ul>
				<li><a href="<?= APP_URI_APP ?>">Início</a></li>
				<li><a href="<?= APP_URI_APP ?>">Busca</a></li>
				<li><a href="<?= APP_URI_APP ?>faq">FAQ</a></li>
			<ul>
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
