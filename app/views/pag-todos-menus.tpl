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
	
	<section id="pag-busca-realizada">
		<div class="bar-busca">
			<div class="area-input">
				<input name="" type="text" placeholder="O que deseja comer?">
				<button>Buscar</button>
				<div class="clear"></div>
			</div>
		</div>
		<div class="bar-filtros">
			<p class="sub">Filtros:</p>
			<ul>
				<li>
					<a href="#" class="filtro"><span class="circle check ok"><i class="flaticon-tick2"></i></span> <p>Realiza a entrega</p></a>
                </li>
				<li>
					<a href="#" class="filtro"><span class="circle check"><i class="flaticon-tick2"></i></span> <p>Retirada no local</p></a>
                </li>
				<div class="clear"></div>
			</ul>
		</div>
        
		<div class="general-area-infos">
			<div class="pratos-chef">
				<div class="prato">
					<h3 class="nome-prato">Salada de abacate</h3>
					<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
					<div class="clear"></div>
					<span class="imagem-prato"><img src="http://lorempixel.com/410/274/food/4" /></span>
					<div class="bt-share">
						<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
						<div class="share-prato">
							<a href="#" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
							<a href="#" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
							<a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
							<a href="#" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
							<div class="clear"></div>
							<a href="#" class="close-share">Fechar</a>
						</div>
					</div>
					<p class="valor-prato">R$ 999,00</p>
					<a href="#" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
					<div class="clear"></div>
				</div>
				<div class="prato">
					<h3 class="nome-prato">Salada de abacate</h3>
					<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
					<div class="clear"></div>
					<span class="imagem-prato"><img src="http://lorempixel.com/410/274/food/3" /></span>
					<div class="bt-share">
						<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
						<div class="share-prato">
							<a href="#" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
							<a href="#" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
							<a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
							<a href="#" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
							<div class="clear"></div>
							<a href="#" class="close-share">Fechar</a>
						</div>
					</div>
					<p class="valor-prato">R$ 999,00</p>
					<a href="#" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
					<div class="clear"></div>
				</div>
				<div class="prato">
					<h3 class="nome-prato">Salada de abacate</h3>
					<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
					<div class="clear"></div>
					<span class="imagem-prato"><img src="http://lorempixel.com/410/274/food/2" /></span>
					<div class="bt-share">
						<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
						<div class="share-prato">
							<a href="#" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
							<a href="#" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
							<a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
							<a href="#" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
							<div class="clear"></div>
							<a href="#" class="close-share">Fechar</a>
						</div>
					</div>
					<p class="valor-prato">R$ 999,00</p>
					<a href="#" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
					<div class="clear"></div>
				</div>
				<div class="prato">
					<h3 class="nome-prato">Salada de abacate</h3>
					<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
					<div class="clear"></div>
					<span class="imagem-prato"><img src="http://lorempixel.com/410/274/food/1" /></span>
					<div class="bt-share">
						<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
						<div class="share-prato">
							<a href="#" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
							<a href="#" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
							<a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
							<a href="#" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
							<div class="clear"></div>
							<a href="#" class="close-share">Fechar</a>
						</div>
					</div>
					<p class="valor-prato">R$ 999,00</p>
					<a href="#" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
					<div class="clear"></div>
				</div>
				<div class="prato">
					<h3 class="nome-prato">Salada de abacate</h3>
					<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
					<div class="clear"></div>
					<span class="imagem-prato"><img src="http://lorempixel.com/410/274/food/5" /></span>
					<div class="bt-share">
						<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
						<div class="share-prato">
							<a href="#" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
							<a href="#" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
							<a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
							<a href="#" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
							<div class="clear"></div>
							<a href="#" class="close-share">Fechar</a>
						</div>
					</div>
					<p class="valor-prato">R$ 999,00</p>
					<a href="#" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
					<div class="clear"></div>
				</div>
				<div class="prato">
					<h3 class="nome-prato">Salada de abacate</h3>
					<!-- span class="fav-heart"><i class="flaticon-hearts49"></i></span -->
					<div class="clear"></div>
					<span class="imagem-prato"><img src="http://lorempixel.com/410/274/food/6" /></span>
					<div class="bt-share">
						<a href="#" class="click-share"><i class="flaticon-network19"></i></a>
						<div class="share-prato">
							<a href="#" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>
							<a href="#" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>
							<a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>
							<a href="#" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>
							<div class="clear"></div>
							<a href="#" class="close-share">Fechar</a>
						</div>
					</div>
					<p class="valor-prato">R$ 999,00</p>
					<a href="#" class="bt-ver-mais">Ver mais detalhes <i class="flaticon-arrow158"></i></a>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
