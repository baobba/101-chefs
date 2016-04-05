<?php include('_header.tpl'); ?>

<script type="text/javascript">
		jQuery(document).ready(function() {
			var hContent = jQuery(".col-conteudo").height();
			var hPosContato = jQuery(".pos").height();
			jQuery(window).scroll(function(){
				var y = jQuery(window).scrollTop();
				if (y < 61){
					jQuery('.pos').removeClass('fixed');
				}else if (y >= 61 && y < hContent - hPosContato + 54){
					jQuery('.pos').addClass('fixed');
					jQuery('.pos').removeClass('absoluteFix');
				}else if (y >= hContent - hPosContato + 54){
					jQuery('.pos').removeClass('fixed');
					jQuery('.pos').addClass('absoluteFix');
				}
			});
			if (jQuery('.col-contato').height() < hContent){
				jQuery('.col-contato').height(hContent);
			};
			
			
			var demo2 = jQuery("#demo2").slippry({
				transition: 'fade',
				useCSS: true,
				speed: 1000,
				pause: 3000,
				auto: false,
				preload: 'visible',
				autoHover: false
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
			
			jQuery('.hide-info a').click(function(){
				jQuery(this).parent('.hide-info').fadeOut();
				return false;
			})
		});
	</script>
</head>
<body>

	<?php include('_menu.tpl'); ?>
	
	<section id="pag-prato">
		<div class="col-conteudo">
            
<!-- ==================== AREA PRATO ==================== -->
			<div class="area-prato">
				<div class="carousel-photos">
					<ul id="demo2">
						<?php foreach($dados_prato_fotos as $keyf => $valuesf){ ?>
							<li><img src="<?= APP_URI_APP ?>public/upload_fotos/<?= $valuesf ?>" /></li>
						<?php } ?>
					</ul>
				</div>
				<div class="infos-prato">
					<?php if($_SESSION['user_id'] == $dados['user_id']){ ?>
						<a href="<?= APP_URI_APP ?>pag-prato-edit/<?= $dados_prato['prato_id'] ?>" class="btn-edit"><i class="flaticon-draw"></i> Editar prato</a>
					<?php } ?>
					<div class="prim-info">
						<p class="nome-prato"><?= utf8_decode($dados_prato['nome']) ?></p>
						<!--p class="valor-prato">R$ < ?= $dados_prato['preco'] ? ></p-->
						<!-- span class="favoritar"><a href="#"><i class="flaticon-hearts49"></i></a></span -->
						<div class="clear"></div>
					</div>
					<div class="prim-info">
						<?php 
						if(count($dados_prato_precos) > 0){
							foreach($dados_prato_precos as $key_pp => $values_pp){ ?>
								<p class="nome-prato"><?= $values_pp['variacao'] ?></p>
								<p class="valor-prato">R$ <?= $values_pp['preco'] ?></p>
								<div class="clear"></div>
							<?php 
							}
						} 
						?>
					</div>
					<div class="desc-prato">
						<div class="area-descricao">
							<p><strong>Descrição:</strong></p>
							<ul>
								<li><p><?= $dados_prato['descricao'] ?></p></li>
							</ul>
						</div>
						<div class="area-ingredientes">
							<p><strong>Ingredientes:</strong></p>
							<ul>
								<li><p><?= $dados_prato['ingredientes'] ?></p></li>
							</ul>
						</div>
					</div>
					<div class="area-palavras-chave">
						<p class="sub">Palavras chaves:</p>
						<?php foreach($dados_prato_palavraschave as $keyp => $valuesp){ ?>
							<p class="keyword"><a href="<?= APP_URI_APP ?>pag-busca-realizada-categoria/pchave/<?= utf8_decode($valuesp) ?>"><?= utf8_decode($valuesp) ?></a></p>
						<?php } ?>
						<div class="clear"></div>
					</div>
					<div class="area-categoria">
						<p class="sub">Categorias:</p>
						<?php foreach($dados_prato_categorias_nome as $keyp => $valuesc){ ?>
							<p class="keyword"><a href="<?= APP_URI_APP ?>pag-busca-realizada-categoria/categoria/<?= $keyp ?>"><?= $valuesc ?></a></p>
						<?php } ?>
						<div class="clear"></div>
					</div>
					<?php include('config/compartilhamento_sociais_prato_pagprato.php'); ?>
				</div>
			</div><!-- ==================== END AREA PRATOS -->
            
<!-- ==================== AREA COMENTÁRIOS ==================== -->
			<!--div class="area-comentarios">
				<div class="title-area">
					<h2>7 Comentários </h2> 
					<div class="rating">
						<span><i class="flaticon-star7 yes"></i></span>
						<span><i class="flaticon-star7 yes"></i></span>
						<span><i class="flaticon-star7 yes"></i></span>
						<span><i class="flaticon-star7"></i></span>
						<span><i class="flaticon-star7"></i></span>
					</div>
				</div>
                
				<div class="unit-comentario">
					<div class="photo-perfil">
						<img src="http://lorempixel.com/100/100/people/" style="max-width:100%; height:auto;" />
						<p>Paulo</p>
					</div>
					<div class="texto-comentario">
						<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti pal</p>
						<p class="data">Setembro 2015</p>
						
						<div class="area-respostas">
							<div class="photo-perfil"><img src="http://lorempixel.com/100/100/people/2" style="max-width:100%; height:auto;" /></div>
							<div class="texto-resposta">
								<p class="nome-chef">Resposta da Paula: </p>
								<p>Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.</p>
								<p class="data">Setembro 2015</p>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
                
				<div class="unit-comentario">
					<div class="photo-perfil">
						<img src="http://lorempixel.com/100/100/people/3" style="max-width:100%; height:auto;" />
						<p>Renato</p>
					</div>
					<div class="texto-comentario">
						<p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti pal</p>
						<p class="data">Setembro 2015</p>
					</div>
					<div class="clear"></div>
				</div>
			</div--><!-- ==================== END AREA COMENTARIOS -->
		</div><!-- ==================== END COL CONTEUDO -->
        
<!-- ==================== AREA CONTATO ==================== -->
		<div class="col-contato">
			<div class="pos">
				<div class="c-left">
					<div class="info-chef">
						<span class="photo-perfil">
							<?php if($dados['foto']){ ?>
								<div class="img" style="background: url(<?= APP_URI_APP ?>public/upload_perfil/<?= $dados['foto'] ?>) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;"></div>
							<?php } else { ?>
								<div class="img" style="background: url(<?= APP_URI_APP ?>public/images/no_foto_thumb.png) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;"></div>
							<?php } ?>
						</span>
						<div class="ver-mais">
							<p class="name-chef"><?= $dados['nome']; ?></p>
							<a href="<?= APP_URI_APP ?>chef/<?= $dados['usuario'] ?>" class="btn-ver-perfil">Ver perfil completo</a>
						</div>
						<div class="clear"></div>
						<?php include('config/compartilhamento_sociais_chef.php'); ?>
					</div>
					<div class="info-pedido">
						<span class="icon">
							<i class="flaticon-location"></i>
						</span>
						<div class="text">
							<p class="bairro"><?= $dados_end['bairro'] ?></p>
							<p><?= $dados_end['cidade'] ?> - <?= $dados_end['estado'] ?></p>
							<p class="entrega"><?php /*if($dados_ent['realiza_entrega'] == 1){ echo "Realiza Entrega"; } else { echo "Não Realiza Entrega"; } ?></p>
							<?php if($dados_ent['realiza_entrega'] == 1){ ?>
								<p class="taxa-entrega"><strong><?= $dados_ent['taxa_entrega'] ?></strong> taxa de entrega</p>
							<?php }*/ ?>
						</div>
						<div class="clear"></div>
					</div>
					<div class="geo-local-chef">
						<!--iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.407246018619!2d-46.690323484366125!3d-23.553812867200133!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce5796431bad93%3A0x5c2a5a7de172d01!2sR.+Laboriosa%2C+89+-+Vila+Madalena%2C+S%C3%A3o+Paulo+-+SP!5e0!3m2!1spt-BR!2sbr!4v1445386403044" width="290" height="200" frameborder="0" style="border:0" allowfullscreen></iframe-->
						<?php
						$cep = $dados_end['cep'];
						$cep1 = substr($cep, 0, 5);
						$cep2 = substr($cep, 5, 3);
						$cep_novo = $cep1.'-'.$cep2;
						?>
						<script>
							jQuery(function(){
								//initMap centro do mapa + elemento div
								//initMapCep('<?= $cep_novo ?>','555','map');
								initMapCepStatic('<?= $cep_novo ?>','555','map');
							})
						</script>
						<div class="map" id="map">
							<span class="img-locale"><img src="<?= APP_URI_APP ?>public/images/local.png" /></span>
						</div>
					</div>
				</div>
				<div class="c-right">
					<div class="mais-infos">
						<?php if($_SESSION['user_id'] != $dados['user_id']){ ?>
							<div class="hide-info"><a href="#">Ver contato</a></div>
						<?php } ?>
						<p class="sub sobreposto">Contatos:</p>
						<?php foreach($dados_tel as $keyt => $valuest){ ?>
							<!--<p class="tel"><i class="flaticon-telephone5"></i><?//= $valuest ?></p>-->
							<p class="tel"><i class="flaticon-telephone5"></i><img src="<?= APP_URI_PUBLIC ?>txt2img/txt2img.php?img=<?= base64_encode($valuest); ?>"  /></p>
												<?php } ?>
						<!--<p class="mail"><a href="#"><i class="flaticon-new48"></i><?//= $dados['email'] ?></a></p>-->
						<p class="mail"><a href="#"><i class="flaticon-new48"></i><img src="<?= APP_URI_PUBLIC ?>txt2img/txt2img.php?img=<?= base64_encode($dados['email']); ?>" /></a></p>
					</div>
					
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
		
<!-- ==================== AREA CHEFES RELACIONADOS ==================== -->
		<div class="area-pratos-relacionados">
			<div class="title-area"><h2>Pratos parecidos</h2></div>
			<?php 
			foreach($pratos_parecidos as $keypp => $valuesp){ 

				if($valuesp['prato_id'] != $dados_prato['prato_id']){

					$tamanho_nome = strlen($valuesp['nome']);

					if($tamanho_nome <= $limitador_string){
						$nome = $valuesp['nome'];
					} else {
						$nome = substr($valuesp['nome'], 0, $limitador_string).'...';
					}
					
					?>
					<div class="prato">
						<h3 class="nome-prato"><?= $nome ?></h3>
						<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
						<div class="clear"></div>
						<span class="imagem-prato">
							<a href="<?= APP_URI_APP ?>pag-prato-off/<?= $valuesp['prato_id'] ?>" class="bt-ver-mais"><img src="<?= APP_URI_APP ?>public/upload_fotos/<?= $valuesp['foto'] ?>" /></a>
						</span>
						<?php include('config/compartilhamento_sociais_prato.php'); ?>
						<p class="valor-prato">R$ <?= $valuesp['preco'] ?></p>
						<a href="<?= APP_URI_APP ?>pag-prato-off/<?= $valuesp['prato_id'] ?>" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
						<div class="clear"></div>
					</div>
					<?php 
				} 
			}
			?>
			<div class="clear"></div>
		</div>

	</section>
    
	<?php include('_footer.tpl'); ?>
