<?php include('_header.tpl'); ?>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			var hContent = jQuery(".col-conteudo").height();
			var hPosContato = jQuery(".pos").height();
			jQuery(window).scroll(function(){
				var y = jQuery(window).scrollTop();
				if (y < 61){
					jQuery('.pos').removeClass('fixed').removeClass('absoluteFix');
				}else if (y >= 61 && y < hContent - hPosContato + 54){
					jQuery('.pos').addClass('fixed');
					jQuery('.pos').removeClass('absoluteFix');
				}else if (y >= hContent - hPosContato + 54){
					jQuery('.pos').removeClass('fixed');
					jQuery('.pos').addClass('absoluteFix');
				}
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
		});
	</script>
</head>
<body>

	<?php include('_menu.tpl'); ?>

	<?php if($flag == 'salvo'){ ?>
		<section id="salvo">
			Dados salvos com sucesso!
		</section>
	<?php } ?>

	
	<section id="pag-chef">
		<div class="col-conteudo">
<!-- ==================== AREA CHEF ==================== -->
			<div class="area-chef">
				<div class="photo-perfil">
					<?php if($dados['foto']){ ?>
						<img src="<?= APP_URI_APP ?>public/upload_perfil/<?= $dados['foto'] ?>" />
					<?php } else { ?>
						<img src="<?= APP_URI_APP ?>public/images/no_foto_thumb.png" />
					<?php } ?>
				</div>
				<div class="infos">
					<p class="nome"><?= $dados['nome'] ?></p>
					<p class="localidade">
						<?php if($dados_end['cidade']){ ?>
							<?= $dados_end['cidade'] ?> - <?= $dados_end['estado'] ?> - <?= $dados_end['cep'] ?>
						<?php } else { ?>
							<a href="<?= APP_URI_APP ?>pag-perfil-edit">Preencha seus dados de perfil</a>
						<?php } ?>
					</p>
					<!--div class="rating">
						<span><i class="flaticon-star7 yes"></i></span>
						<span><i class="flaticon-star7 yes"></i></span>
						<span><i class="flaticon-star7 yes"></i></span>
						<span><i class="flaticon-star7"></i></span>
						<span><i class="flaticon-star7"></i></span>
					</div-->
					<p class="desc"><?= $dados['bio'] ?></p>
				</div>
				<div class="clear"></div>
			</div><!-- ==================== END AREA CHEFE -->
            
<!-- ==================== AREA PRATOS ==================== -->
			<div class="area-pratos">
				<div class="title-area"><h2>Meus Pratos</h2></div>
				<div class="pratos-chef">
					<?php 
					if(count($lista) > 0){
						foreach($lista as $keyp => $valuesp){ 

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
								<span class="imagem-prato"><a href="<?= APP_URI_APP ?>pag-prato/<?= $valuesp['prato_id'] ?>"><img src="<?= APP_URI_APP ?>public/upload_fotos/<?= $valuesp['foto'] ?>" /></a></span>
								<?php include('config/compartilhamento_sociais_prato.php'); ?>
								<p class="valor-prato">R$ <?= $valuesp['preco'] ?></p>
								<a href="<?= APP_URI_APP ?>pag-prato/<?= $valuesp['prato_id'] ?>" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
								<div class="clear"></div>
							</div>
						<?php 
						} 
					} else {
						?>
						<a href="<?= APP_URI_APP ?>pag-meus-pratos">Cadastre seus pratos</a> 
						<?php
					}
					?>
					<div class="clear"></div>
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
					<div class="map" id="map" style="height: 200px; width: 290px;"></div>
				</div>
				<div class="infos-pedido">
					<p class="bairro"><?= $dados_end['bairro'] ?></p>
					<?php if($dados_ent['a_combinar'] == 1){ ?>
						<p class="combinar">A combinar</p>
					<?php } else { ?>
						<p class="entrega">
							<?php if($dados_ent['realiza_entrega'] == 1){ echo "Realiza Entrega"; } else { echo "Não Realiza Entrega"; } ?>
						</p>
						<?php if($dados_ent['realiza_entrega'] == 1){ ?>
							<p class="taxa-entrega"><strong><?= $dados_ent['taxa_entrega'] ?></strong> taxa de entrega</p>
						<?php } ?>
					<?php } ?>
				</div>
				<div class="mais-infos">
					<p class="sub">Contatos:</p>
					<?php foreach($dados_tel as $keyt => $valuest){ ?>
						<p class="tel"><i class="flaticon-telephone5"></i> <?= $valuest ?></p>
					<?php } ?>
					<p class="mail"><a href="#"><i class="flaticon-new48"></i> <?= $dados['email'] ?></a></p>
				</div>
				<?php include('config/compartilhamento_sociais_chef.php'); ?>
			</div>
		</div>
		<div class="clear"></div>
		
<!-- ==================== AREA CHEFES RELACIONADOS ==================== -->
<!--
		<div class="area-chefs-relacionados">
			<div class="title-area"><h2>Chefes parecidos</h2></div>
			<div class="perfil-chef">
				<div class="photo-perfil"><img src="http://lorempixel.com/100/100/people/4" style="max-width:100%; height:auto;" /></div>
				<div class="infos">
					<p class="nome">Paula Firmezza</p>
					<p class="bairro">Vila Madalena</p>
					<p class="localidade">São Paulo - SP - 01050-100</p>
					<p class="dist">2.8 km de distância</p>
					<a href="#" class="bt-ver-chef">Ver mais detalhes <i class="fa fa-angle-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="perfil-chef">
				<div class="photo-perfil"><img src="http://lorempixel.com/100/100/people/5" style="max-width:100%; height:auto;" /></div>
				<div class="infos">
					<p class="nome">Paula Firmezza</p>
					<p class="bairro">Vila Madalena</p>
					<p class="localidade">São Paulo - SP - 01050-100</p>
					<p class="dist">2.8 km de distância</p>
					<a href="#" class="bt-ver-chef">Ver mais detalhes <i class="fa fa-angle-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="perfil-chef">
				<div class="photo-perfil"><img src="http://lorempixel.com/100/100/people/6" style="max-width:100%; height:auto;" /></div>
				<div class="infos">
					<p class="nome">Paula Firmezza</p>
					<p class="bairro">Vila Madalena</p>
					<p class="localidade">São Paulo - SP - 01050-100</p>
					<p class="dist">2.8 km de distância</p>
					<a href="#" class="bt-ver-chef">Ver mais detalhes <i class="fa fa-angle-right"></i></a>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
-->
	</section>
    
	<?php include('_footer.tpl'); ?>