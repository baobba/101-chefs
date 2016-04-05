<?php include('_header.tpl'); ?>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			jQuery(window).scroll(function(){
				var y = jQuery(window).scrollTop();
				if (y >= 61){
					jQuery('.pos').addClass('fixed');
				}else {
					jQuery('.pos').removeClass('fixed');
				}
			})
			jQuery.localScroll.defaults.axis = 'y';
			jQuery.localScroll.hash({
				queue: true,
				duration: 500
			});
			jQuery('.scroll').localScroll({
				duration: 500
			});
			if(jQuery(window).width() > 768){
				jQuery(window).scroll(function(){
					var heightFix = jQuery("header").innerHeight() + jQuery(".menu-edit").innerHeight();
					var y = jQuery(window).scrollTop();
					if (y >= heightFix + 40){
						jQuery('.vert-menu').addClass('fix-menu');
					}else {
						jQuery('.vert-menu').removeClass('fix-menu');
					}
				})
			}
			jQuery("input.dinheiro").maskMoney({showSymbol:true, symbol:"", decimal:",", thousands:"."});
			
			
			// code for add input field
			var max_fields      = 2; //maximum input boxes allowed
			var wrapper         = jQuery(".input_fields_wrap"); //Fields wrapper
			var add_button      = jQuery(".add_field_button"); //Add button ID
    
			var x = 1; //initlal text box count
			jQuery(add_button).click(function(e){ //on add input button click
				e.preventDefault();
				if(x < max_fields){ //max input box allowed
					x++; //text box increment
					jQuery(wrapper).append('<div><input type="text" name="telefone[]" class="fone" maxlength="15" placeholder="(xx) xxxxx-xxxx" style="display:inline-block"><a href="#" class="remove_field"><i class="flaticon-close5"></i></a></div>'); //add input box
				}
			});
    
			jQuery(wrapper).on("click",".remove_field", function(e){ //user click on remove text
				e.preventDefault(); jQuery(this).parent('div').remove(); x--;
    		});
			
			// code for add input field SOCIAL MEDIA
			var max_fields_sm	= 6; //maximum input boxes allowed
			var wrapper_sm		= jQuery(".input_fields_wrap_sm"); //Fields wrapper
			var add_button_sm	= jQuery(".add_field_button_sm"); //Add button ID
    
			var y = 1; //initlal text box count
			jQuery(add_button_sm).click(function(e){ //on add input button click
				e.preventDefault();
				if(y < max_fields_sm){ //max input box allowed
					y++; //text box increment
					jQuery(wrapper_sm).append('<div class="sm"><input name="link_social[]" type="text" value="" class="inline" placeholder="Copie e cole a url aqui!"><select name="rede_social[]" class="inline" style="margin-left:3px;"><option value="Facebook">Facebook</option><option value="Twitter">Twitter</option><option value="Youtube">Youtube</option><option value="Pinterest">Pinterest</option><option value="Instagram">Instagram</option><option value="Site pessoal">Site pessoal</option></select><a href="#" class="remove_field_sm"><i class="flaticon-close5"></i></a></div>'); //add input box
				}
			});
    
			jQuery(wrapper_sm).on("click",".remove_field_sm", function(e){ //user click on remove text
				e.preventDefault(); jQuery(this).parent('div.sm').remove(); y--;
    		});
			
			
		});

		function buscaCep(cep){
			jQuery.ajax({
				method: "POST",
				url: "<?= APP_URI_APP ?>/busca-cep",
				dataType : "json",
				data: { cep: cep }
			})
			.done(function( data ) {
				jQuery('#rua').val(data.logradouro);
				jQuery('#complemento').val(data.complemento);
				jQuery('#cidade').val(data.localidade);
				jQuery('#bairro').val(data.bairro);
				jQuery('#numero').val('');
				jQuery("#estado").val(data.uf);
			});
		}

		function verificaLogin(campo1){
			
			jQuery.ajax({
				method: "POST",
				url: "<?= APP_URI_APP ?>/checa_login",
				dataType : "json",
				data: { login: campo1 },
				success:function(data) {
					if(data == 1){
						//alert("Esse usuário já está sendo usado, por favor escolha outro.");
						jQuery('#erro').html("Esse usuário já está sendo usado, por favor escolha outro.");
						jQuery('#usuario').val('');
					}
					
				}
			});
		}

		function verificacpf(valor){

			jQuery('#erro2').html("");

			var valida = valida_cpf(valor);

			if(valida == true){

				jQuery.ajax({
					method: "POST",
					url: "<?= APP_URI_APP ?>checa_cpf",
					dataType : "json",
					data: { cpf: valor },
					success:function(data) {
						if(data == 1){
							//alert("Esse usuário já está sendo usado, por favor escolha outro.");
							jQuery('#erro2').html("Esse CPF já está sendo usado, por favor escolha outro.");
							jQuery('#cpf').val('');
						}
						
					}
				});

			} else {

				jQuery('#erro2').html("Esse CPF é inválido, por favor digitar novamente.");
				jQuery('#cpf').val('');

			}

		}

		function verificacnpj(valor){

			jQuery('#erro3').html("");

			var valida = valida_cnpj(valor);

			if(valida == true){

				jQuery.ajax({
					method: "POST",
					url: "<?= APP_URI_APP ?>checa_cnpj",
					dataType : "json",
					data: { cnpj: valor },
					success:function(data) {
						if(data == 1){
							//alert("Esse usuário já está sendo usado, por favor escolha outro.");
							jQuery('#erro3').html("Esse CNPJ já está sendo usado, por favor escolha outro.");
							jQuery('#cnpj').val('');
						}
						
					}
				});

			} else {

				jQuery('#erro3').html("Esse CNPJ é inválido, por favor digitar novamente.");
				jQuery('#cnpj').val('');

			}

		}

		function retiraHifenCep(cep){
			cep = cep.replace( "-" , ""); //tira hífen
			jQuery('#cep').val(cep);
		}

		jQuery(document).ready(function () {
			jQuery('#cancelar').click(function() {
				window.location.href="<?= APP_URI_APP ?>abertura";
			});
			jQuery('#cancelarSenha').click(function() {
				window.location.href="<?= APP_URI_APP ?>abertura";
			});


			/* CONTADOR DE CARACTERES */
				var limite  = 255;
				var tamanho = jQuery("#bio").val().length;
				var contador = limite - tamanho;
				jQuery(".caracteres").text(contador);

				jQuery("#bio").keyup(function(){
					var limite  = 255;
					var tamanho = jQuery(this).val().length;

					if(tamanho > limite)
						tamanho -= 1;

					var contador = limite - tamanho;
					jQuery(".caracteres").text(contador);

					if(tamanho >= limite){
						var txt = jQuery(this).val().substring(0, limite);
						jQuery(this).val(txt);
					}
				});

		});


