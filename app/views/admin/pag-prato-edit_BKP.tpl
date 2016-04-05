<?php include('_header.tpl'); ?>

<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("input.dinheiro").maskMoney({showSymbol:true, symbol:"R$", decimal:",", thousands:"."});
			
			// code for add input field
			var max_fields      = 30; //maximum input boxes allowed
			var wrapper         = jQuery(".input_fields_wrap"); //Fields wrapper
			var add_button      = jQuery(".add_field_button"); //Add button ID
    
			var x = 1; //initlal text box count
			jQuery(add_button).click(function(e){ //on add input button click
				e.preventDefault();
				if(x < max_fields){ //max input box allowed
					x++; //text box increment
					jQuery(wrapper).append('<div><input name="prato_ingrediente[]" type="text" class="inline"><input name="prato_quantidade[]" type="text" class="inline small" placeholder="Qtd" style="margin-left:3px;"><select name="prato_unidade[]" style="margin-left:3px;"><option>kg</option><option>ml</option></select><a href="#" class="remove_field">X</a></div>'); //add input box
				}
			});
    
			jQuery(wrapper).on("click",".remove_field", function(e){ //user click on remove text
				e.preventDefault(); jQuery(this).parent('div').remove(); x--;
    		});


			var max_fields_foto = 30; //maximum input boxes allowed
			var wrapper_foto = jQuery(".input_fields_wrap_foto"); //Fields wrapper
    		var add_button_foto = jQuery(".add_field_button_foto"); //Add button ID
    		var x_foto = 1; //initlal text box count
			jQuery(add_button_foto).click(function(e){ //on add input button click
				e.preventDefault();
				if(x_foto < max_fields_foto){ //max input box allowed
					x_foto++; //text box increment
					jQuery(wrapper_foto).append('<div class="box-new-foto add-new-prato"><input type="file" name="prato_foto[]" style="opacity:0; filter: alpha(opacity=0); position: absolute; top: 0; left: 0; width: 100%; height:100%; z-index:9000;"><a class="add-new"><i class="flaticon-picture76"></i><p>Adicionar uma foto</p></a></div>'); //add input box
				}
			});

		});
	</script>
</head>
<body>

	<?php include('_menu.tpl'); ?>
	
	<section id="pag-prato-edit">
		<div class="menu-edit">
			<a href="#">Meu perfil</a>
			<!-- a href="#">Favoritos</a -->
			<a href="#" class="select">Meus pratos</a>
		</div>
		<div class="general-area-infos">
			<div class="area-edit">
				<form name="form" enctype="multipart/form-data" action="save_prato" method="POST">
					<div class="box">
						<div class="box-title">
							<h3>Novo Prato</h3>
							<span class="line-style"></span>
							<div class="clear"></div>
						</div>
						<ul>
							<li>
								<div class="side-left">
									<p>Nome do prato</p>
								</div>
								<div class="side-right">
									<input name="prato_nome" type="text">
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Preço (R$)</p>
								</div>
								<div class="side-right">
									<input name="prato_preco" type="text" value="" class="dinheiro" placeholder="0,00">
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Descrição do prato</p>
								</div>
								<div class="side-right">
									<textarea name="prato_descricao" cols="" rows=""></textarea>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Ingredientes</p>
								</div>
								<div class="side-right input_fields_wrap">
									<div>
										<input name="prato_ingrediente[]" type="text" class="inline">
										<input name="prato_quantidade[]" type="text" class="inline small" placeholder="Qtd">
										<select name="prato_unidade[]">
											<option>kg</option>
											<option>ml</option>
										</select>
									</div>
	                                <a href="#" class="add-item add_field_button"><i class="flaticon-plus79"></i> Adicionar ingrediente</a>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Palavras chave</p>
								</div>
								<div class="side-right">
									<textarea name="prato_palavrachave" cols="" rows=""></textarea>
									<p><em>Separe as palavras chave por vírgulas.</em></p>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Adicionar fotos</p>
								</div>
								<div class="side-right input_fields_wrap_foto">
									<!--div class="box-new-foto">
										<span><img src="http://lorempixel.com/140/94/food/1/" /></span>
										<a href="#" class="del-foto"><i class="flaticon-delete96"></i></a>
									</div-->
									<div class="box-new-foto add-new-prato">
										<input type="file" name="prato_foto[]" style="opacity:0; filter: alpha(opacity=0); position: absolute; top: 0; left: 0; width: 100%; height:100%; z-index:9000;">
										<a class="add-new">
											<i class="flaticon-picture76"></i>
											<p>Adicionar uma foto</p>
										</a>
									</div>
									<a href="#" class="add-item add_field_button_foto"><i class="flaticon-plus79"></i> Adicionar foto</a>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Categoria do prato</p>
									<small>Pode escolher quanto quiser</small>
								</div>
								<div class="side-right">
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Árabe"> Árabe</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Cozinha Rápida"> Cozinha Rápida</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Pizza"> Pizza</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Asiática"> Asiática</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Italiana"> Italiana</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Saudável"> Saudável</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Brasileira"> Brasileira</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Japonesa"> Japonesa</label>
									<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="Doces e Salgados"> Doces e Salgados</label>
								</div>
								<div class="clear"></div>
							</li>
						</ul>
					</div><!-- END BOX NOVO PRATO -->
					<div class="area-btns">
						<button class="btn bgGray">Cancelar</button>
						<button class="btn bgWine">Prosseguir</button>
					</div>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</section>
    
	<footer>
		<div class="main">
			<a href="#" class="foo-logo"><img src="images/logo-white.png" style="max-width:100%; height:auto;" /></a>
			<p class="foo-sobre">Sobre a <a href="#">Baobbá Lab</a></p>
			<div class="clear"></div>
			<!-- select name="language" class="foo-sel-language">
				<option>Português</option>
				<option>English</option>
			</select -->
			<div class="foo-submenu">
				<a href="#">Ajudar</a>
				<a href="#">Política de uso</a>
				<a href="#">Termos de privacidade</a>
			</div>
			<div class="clear"></div>
			<div class="foo-siga-nos">
				<p>Siga-nos</p>
				<a href="#"><i class="flaticon-logotype42"></i></a>
				<a href="#"><i class="flaticon-twitter1"></i></a>
				<a href="#"><i class="flaticon-instagram12"></i></a>
			</div>
		</div>
	</footer>

</body>
</html>
