<div class="bt-share">
	<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
	<div class="share-prato">
		<?php
		$link = APP_URI_APP.'pag-prato/'.$valuesp['prato_id'];
		$imagem = APP_URI_APP.'public/upload_fotos/'.$valuesp['foto'];

		$facebook_link = 'https://www.facebook.com/dialog/feed?app_id=415946768614462&link='.$link.'&picture='.$imagem.'&name='.$nome.'&caption=101Chefs&description='.$valuesp['descricao'].'&redirect_uri='.$link;

		$twitter_link = 'http://twitter.com/intent/tweet?text='.$nome.'&url='.$link.'&via=101Chefs';

		$pinterest_link = 'http://pinterest.com/pin/create/button/?url='.$link.'&media='.$imagem.'&description='.$nome.' em '.$link.'&description='.$nome;

		$googleplus_link = 'https://plus.google.com/share?url='.$link;
		?>
		<a href="<?= $facebook_link ?>" title="Compartilhar <?= $nome ?> no Facebook" class="s-media bt-share-facebook" target="_blank"><i class="flaticon-logotype42"></i></a>
		<a href="<?= $twitter_link ?>" class="s-media bt-share-twitter" target="_blank"><i class="flaticon-twitter1"></i></a>
		<a href="<?= $pinterest_link ?>" class="s-media bt-share-pinterest" target="_blank"><i class="flaticon-pinterest3"></i></a>
		<!--a href="#" class="s-media bt-share-google-plus" target="_blank"><i class="flaticon-google116"></i></a-->
		<a href="<?= $googleplus_link ?>" class="s-media bt-share-google-plus" target="_blank"><i class="flaticon-google116"></i></a>
		
		<a href="#" class="close-share"><i class="flaticon-close5"></i></a>
	</div>
</div>