//		function deletar_perfil(){
//			var txt;
//			var r = confirm("Tem certeza de que deseja apagar este perfil?");
//			if (r == true) {
//			    window.location.href="<?= APP_URI_APP ?>delete-perfil/<?= $dados_perfil['id'] ?>";
//			}
//		}		
        
        function deletar_perfil(){
           // var id = "<?= APP_URI_APP ?>delete-perfil/<?= $dados_perfil['id'] ?>";
//            alert(id);
            swal({   
                title: "Deletar perfil",   
                text: "Tem certeza de que deseja apagar este perfil?",   
                type: "warning",   
                showCancelButton: true,   
                confirmButtonColor: "#DD6B55",
                cancelButtonText: "Cancelar",
                confirmButtonText: "Sim, apague!",   
                closeOnConfirm: false }, 
            function(){ 
//                swal("<?= APP_URI_APP ?>delete-perfil/<?= $dados_perfil['id'] ?>");
                
                swal("Apagado!", "Seu perfil foi apagado com sucesso", "success");              
                window.location.href="<?= APP_URI_APP ?>delete-perfil/<?= $_SESSION['user_id'] ?>";                
            });
		}


	</script>
    
	
</head>
<body>

	<?php include('_menu.tpl'); ?>
	
	<section id="pag-perfil-edit">
		<div class="menu-edit">
			<?php include('_mini-menu.tpl'); ?>
		</div>

		<div class="general-area-infos">
			<div class="vert-menu">
				<div><a href="#goto-informacoes" class="btn" onclick="abrediv('perfil')">Informações pessoais</a></div>
				<div><a href="#goto-contato" class="btn" onclick="abrediv('perfil')">Contato</a></div>
				<div><a href="#goto-meuperfil" class="btn" onclick="abrediv('perfil')">Meu perfil</a></div>
