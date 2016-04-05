<?php
$server = $_SERVER['SERVER_NAME'];
$endereco = $_SERVER ['REQUEST_URI'];

$url_atual = $server . $endereco;
$arr_url = array_reverse(explode('/', $url_atual));

$pag_atual = $arr_url[0];

if($pag_atual == 'pag-perfil-edit')
	$active1 = 'class="select"';

else if($pag_atual == 'pag-meus-pratos')
	$active2 = 'class="select"';

?>

<a href="<?= APP_URI_APP ?>pag-perfil-edit" <?= $active1 ?>>Meu perfil</a>
<!-- a href="#">Favoritos</a -->
<?php if($flag_cpf != ''){ ?>
	<a href="<?= APP_URI_APP ?>pag-meus-pratos" <?= $active2 ?>>Meus pratos</a>
<?php } ?>