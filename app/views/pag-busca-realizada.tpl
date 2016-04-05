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
	<section id="pag-busca-realizada">		
		<div class="bar-filtros bar-busca">
			<form name="form-busca" method="post" action="<?= APP_URI_APP ?>pag-busca-realizada">
				<div class="area-input">
					<input name="nome_prato" type="text" placeholder="O que deseja comer?" value="<?= $_POST['nome_prato'] ?>">
					<button type="submit">Buscar</button>
				</div>
				<ul class="filtros-busca">
					<?php /*
					<li>
						<!--<a href="#" class="filtro"><span class="circle check"><i class="flaticon-tick2" name="realiza_entrega"></i></span> <p>Realiza a entrega</p></a>-->
						<div class="filtro"><label><input type="checkbox" value="1" name="realiza_entrega" class="filtro-radio" <?php if($_POST['realiza_entrega'] == 1){ ?> checked <?php } ?>><p>Realiza a entrega</p></label></div>
	                </li>
					<li>
						<!--a href="#" class="filtro"><span class="circle check"><i class="flaticon-tick2" name="retirada_local"></i></span> <p>Retirada no local</p></a-->
						<div class="filtro"><label><input type="checkbox" value="1" name="nrealiza_entrega" class="filtro-radio" <?php if($_POST['nrealiza_entrega'] == 1){ ?> checked <?php } ?>><p>Retirada no local</p></label></div>
	                </li>
	                <li>
						<!--a href="#" class="filtro"><span class="circle check"><i class="flaticon-tick2" name="retirada_local"></i></span> <p>Retirada no local</p></a-->
						<div class="filtro"><label><input type="checkbox" value="1" name="a_combinar" class="filtro-radio" <?php if($_POST['a_combinar'] == 1){ ?> checked <?php } ?>><p>Frete a combinar</p></label></div>
	                </li>
	                */ ?>
					<li class="large">
						<a href="#" class="filtro" id="open-list-foods"><span class="c-gray"><i class="flaticon-cooking33"></i></span> <p>Tipos de cozinha: <strong>Todas</strong></p> <span class="c-gray arrow-select"><i class="flaticon-triangles1"></i></span></a>
						<div class="select-plate">
							<?php

							foreach($lista_categorias as $keyc => $valuec){
								
								if(@$_POST['prato_categoria']){
									$checked = '';

									foreach($_POST['prato_categoria'] as $keycs => $valuecs){
										if($valuecs == $keyc){
											$checked = 'checked';
										}
									}
								}
								
								?>
								<label><input name="prato_categoria[]" type="checkbox" value="<?= $keyc ?>" <?= $checked ?>> <?= $valuec ?> </label>
								<?php
							}
							?>
						</div>
					</li>
					<div class="clear"></div>
				</ul>
				
			</form>
		</div>
        
		<div class="general-area-infos">
			<div class="pratos-chef">
				<?php 
				if(count($pratos) > 0){
					foreach($pratos as $key => $value){ 

						$tamanho_nome = strlen($value['nome']);

						if($tamanho_nome <= $limitador_string){
							$nome = $value['nome'];
						} else {
							$nome = substr($value['nome'], 0, $limitador_string).'...';
						}

						?>
						<div class="prato">
							<h3 class="nome-prato"><?= $nome ?></h3>
							<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
							<div class="clear"></div>
							<span class="imagem-prato"><a href="<?= APP_URI_APP ?>pag-prato-off/<?= $value['prato_id'] ?>"><img src="<?= APP_URI_APP ?>public/upload_fotos/<?= $value['foto'] ?>" /></a></span>
							<div class="bt-share">
								<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
								<div class="share-prato">
									<?php
									$link = APP_URI_APP.'pag-prato/'.$value['prato_id'];
									$imagem = APP_URI_APP.'public/upload_fotos/'.$value['foto'];

									$facebook_link = 'https://www.facebook.com/dialog/feed?app_id=415946768614462&link='.$link.'&picture='.$imagem.'&name='.$nome.'&caption=101Chefs&description='.$value['descricao'].'&redirect_uri='.$link;

									$twitter_link = 'http://twitter.com/intent/tweet?text='.$nome.'&url='.$link.'&via=101Chefs';

									$pinterest_link = 'http://pinterest.com/pin/create/button/?url='.$link.'&media='.$imagem.'&description='.$nome.' em '.$link.'&description='.$nome;
									?>
									<a href="<?= $facebook_link ?>" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
									<a href="<?= $twitter_link ?>" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
									<a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
									<a href="<?= $pinterest_link ?>" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
									<div class="clear"></div>
									<a href="#" class="close-share">Fechar</a>
								</div>
							</div>

							<?php foreach($value['array_precos'] as $key_pp => $values_pp){ ?>
								<!--span class="nome-prato">< ?= $values_pp['variacao'] ? ></span-->
								<p class="valor-prato">R$ <?= $values_pp['preco'] ?></p>
							<?php } ?>

							<a href="<?= APP_URI_APP ?>pag-prato-off/<?= $value['prato_id'] ?>" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
							<div class="clear"></div>
						</div>
					<?php 
					} 
				} else {
				?>
				<div class="busca-erro">
				<div class="busca-erro-esq">
					Ops! 
				</div>
				<div class="busca-erro-dir">
				Não conseguimos encontrar o que você está procurando. Tente filtrar sua busca.
				</div>
				
				</div>
				<!--<button class="fecha flaticon-close5"></button>-->
				<?php
					//echo "Nenhum prato foi encontrado!";
				}
				?>
				<div class="clear"></div>
			</div>
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