<!--				<div><a href="#goto-entrega" class="btn" onclick="abrediv('perfil')">Entrega</a></div>-->
				<div><a href="#goto-endereco" class="btn" onclick="abrediv('perfil')">Endereço</a></div>
				<div><a href="#goto-alterarsenha" class="btn" onclick="abrediv('senha')">Alterar senha</a></div>

				<div><a href="#goto-deletarperfil" class="btn" onclick="deletar_perfil()">Deletar perfil</a></div>

				<!--a href="#" class="btn bgWine">Prosseguir</a-->
			</div> 
            <?php if(empty($dados_perfil['usuario'])){ ?>
            <div class="area-edit popup"> É necessário completar o cadastro abaixo para adicionar seus pratos.</div><?php } else { ?><?php }?>
			<div class="area-edit" id="perfil">               
				<form name="form" enctype="multipart/form-data" runat="server" method="post" action="<?= APP_URI_APP ?>perfil/save">
					<input type="hidden" name="perfil_id" value="<?= $dados_perfil['id'] ?>">
					<div class="box" id="goto-informacoes"><a name="goto-informacoes"></a>
						<div class="box-title">
							<h3>Informações Pessoais</h3>
							<span class="line-style"></span>
							<div class="clear"></div>
						</div>
						<ul>
							<li>
								<div class="side-left">
									<div class="photo-perfil">
										<img src="" class="img1 img" style="display: none;" id="output1" />
										<?php if(!empty($dados_perfil['foto'])){ ?>
											<div class="img foto-atual" style="background: url(<?= APP_URI_APP ?>public/upload_perfil/<?= $dados_perfil['foto'] ?>) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div>
										<?php } else { ?>
											<div class="img" style="background: url(public/images/no_foto_thumb.png) no-repeat center center; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover;" id="output"></div>
										<?php }?>									
										<script>
										/*
											var loadFile = function(event) {
												var reader = new FileReader();
												reader.onload = function(){
													var output = document.getElementById('output');
													output.src = reader.result;
												};
												reader.readAsDataURL(event.target.files[0]);
											};
										*/

										  	var loadFile = function(event, id) {
											    var reader = new FileReader();
											    reader.onload = function(){
													var output = document.getElementById('output'+id);
													output.src = reader.result;
													jQuery('.foto-atual').attr('style', 'display: none');
													jQuery('.texto'+id).attr('style', 'display: none');
													jQuery('.icon'+id).attr('style', 'display: none');
													jQuery('.img'+id).attr('style', '');
											    };
										    	reader.readAsDataURL(event.target.files[0]);
											};
										</script>
									</div>
								</div>
								<div class="side-right">
									<a class="btn border"><input type="file" name="foto_perfil" id="imgInp" style="position:absolute; top:0; left:0; width:100%; height:100%; display:block; z-index:9000; filter: alpha(opacity=0); opacity: 0;" onchange="loadFile(event, 1)"><span style="font-size: 12px;">Adicione a sua foto de perfil. Ela aparecerá no círculo ao lado. Pode ser nos formatos jpg, jpg e png. </span></a>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Usuário</p>
								</div>
								<div class="side-right">
									<input name="usuario" id="usuario" type="text" value="<?= $dados_perfil['usuario'] ?>" onchange="verificaLogin(this.value);" placeholder="Seu usuário" style="text-transform:lowercase; white-space: nowrap;" required> <span id="erro"></span>
									<span class="tooltip tooltip-right" style="z-index: 99999" data-tooltip="Escolha seu nome de usuário. Ele aparecerá no endereço da sua página (ex: http://www.101chefs.com.br/chef/paulabelleza) e também pode ser usado para fazer login. Ele é único e, uma vez definido, não pode ser alterado. "><i class="flaticon-interface"></i></span>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Nome</p>
								</div>
								<div class="side-right">
									<input name="nome" type="text" value="<?= $dados_perfil['nome'] ?>" placeholder="Seu nome">
