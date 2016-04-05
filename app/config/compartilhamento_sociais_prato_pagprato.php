<div class="area-share-prato">
	<?php
	$link = APP_URI_APP.'pag-prato/'.$dados_prato['prato_id'];
	$imagem = APP_URI_APP.'public/upload_fotos/'.$dados_prato_fotos[0];

	$facebook_link = 'https://www.facebook.com/dialog/feed?app_id=415946768614462&link='.$link.'&picture='.$imagem.'&name='.$dados_prato['nome'].'&caption=101Chefs&description='.$dados_prato['descricao'].'&redirect_uri='.$link;

	$twitter_link = 'http://twitter.com/intent/tweet?text='.$dados_prato['nome'].'&url='.$link.'&via=101Chefs';

	$pinterest_link = 'http://pinterest.com/pin/create/button/?url='.$link.'&media='.$imagem.'&description='.$dados_prato['nome'].' em '.$link.'&description='.$dados_prato['nome'];

	$googleplus_link = 'https://plus.google.com/share?url='.$link;
	?>
	<p class="sub">Compartilhar o prato:</p>
	<a href="<?= $facebook_link ?>"  title="Compartilhar <?= $dados_prato['nome'] ?> no Facebook" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
	<a href="<?= $twitter_link ?>" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
	<a href="<?= $googleplus_link ?>" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
	<a href="<?= $pinterest_link ?>" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
	<?php /*if($_SESSION['user_id']){ ?>
		<a href="<?= APP_URI_APP ?>abertura" class="bt-mais-pratos">Ver mais pratos do Chefe</a>
	<?php } else { ?>
		<a href="<?= APP_URI_APP ?>chef/<?= $dados['usuario'] ?>" class="bt-mais-pratos">Ver mais pratos do Chefe</a>
	<?php }*/ ?>
	<a href="<?= APP_URI_APP ?>chef/<?= $dados['usuario'] ?>" class="bt-mais-pratos">Ver mais pratos do Chef</a>
	<div class="clear"></div>
</div>