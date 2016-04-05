<?php include('_header.tpl'); ?>

<script type="text/javascript">
		jQuery(document).ready(function() {
			//função para ativar ou desativar o prato
			jQuery(".status-prato a").click(function(){
				jQuery(this).next(".status-prato a").removeClass("active-status");
				jQuery(this).prev(".status-prato a").removeClass("active-status");
				jQuery(this).addClass("active-status");
			});
			//função para abrir um aviso se realmente deseja deletar o prato
			jQuery(".func-action a.btn-del").click(function(){
				jQuery(this).parent(".func-action").next(jQuery(".warning-del")).fadeIn();
				return false;
			});
			//função para fechar o aviso de deletar o prato caso ele clique no Cancelar
			jQuery("a.bt-confirm-cancel").click(function(){
				jQuery(this).parent(jQuery(".warning-del")).fadeOut();
				return false;
			});

			//função para abrir um aviso se realmente deseja ocultar o prato
			jQuery(".func-action a.btn-ocultar").click(function(){
				//jQuery(this).parent(".func-action").next(jQuery("#warning-ocultar")).fadeIn();
				jQuery('#warning-ocultar').fadeIn();
				//alert('ocultar');
				return false;
			});
			//função para fechar o aviso de deletar o prato caso ele clique no Cancelar
			jQuery("a.bt-confirm-cancel-ocultar").click(function(){
				//jQuery(this).parent(jQuery("#warning-ocultar")).fadeOut();
				jQuery('#warning-ocultar').fadeOut();
				return false; 
			});
		});
	</script>
</head>
<body>

	<?php include('_menu.tpl'); ?>
	
	<section id="pag-meus-pratos">
		<div class="menu-edit">
			<?php include('_mini-menu.tpl'); ?>
		</div>
		<div class="general-area-infos">
			<a href="pag-prato-edit" class="big-btn">Adicionar um prato</a>
			<!-- ============================== LISTA DOS MEUS PRATOS ============================== -->
			<div class="lista-meus-pratos">
				<?php foreach($lista as $key => $valores){ 
						?>
						<div class="box-prato">
							<div class="imagem-prato"><img src="<?= APP_URI_APP ?>public/upload_fotos/<?= $valores['foto'] ?>" /></div>
							<div class="infos-prato">
								<p class="nome-prato"><?= $valores['nome'] ?></p>
								<!-- div class="status-prato">
									<a href="#" class="filtro f-disponivel"><span class="circle check"><i class="flaticon-tick2"></i></span> <p>Disponível</p></a>
									<a href="#" class="filtro f-ocultar"><span class="circle check"><i class="flaticon-tick2"></i></span> <p>Ocultar</p></a>
									<div class="clear"></div>
								</div -->
								<div class="func-action">
									<a href="<?= APP_URI_APP ?>pag-prato/<?= $valores['prato_id'] ?>" class="">Ver</a>
									
									<a href="<?= APP_URI_APP ?>pag-prato-edit/<?= $valores['prato_id'] ?>" class="btn-edit">Editar</a>

									<a href="<?= APP_URI_APP ?>duplica-prato/<?= $valores['prato_id'] ?>" class="">Duplicar</a>
									
									<a href="#" class="btn-ocultar">
										<?php if($valores['status'] == 0){ ?>Habilitar<?php } ?> 
										<?php if($valores['status'] == 1){ ?>Desabilitar<?php } ?> 
									</a>
									
									<a href="#" class="btn-del">Excluir</a>
									
									<div class="clear"></div>
								</div>
								<!-- ====================================================================== 
								Essa classe "warning-del" fica oculta, só aparece quando clicar em deletar
								======================================================================= -->
								<div class="warning-del">
									<p>Você tem certeza que deseja deletar o prato?</p>
									<a href="#" class="bt-confirm-cancel">Cancelar</a>
									<a href="<?= APP_URI_APP ?>delete-prato/<?= $valores['prato_id'] ?>" class="bt-confirm-delet">Deletar</a>
								</div>
								<div id="warning-ocultar" class="warning-del">
									<p>
										Você tem certeza que deseja 
										<?php if($valores['status'] == 0){ ?><b>HABILITAR</b><?php } ?> 
										<?php if($valores['status'] == 1){ ?><b>DESABILITAR</b><?php } ?>
										o prato?
									</p>
									<a href="#" class="bt-confirm-cancel">Cancelar</a>
									<a href="<?= APP_URI_APP ?>ocultar-prato/<?= $valores['prato_id'] ?>" class="bt-confirm-delet"><?php if($valores['status'] == 0){ ?>Habilitar<?php } ?> 
										<?php if($valores['status'] == 1){ ?>Desabilitar<?php } ?></a>
								</div>
							</div>
							<div class="clear"></div>
						</div>
				<?php } ?>

			</div>
		</div>
	</section>
    
	<?php include('_footer.tpl'); ?>