<!--									<span class="tooltip tooltip-right" data-tooltip="Teste de tooltip!&#10;Preencha este campo com seu nome."><i class="flaticon-search100"></i></span>-->
								</div>
								<div class="clear"></div>
							</li>
							<!--li>
								<div class="side-left">
									<p>Sobrenome</p>
								</div>
								<div class="side-right">
									<input name="sobrenome" type="text" value="<--?= $dados_perfil['sobrenome'] ?''>" placeholder="Seu sobrenome">
								</div>
								<div class="clear"></div>
							</li-->
							<li>
								<div class="side-left">
									<p>Sexo</p>
								</div>
								<div class="side-right">
									<select name="sexo">
										<option value="Masculino" <?php if($dados_perfil['sexo'] == 'Masculino'){ ?> selected <?php } ?>>Masculino</option>
										<option value="Feminino" <?php if($dados_perfil['sexo'] == 'Feminino'){ ?> selected <?php } ?>>Feminino</option>
									</select>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Data de nascimento</p>
								</div>
								<div class="side-right">
									<select name="dia_nascimento">
										<option value="01" <?php if($dados_perfil['dia_nascimento'] == '01'){ ?> selected <?php } ?>>01</option>
										<option value="02" <?php if($dados_perfil['dia_nascimento'] == '02'){ ?> selected <?php } ?>>02</option>
										<option value="03" <?php if($dados_perfil['dia_nascimento'] == '03'){ ?> selected <?php } ?>>03</option>
										<option value="04" <?php if($dados_perfil['dia_nascimento'] == '04'){ ?> selected <?php } ?>>04</option>
										<option value="05" <?php if($dados_perfil['dia_nascimento'] == '05'){ ?> selected <?php } ?>>05</option>
										<option value="06" <?php if($dados_perfil['dia_nascimento'] == '06'){ ?> selected <?php } ?>>06</option>
										<option value="07" <?php if($dados_perfil['dia_nascimento'] == '07'){ ?> selected <?php } ?>>07</option>
										<option value="08" <?php if($dados_perfil['dia_nascimento'] == '08'){ ?> selected <?php } ?>>08</option>
										<option value="09" <?php if($dados_perfil['dia_nascimento'] == '09'){ ?> selected <?php } ?>>09</option>
										<option value="10" <?php if($dados_perfil['dia_nascimento'] == '10'){ ?> selected <?php } ?>>10</option>
										<option value="11" <?php if($dados_perfil['dia_nascimento'] == '11'){ ?> selected <?php } ?>>11</option>
										<option value="12" <?php if($dados_perfil['dia_nascimento'] == '12'){ ?> selected <?php } ?>>12</option>
										<option value="13" <?php if($dados_perfil['dia_nascimento'] == '13'){ ?> selected <?php } ?>>13</option>
										<option value="14" <?php if($dados_perfil['dia_nascimento'] == '14'){ ?> selected <?php } ?>>14</option>
										<option value="15" <?php if($dados_perfil['dia_nascimento'] == '15'){ ?> selected <?php } ?>>15</option>
										<option value="16" <?php if($dados_perfil['dia_nascimento'] == '16'){ ?> selected <?php } ?>>16</option>
										<option value="17" <?php if($dados_perfil['dia_nascimento'] == '17'){ ?> selected <?php } ?>>17</option>
										<option value="18" <?php if($dados_perfil['dia_nascimento'] == '18'){ ?> selected <?php } ?>>18</option>
										<option value="19" <?php if($dados_perfil['dia_nascimento'] == '19'){ ?> selected <?php } ?>>19</option>
										<option value="20" <?php if($dados_perfil['dia_nascimento'] == '20'){ ?> selected <?php } ?>>20</option>
										<option value="21" <?php if($dados_perfil['dia_nascimento'] == '21'){ ?> selected <?php } ?>>21</option>
										<option value="22" <?php if($dados_perfil['dia_nascimento'] == '22'){ ?> selected <?php } ?>>22</option>
										<option value="23" <?php if($dados_perfil['dia_nascimento'] == '23'){ ?> selected <?php } ?>>23</option>
										<option value="24" <?php if($dados_perfil['dia_nascimento'] == '24'){ ?> selected <?php } ?>>24</option>
										<option value="25" <?php if($dados_perfil['dia_nascimento'] == '25'){ ?> selected <?php } ?>>25</option>
										<option value="26" <?php if($dados_perfil['dia_nascimento'] == '26'){ ?> selected <?php } ?>>26</option>
										<option value="27" <?php if($dados_perfil['dia_nascimento'] == '27'){ ?> selected <?php } ?>>27</option>
										<option value="28" <?php if($dados_perfil['dia_nascimento'] == '28'){ ?> selected <?php } ?>>28</option>
										<option value="29" <?php if($dados_perfil['dia_nascimento'] == '29'){ ?> selected <?php } ?>>29</option>
										<option value="30" <?php if($dados_perfil['dia_nascimento'] == '30'){ ?> selected <?php } ?>>30</option>
										<option value="31" <?php if($dados_perfil['dia_nascimento'] == '31'){ ?> selected <?php } ?>>31</option>
									</select>
									<select name="mes_nascimento">
										<option value="01" <?php if($dados_perfil['mes_nascimento'] == '01'){ ?> selected <?php } ?>>Janeiro</option>
										<option value="02" <?php if($dados_perfil['mes_nascimento'] == '02'){ ?> selected <?php } ?>>Fevereiro</option>
										<option value="03" <?php if($dados_perfil['mes_nascimento'] == '03'){ ?> selected <?php } ?>>Março</option>
										<option value="04" <?php if($dados_perfil['mes_nascimento'] == '04'){ ?> selected <?php } ?>>Abril</option>
										<option value="05" <?php if($dados_perfil['mes_nascimento'] == '05'){ ?> selected <?php } ?>>Maio</option>
										<option value="06" <?php if($dados_perfil['mes_nascimento'] == '06'){ ?> selected <?php } ?>>Junho</option>
										<option value="07" <?php if($dados_perfil['mes_nascimento'] == '07'){ ?> selected <?php } ?>>Julho</option>
										<option value="08" <?php if($dados_perfil['mes_nascimento'] == '08'){ ?> selected <?php } ?>>Agosto</option>
										<option value="09" <?php if($dados_perfil['mes_nascimento'] == '09'){ ?> selected <?php } ?>>Setembro</option>
										<option value="10" <?php if($dados_perfil['mes_nascimento'] == '10'){ ?> selected <?php } ?>>Outubro</option>
										<option value="11" <?php if($dados_perfil['mes_nascimento'] == '11'){ ?> selected <?php } ?>>Novembro</option>
										<option value="12" <?php if($dados_perfil['mes_nascimento'] == '12'){ ?> selected <?php } ?>>Dezembro</option>
									</select>
									<?php
									$ano_menor = date('Y')-80;
									$ano_atual = date('Y');
									?>
									<select name="ano_nascimento">
										<?php for($i=$ano_atual; $i>=$ano_menor; $i--){ ?>
											<option value="<?= $i ?>" <?php if($dados_perfil['ano_nascimento'] == $i){ ?> selected <?php } ?>><?= $i ?></option>
										<?php } ?>
									</select>
								</div>
								<div class="clear"></div>
							</li>
							<li> 
								<div class="side-left">
									<p>CPF</p>
								</div>
								<div class="side-right">
									<input name="cpf" id="cpf" type="text" value="<?= $dados_perfil['cpf'] ?>" placeholder="" onchange="verificacpf(this.value)" required>
									<span id="erro2"></span>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>CNPJ</p>
								</div>
								<div class="side-right">
									<input name="cnpj" id="cnpj" type="text" value="<?= $dados_perfil['cnpj'] ?>" placeholder="" onchange="verificacnpj(this.value)">
									<span id="erro3"></span>
								</div>
								<div class="clear"></div>
							</li>
						</ul>
					</div><!-- END BOX INFORMAÇÕES PESSOAIS -->
					<div class="box" id="goto-contato"><a name="goto-contato"></a>
						<div class="box-title">
							<h3>Contato</h3>
							<span class="line-style"></span>
							<div class="clear"></div>
						</div>
						<ul>
							<li>
								<div class="side-left">
									<p>E-mail</p>
								</div>
								<div class="side-right">
									<input name="email" type="text" value="<?= $dados_perfil['email'] ?>" placeholder="seuemail@provedor.com" required>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Nº de telefone</p>
								</div>
								<?php  
								if(count($dados_telefone) > 0){
									?>
									<div class="side-right input_fields_wrap">
										<?php
										foreach($dados_telefone as $keyt => $valuest){
											?>
											<div>
												<div><input type="text" name="telefone[]" value="<?= $valuest ?>" class="fone" maxlength="15" placeholder="(xx) xxxxx-xxxx"><a href="#" class="remove_field"><i class="flaticon-close5"></i></a></div>
											</div>
											<?php
										}
										?>
										<a href="#" class="add-item add_field_button"><i class="flaticon-plus79"></i> Adicionar um número de telefone</a>
									</div>
									<?php
								} else {
									?>
									<div class="side-right input_fields_wrap">
										<div><input type="text" name="telefone[]" class="fone" maxlength="15" placeholder="(xx) xxxxx-xxxx" required></div>
										<a href="#" class="add-item add_field_button"><i class="flaticon-plus79"></i> Adicionar um número de telefone</a>
									</div>
								<?php } ?>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Redes Sociais</p>
								</div>
								<?php  
								if(count($dados_sociais) > 0){
									?>
									<div class="side-right input_fields_wrap_sm">
										<?php foreach($dados_sociais as $keys => $valuess){ 
											?>
											<div class="sm">
												<input name="link_social[]" type="text" value="<?= $valuess['link'] ?>" class="inline" placeholder="http://facebook.com/seuperfil">
												<select name="rede_social[]" class="inline">
													<option value="Facebook" <?php if($valuess['redesocial'] == 'Facebook'){ ?> selected <?php } ?>>Facebook</option>
													<option value="Twitter" <?php if($valuess['redesocial'] == 'Twitter'){ ?> selected <?php } ?>>Twitter</option>
													<option value="Youtube" <?php if($valuess['redesocial'] == 'Youtube'){ ?> selected <?php } ?>>Youtube</option>
													<option value="Pinterest" <?php if($valuess['redesocial'] == 'Pinterest'){ ?> selected <?php } ?>>Pinterest</option>
													<option value="Instagram" <?php if($valuess['redesocial'] == 'Instagram'){ ?> selected <?php } ?>>Instagram</option>
													<option value="Google+" <?php if($valuess['redesocial'] == 'Google+'){ ?> selected <?php } ?>>Google+</option>
													<option value="Site pessoal" <?php if($valuess['redesocial'] == 'Site pessoal'){ ?> selected <?php } ?>>Site pessoal</option>
												</select>
												<a href="#" class="remove_field_sm"><i class="flaticon-close5"></i></a>
											</div>
										<?php } ?>
										<a href="#" class="add-item add_field_button_sm"><i class="flaticon-plus79"></i> Adicionar uma rede social</a>
									</div>
									<?php
								} else {
									?>
									<div class="side-right input_fields_wrap_sm">
										<div>
											<input name="link_social[]" type="text" value="" class="inline" placeholder="http://facebook.com/seuperfil">
											<select name="rede_social[]" class="inline">
												<option value="Facebook">Facebook</option>
												<option value="Twitter">Twitter</option>
												<option value="Youtube">Youtube</option>
												<option value="Pinterest">Pinterest</option>
												<option value="Instagram">Instagram</option>
												<option value="Site pessoal">Site pessoal</option>
											</select>
										</div>
										<a href="#" class="add-item add_field_button_sm"><i class="flaticon-plus79"></i> Adicionar uma rede social</a>
									</div>
								<?php } ?>
								<div class="clear"></div>
							</li>
						</ul>
					</div><!-- END BOX INFORMAÇÕES PESSOAIS -->
					
					
					<!-- BOTÃO PARA EXPANDIR AREA DO CHEFE -->
					<!-- div class="quero-ser-chefe"><a href="#" class="big-btn">Quero ser chefe</a></div>
					<div class="clear"></div -->
						
					<div class="exclusive-chefe"><!-- AREA EXCLUSIVA SE A PESSOA CLICAR EM "QUERO SER CHEFE" -->
						<div class="box" id="goto-meuperfil"><a name="goto-meuperfil"></a>
							<div class="box-title">
								<h3>Perfil do Chefe</h3>
								<span class="line-style"></span>
								<div class="clear"></div>
							</div>
							<ul>
								<li>
									<div class="side-left">
										<p>Bio</p>
									</div>
									<div class="side-right">
										<span class="caracteres"></span> caracteres restantes 
										<span class="tooltip tooltip-right" style="z-index: 99999" data-tooltip="Ajude seus clientes a lhe conhecerem melhor, conte um pouco sobre você, sobre seus gostos e suas inspirações na cozinha, sua comida, suas motivações."><i class="flaticon-interface"></i></span>
										<br>
										<textarea name="bio" id="bio" cols="45" rows="10" placeholder="Fale um pouco sobre você"><?= $dados_perfil['bio'] ?></textarea>
									</div>
									<div class="clear"></div>
								</li>
							</ul>
						</div><!-- END BOX INFORMAÇÕES PESSOAIS -->
	                    
						<!-- <div class="box" id="goto-entrega"><a name="goto-entrega"></a>
							<div class="box-title">
								<h3>Entrega</h3>
								<span class="line-style"></span>
								<div class="clear"></div>
							</div>
							<ul>
								<li>
									<div class="side-left">
										<p>Realiza entrega?</p>
									</div>
									<div class="side-right">
										<label>
											<input name="entrega" class="entrega" type="radio" value="1" <?php //if($dados_entrega['realiza_entrega'] == 1){ ?> checked <?php //} ?>>
											Sim
										</label>
										<label>
											<input name="entrega" class="entrega" type="radio" value="0" <?php //if($dados_entrega['realiza_entrega'] == 0){ ?> checked <?php //} ?>>
											Não
										</label>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Á combinar</p>
									</div>
									<div class="side-right">
										<label>
											<input name="a_combinar" id="a_combinar" type="checkbox" value="1" onclick="desabilitaValores()" <?php //if($dados_entrega['a_combinar'] == 1){ ?> checked <?php //} ?>>
											<small class="warning">Caso o valor seja combinado selecione essa opção</small>
										</label>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Taxa de entrega</p>
									</div>
									<div class="side-right">
										<label>
											R$ <input name="taxa_entrega" id="taxa_entrega" type="text" value="<?//= $dados_entrega['taxa_entrega'] ?>" class="inline dinheiro" placeholder="0,00">
										</label>
									</div>
									<div class="clear"></div>
								</li>
							</ul>
						</div> -->
						<!-- END BOX INFORMAÇÕES PESSOAIS -->
	                    
						<div class="box" id="goto-endereco"><a name="goto-endereco"></a>
							<div class="box-title">
								<h3>Endereço</h3>
								<span class="line-style"></span>
								<div class="clear"></div>
							</div>
							<ul>
								<li>
									<div class="side-left">
										<p>CEP</p>
									</div>
									<div class="side-right">
										<input type="text" name="cep" id="cep" value="<?= $dados_endereco['cep'] ?>" onKeyPress="MascaraCep(form.cep);" maxlength="9" placeholder="00000000" onchange="buscaCep(this.value); retiraHifenCep(this.value);" required>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Rua</p>
									</div>
									<div class="side-right">
										<input name="rua" id="rua" value="<?= $dados_endereco['rua'] ?>" type="text" required readonly>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Nº</p>
									</div>
									<div class="side-right">
										<input name="numero" id="numero" type="text" maxlength="6" value="<?= $dados_endereco['numero'] ?>" placeholder="xxxx" required>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Complemento</p>
									</div>
									<div class="side-right">
										<input name="complemento" id="complemento" value="<?= $dados_endereco['complemento'] ?>" type="text">
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Estado</p>
									</div>
									<div class="side-right">
										<?php /*
										<select name="estado" id="estado" onchange="checaEstado(this.value)" required>
											<option value="">Selecione</option>
											<option value="AC" <?php if($dados_endereco['estado'] == 'AC'){ ?> selected <?php } ?>>Acre</option>
											<option value="AL" <?php if($dados_endereco['estado'] == 'AL'){ ?> selected <?php } ?>>Alagoas</option>
											<option value="AP" <?php if($dados_endereco['estado'] == 'AP'){ ?> selected <?php } ?>>Amapá</option>
											<option value="AM" <?php if($dados_endereco['estado'] == 'AM'){ ?> selected <?php } ?>>Amazonas</option>
											<option value="BA" <?php if($dados_endereco['estado'] == 'BA'){ ?> selected <?php } ?>>Bahia</option>
											<option value="CE" <?php if($dados_endereco['estado'] == 'CE'){ ?> selected <?php } ?>>Ceará</option>
											<option value="DF" <?php if($dados_endereco['estado'] == 'DF'){ ?> selected <?php } ?>>Distrito Federal</option>
											<option value="ES" <?php if($dados_endereco['estado'] == 'ES'){ ?> selected <?php } ?>>Espírito Santo</option>
											<option value="GO" <?php if($dados_endereco['estado'] == 'GO'){ ?> selected <?php } ?>>Goiás</option>
											<option value="MA" <?php if($dados_endereco['estado'] == 'MA'){ ?> selected <?php } ?>>Maranhão</option>
											<option value="MT" <?php if($dados_endereco['estado'] == 'MT'){ ?> selected <?php } ?>>Mato Grosso</option>
											<option value="MS" <?php if($dados_endereco['estado'] == 'MS'){ ?> selected <?php } ?>>Mato Grosso do Sul</option>
											<option value="MG" <?php if($dados_endereco['estado'] == 'MG'){ ?> selected <?php } ?>>Minas Gerais</option>
											<option value="PA" <?php if($dados_endereco['estado'] == 'PA'){ ?> selected <?php } ?>>Pará</option>
											<option value="PB" <?php if($dados_endereco['estado'] == 'PB'){ ?> selected <?php } ?>>Paraíba</option>
											<option value="PR" <?php if($dados_endereco['estado'] == 'PR'){ ?> selected <?php } ?>>Paraná</option>
											<option value="PE" <?php if($dados_endereco['estado'] == 'PE'){ ?> selected <?php } ?>>Pernambuco</option>
											<option value="PI" <?php if($dados_endereco['estado'] == 'PI'){ ?> selected <?php } ?>>Piauí</option>
											<option value="RJ" <?php if($dados_endereco['estado'] == 'RJ'){ ?> selected <?php } ?>>Rio de Janeiro</option>
											<option value="RN" <?php if($dados_endereco['estado'] == 'RN'){ ?> selected <?php } ?>>Rio Grande do Norte</option>
											<option value="RS" <?php if($dados_endereco['estado'] == 'RS'){ ?> selected <?php } ?>>Rio Grande do Sul</option>
											<option value="RO" <?php if($dados_endereco['estado'] == 'RO'){ ?> selected <?php } ?>>Rondônia</option>
											<option value="RR" <?php if($dados_endereco['estado'] == 'RR'){ ?> selected <?php } ?>>Roraima</option>
											<option value="SC" <?php if($dados_endereco['estado'] == 'SC'){ ?> selected <?php } ?>>Santa Catarina</option>
											<option value="SP" <?php if($dados_endereco['estado'] == 'SP'){ ?> selected <?php } ?>>São Paulo</option>
											<option value="SE" <?php if($dados_endereco['estado'] == 'SE'){ ?> selected <?php } ?>>Sergipe</option>
											<option value="TO" <?php if($dados_endereco['estado'] == 'TO'){ ?> selected <?php } ?>>Tocantins</option>	
										</select>
										*/ ?>
										<input type="text" name="estado" id="estado" value="<?= $dados_endereco['estado'] ?>" required readonly>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Bairro</p>
									</div>
									<div class="side-right">
										<input type="text" name="bairro" id="bairro" value="<?= $dados_endereco['bairro'] ?>" required readonly>
									</div>
									<div class="clear"></div>
								</li>
								<li>
									<div class="side-left">
										<p>Cidade</p>
									</div>
									<div class="side-right">
										<input type="text" name="cidade" id="cidade" value="<?= $dados_endereco['cidade'] ?>" placeholder="São Paulo" required readonly>
									</div>
									<div class="clear"></div>
								</li>
								<!--li>
									<div class="side-left">
										<p>País</p>
									</div>
									<div class="side-right">
										<input type="hidden" name="pais" id="pais" value="Brasil" placeholder="Brasil">
									</div>
									<div class="clear"></div>
								</li-->
								<input type="hidden" name="pais" id="pais" value="Brasil" placeholder="Brasil">
							</ul>
						</div><!-- END BOX INFORMAÇÕES PESSOAIS -->
						<div class="box box-mobile">
							<div class="box-title">
								<h3>Alterar Senha</h3>
								<span class="line-style"></span>
								<div class="clear"></div>
							</div>
							<ul>
								<li>
									<div class="side-left">
										<button class="btn bgWine" onclick="abrediv('senha')">Alterar</button>
									</div>
									<div class="side-right"></div>
									<div class="clear"></div>
								</li>
							</ul>
						</div>
					</div>
					<div class="area-btns">
						<!--button class="btn bgGray" id="cancelar">Cancelar</button-->
						<!--button class="btn bgWine" id="salvar">Salvar</button-->
						<input type="button" class="btn bgGray" id="cancelar" value="Cancelar" />
						<input type="submit" class="btn bgWine" id="salvar" value="Salvar" />
					</div>
				</form>
			</div> <!-- edição de perfil -->

			<div class="area-edit" id="senha" style="display: none;">
				<form name="form_senha" method="post" action="<?= APP_URI_APP ?>perfil/save_senha">
					<div class="box" id="goto-alterarsenha">
						<div class="box-title">
							<h3>Alterar sua senha</h3>
							<span class="line-style"></span>
							<div class="clear"></div>
						</div>
						<ul>
							<li>
								<div class="side-left">
									<p>Nova Senha</p>
								</div>
								<div class="side-right">
									<input name="senha_nova" type="password" value="" placeholder="Digite nova senha" required>
								</div>
								<div class="clear"></div>
							</li>
							<li>
								<div class="side-left">
									<p>Confirmar Senha</p>
								</div>
								<div class="side-right">
									<input name="senha_nova2" type="password" value="" placeholder="Digite mais uma vez" required>
								</div>
								<div class="clear"></div>
							</li>
						</ul>
					</div>

					<div class="area-btns">
						<!--button class="btn bgGray" id="cancelar">Cancelar</button>
						<button class="btn bgWine" id="salvar">Salvar</button-->
						<input type="button" class="btn bgGray" id="cancelarSenha" value="Cancelar" reui />
						<input type="submit" class="btn bgWine" id="salvar" value="Salvar" />
					</div>
				</form>
			</div>		

			<div class="clear"></div>
		</div>
	</section>
    
	<?php include('_footer.tpl'); ?>