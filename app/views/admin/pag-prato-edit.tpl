<?php include('_header.tpl'); ?>

<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery("input.dinheiro").maskMoney({showSymbol:true, symbol:"", decimal:",", thousands:"."});
			
			//alert(jQuery("div.add-new-prato").size());
			var qtde_fotos_inseridas = jQuery("div.add-new-prato").size();

			if(qtde_fotos_inseridas == 1){
				var max_fields_foto = 4; //maximum input boxes allowed
			} else {
				var max_fields_foto = 5 - qtde_fotos_inseridas; //maximum input boxes allowed
			}

			var wrapper_foto = jQuery(".input_fields_wrap_foto"); //Fields wrapper
    		var add_button_foto = jQuery(".add_field_button_foto"); //Add button ID
    		var x_foto = 1; //initlal text box count
			jQuery(add_button_foto).click(function(e){ //on add input button click
				e.preventDefault();
				if(x_foto < max_fields_foto){ //max input box allowed
					x_foto++; //text box increment
					jQuery(wrapper_foto).append('<div class="box-new-foto add-new-prato prato'+x_foto+'"><img src="" class="img'+x_foto+'" style="max-width:100%; height:auto; display: none;" id="output'+x_foto+'" /><input type="file" name="prato_foto[]" id="prato_foto'+x_foto+'" style="opacity:0; filter: alpha(opacity=0); position: absolute; top: 20%; left: 0; width: 100%; height:70%; z-index:9000;" onchange="loadFile(event, '+x_foto+')"><a class="add-new"><i class="flaticon-picture76 icon'+x_foto+'"></i><p class="texto'+x_foto+'">Adicionar uma foto</p></a><span class="remove_field_foto" onclick="remove_field_foto('+x_foto+');"><i class="flaticon-cross"></i></span></div>'); //add input box
				}
			});

			if(qtde_fotos_inseridas == 5){
				jQuery('.div-nova-foto').attr('style', 'display: none');
			}
			
		});

		function remove_field_foto(foto_id){

			jQuery('.prato'+foto_id).html('');
			jQuery('.prato'+foto_id).hide();

			return false;
		}

		function remove_foto(id_foto){
			var txt;
			var r = confirm("Tem certeza de que deseja apagar essa foto?");
			if (r == true) {

				jQuery.ajax({
					method: "POST",
					url: "<?= APP_URI_APP ?>apaga-foto",
					data: { id_foto: id_foto }
				})
				.done(function( msg ) {
					//alert( "Data Saved: " + msg );
					window.location.reload(true);
				});
			}
		}

		var loadFile = function(event, id) {
		    var reader = new FileReader();
		    reader.onload = function(){
				var output = document.getElementById('output'+id);
				output.src = reader.result;
				jQuery('.texto'+id).attr('style', 'display: none');
				jQuery('.icon'+id).attr('style', 'display: none');
				jQuery('.img'+id).attr('style', 'max-width:100%; height:auto;');
		    };
	    	reader.readAsDataURL(event.target.files[0]);
		  };


		jQuery(document).ready(function () {
			jQuery('#salvar').click(function() {

				var msgErroT = '';
				var msgErro = '';

				/* Nome do prato */
					if(!jQuery('#prato_nome').val()) {
						msgErro += "- Nome do prato;\r\n";
					}

				/* Preço */
					if(!jQuery('#prato_preco_valor').val() || jQuery('#prato_preco_valor').val() == '0,00') {
						msgErro += "- Preço;\r\n";
					}

				/* Variação do preço */
					if(!jQuery('#prato_preco_variacao').val()) {
						msgErro += "- Informação sobre unidade/peso;\r\n";
					}

				/* Descrição */
					if(!jQuery('#prato_descricao').val()) {
						msgErro += "- Descrição sobre o prato;\r\n";
					}

				/* Palavras chave */
					if(!jQuery('#prato_palavrachave').val()) {
						msgErro += "- Palavras-chave sobre o prato;\r\n";
					}

				/* Categorias */
					checked = jQuery("input[type=checkbox]:checked").length;

					if(!checked) {
						msgErro += "- Selecione pelo menos uma categoria.\r\n";
					}


				/* Fotos */
					if(!jQuery('#flag_img').val()){
						var srcImagem = jQuery(".img1").attr("src");
						if(!srcImagem) {
							msgErro += "- Insira pelo menos uma imagem.\r\n";
						}
					}


				if(msgErro){
					msgErroT += "Preencha os campos abaixo: \r\n";
					alert(msgErroT + msgErro);
					return false;
				} else {
					jQuery('#salvar').attr('disabled', 'disabled');
					jQuery('#form').submit();
				}


				/* Fotos */
				/*if(!jQuery('#flag_img').val()){
					var srcImagem = jQuery("[class^='img']").attr("src");
					if(!srcImagem) {
						alert("Insira pelo menos uma imagem.");
						return false;
					}
				}*/

				

			});

			jQuery('#cancelar').click(function() {
				window.location.href="<?= APP_URI_APP ?>abertura";
			});
		});

	</script>
</head>
<body>

	<?php include('_menu.tpl'); ?>
	
	<section id="pag-prato-edit">
		<div class="menu-edit">
			<?php include('_mini-menu.tpl'); ?>
		</div>
		<div class="general-area-infos">
			<div class="area-edit">
				<form name="form" id="form" enctype="multipart/form-data" action="<?= APP_URI_APP ?>save_prato" method="POST">
					<input type="hidden" name="prato_id" value="<?= $dados['prato_id'] ?>">
					<div class="box">
						<div class="box-title">
							<h3>Novo Prato</h3>
							<span class="line-style"></span>
							<div class="clear"></div>
						</div>
						<?php 
						foreach($palavraschave as $keypc => $valuepc){
							$palavras_chave .= $valuepc.',';
						} 
						$palavras_chave = substr($palavras_chave, 0, -1);
						?>
						<ul>
							<li>
								<div class="side-left">
									<p>Adicionar fotos
									<span class="tooltip tooltip-right" style="z-index: 99999" data-tooltip="Adicione a(s) foto(s) do seu prato (formatos: jpg, jpg e png). Você pode adicionar até 4 fotos de cada prato. "><i class="flaticon-interface"></i></span>
									</p>
								</div>
								<div class="side-right input_fields_wrap_foto">
									<?php foreach($fotos as $keyf => $valuesf){ ?>
										<input type="hidden" name="flag_img" id="flag_img" value="1">
										<div class="box-new-foto add-new-prato">
											<img src="/app/public/upload_fotos/<?= $valuesf ?>" />
											<a href="#" class="remove_foto" onclick="remove_foto(<?= $keyf ?>)"><i class="flaticon-cross"></i></a>
										</div>
									<?php } ?>

									<!--div class="box-new-foto">
										<span><img src="http://lorempixel.com/140/94/food/1/" /></span>
										<a href="#" class="del-foto"><i class="flaticon-delete96"></i></a>
									</div-->
									<div class="box-new-foto add-new-prato div-nova-foto prato1">
										<img src="" class="img1" style="max-width:100%; height:auto; display: none;" id="output1" />

										<input type="file" name="prato_foto[]" id="prato_foto1" style="opacity:0; filter: alpha(opacity=0); position: absolute; top: 0; left: 0; width: 100%; height:100%; z-index:9000;" onchange="loadFile(event, 1)">
										<a class="add-new">
											<i class="flaticon-picture76 icon1"></i>
											<p class="texto1">Adicionar uma foto</p>
										</a>
										<span class="remove_field_foto" onclick="remove_field_foto(1);"><i class="flaticon-cross"></i></span>
									</div>
								</div>
								<div class="side-right div-nova-foto">
									<a href="#" class="add-item add_field_button_foto"><i class="flaticon-plus79"></i> Adicionar foto</a>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Nome do prato</p>
								</div>
								<div class="side-right">
									<input name="prato_nome" id="prato_nome" type="text" value="<?= utf8_decode($dados['nome']) ?>" required>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Preço (R$)</p>
								</div>
								<div class="side-right">
									<div>
										<input name="prato_preco_valor[]" id="prato_preco_valor" type="text" value="<?= $precos[0]['preco'] ?>" class="dinheiro" placeholder="0,00" required>
										<input name="prato_preco_variacao[]" id="prato_preco_variacao" type="text" value="<?= $precos[0]['variacao'] ?>" class="" placeholder="unidade/peso" maxlength="10" required>
									</div>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div>
									<div class="side-left">
										<p>Descrição do prato</p>
									</div>
									<div class="side-right">
										<textarea name="prato_descricao" id="prato_descricao" cols="" rows="" required><?= $dados['descricao'] ?></textarea>
										<span class="tooltip tooltip-right" style="z-index: 99999" data-tooltip="Descreva seu prato, quantas pessoas ele serve, os diferenciais que sua receita pode ter (sem glúten, sem lactose, sem açúcar, etc.), e mais detalhes que podem interessar quem está comprando."><i class="flaticon-interface"></i></span>
                                        <!--div style="float:right; margin-right: 0px; width: 65%; font-style: italic;">
                                        <p><span><strong>Dica:</strong> descreva seu prato, quantas pessoas ele serve, os diferenciais que sua receita pode ter (sem glúten, sem lactose, sem açúcar, etc.), e mais detalhes que podem interessar quem está comprando.</span></p>
                                        </div-->
									</div>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Ingredientes</p>
								</div>
								<div class="side-right">
									<textarea name="prato_ingrediente" cols="" rows=""><?= $dados['ingredientes'] ?></textarea>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div>
									<div class="side-left">
										<p>Palavras chave</p>
									</div>
									<div class="side-right">
										<textarea name="prato_palavrachave" id="prato_palavrachave" cols="" rows="" placeholder="Separe as palavras chave por vírgulas." required><?= utf8_decode($palavras_chave) ?></textarea>
										<!--p><em>Separe as palavras chave por vírgulas.</em></p-->
										<span class="tooltip tooltip-right" style="z-index: 99999" data-tooltip="Coloque aqui palavras que podem ajudar na busca por seu prato. Separe as palavras por vírgulas. Exemplos: vegetariano, vegano, sem glúten, light, chocolate, sem açúcar "><i class="flaticon-interface"></i></span>
                                        <!--div style="float:right; margin-right: -30px; width: 70%; font-style: italic;"><p>Exemplos de palavras-chave:</p>
                                        <p>
                                        	Vegetariano, Vegano, Sem glúten, Light, Chocolate, Sem açúcar
                                        </p>
                                        </div-->
									</div>
                                                                    
								</div>								
								<div class="clear"></div>
							</li>
							
							<li>
								<div class="side-left">
									<p>Categoria do prato</p>
									<small>Pode escolher quanto quiser</small>
								</div>
								<div class="side-right">
									<?php
									foreach($lista_categorias as $keyc => $valuec){
										
										$checked = '';
										if($categorias[$keyc] == $keyc){
											$checked = 'checked';
										}
										
										?>
										<label class="tag-food"><input name="prato_categoria[]" type="checkbox" value="<?= $keyc ?>" <?= $checked ?>> <?= $valuec ?> </label>
										<?php
									}
									?>
									
								</div>
								<div class="clear"></div>
							</li>
						</ul>
					</div><!-- END BOX NOVO PRATO -->
					<div class="area-btns">
						<!--button class="btn bgGray" id="cancelar">Cancelar</button>
						<button class="btn bgWine" id="salvar">Salvar</button-->
						<input type="button" class="btn bgGray" id="cancelar" value="Cancelar" reui />
						<input type="submit" class="btn bgWine" id="salvar" value="Salvar" />
					</div>
				</form>
			</div>
			<div class="clear"></div>
		</div>
	</section>
    
	<?php include('_footer.tpl'); ?>
