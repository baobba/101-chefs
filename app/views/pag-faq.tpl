<?php include('_header.tpl'); ?>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			$('.link-question').click(function(){
				$(this).next('.content-question').stop().slideToggle();
				$(this).children('.c-right').find('i').toggleClass('giro');
				return false;
			});
			/*var hWindow = $(window).height();
			var hHeader = $('header').height();
			var hSection = $('section').height();
			var hFooter = $('footer').height();
			if((hHeader + hSection + hFooter) < hWindow){
				$('footer').addClass('fixed');
			} else if((hHeader + hSection + hFooter) > hWindow){
				$('footer').removeClass('fixed');
			};*/
		});
	</script>
</head>
<body>

	<?php include('_menu.tpl'); ?>
	<section id="pag-faq">
		<div class="top-faq">
			<div class="main-pag">
				<div class="col c-left"><i class="flaticon-interface"></i></div>
				<div class="col c-main">
					<h2 class="title-pag">FAQ</h2>
					<p class="subtitle">Dúvidas e perguntas frequentes sobre o <strong>101Chefs</strong></p>
				</div>
				<div class="col c-right">&nbsp;</div>
			</div>
		</div>
		<div class="content-faq">
			<div class="main-pag">
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">1</span></div>
						<div class="col c-main"><h2>O que é o 101Chefs?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p><strong>101Chefs</strong> é uma plataforma que conecta pessoas que estão cansadas de comida industrializada e buscam opções mais saborosas e artesanais a pessoas da vizinhança que gostam de cozinhar e querem empreender para ter uma renda extra, ou viver do que amam fazer.</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">2</span></div>
						<div class="col c-main"><h2>Como funciona?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p>Quem adora cozinhar e quer vender suas especialidades, posta seus pratos no 101chefs, que é a vitrine online de sua loja virtual.</p>
							<p>Quem quer comida saborosa e de verdade encontra via plataforma, e combina com o chef os detalhes, o pagamento e a entrega ou retirada do pedido.</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">3</span></div>
						<div class="col c-main"><h2>Como criar uma conta?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p>Para começar, clique em "Quero cozinhar" no canto superior direito da página do <strong>101Chefs</strong>.</p>
							<p>Você pode entrar usando seu Facebook, ou cadastrando seu email, e na sequencia preencha seus dados no Perfil.</p>
							<p>O próximo passo é adicionar seus pratos e pronto!</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">4</span></div>
						<div class="col c-main"><h2>Quem pode ser um chef?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p><strong>101Chefs</strong> é pra qualquer pessoa que ama cozinhar. Não é restrito a quem é chef profissional ou com formação em gastronomia.</p>
							<p>Se você ama cozinhar e sabe fazer produtos deliciosos, você pode ser nosso chef.</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">5</span></div>
						<div class="col c-main"><h2>Quanto custa estar na plataforma?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p>Nossa plataforma é 100% gratuita para se cadastrar e usar.  Nos primeiros meses não teremos nenhum tipo de taxa.</p>
							<p>Depois que fizermos melhorias no site, vamos criar uma função para que toda a venda possa ser realizada dentro do site, para facilitar seu trabalho. Depois que essa ferramenta estiver disponível, teremos uma comissão por cada transação realizada, tudo bem?</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">6</span></div>
						<div class="col c-main"><h2>Como funciona a entrega?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p>Cada chef pode escolher como quer fazer e combinar direto com o cliente.</p>
							<p>Tem chef que entrega em qualquer lugar. Tem chef que só entrega no seu bairro. E tem chef que não faz entrega e pede para que o cliente venha buscar.</p>
							<p>Você é livre para escolher como prefere fazer e quanto quer cobrar pela taxa de entrega. Pode fazer como ficar mais confortável, ok?</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">7</span></div>
						<div class="col c-main"><h2>Tive problemas no meu cadastro. E agora?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p>Se você teve problemas no cadastro e não consegue resolver, nos envie um email. Mande para <a href="mailto:contato@101chefs.com.br">contato@101chefs.com.br</a>. Nossa equipe de atendimento fica sempre ligada nas novas mensagens pra poder resolver o mais rápido possível.</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">8</span></div>
						<div class="col c-main"><h2>Como faço para divulgar minha página?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p>Quando você cria um usuário na etapa de cadastro, o nome utilizado vai para o link da sua página.</p>
							<p>Por exemplo. Se você colocar usuário "regina", sua página do 101chefs será www.101chefs.com.br/chef/regina</p>
							<p>Aí é só pegar esse link e compartilhar com seus clientes e amigos.</p>
							<p>Fácil né?</p>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
				<div class="question">
					<div class="link-question">
						<div class="col c-left"><span class="item-number">9</span></div>
						<div class="col c-main"><h2>Como adiciono um prato?</h2></div>
						<div class="col c-right"><i class="indique flaticon-arrows"></i></div>
					</div>
					<div class="content-question">
						<div class="col c-left">&nbsp;</div>
						<div class="col c-main">
							<p>É importante fazer esse passo com bastante atenção e cuidado.</p>
							<p>O que você adicionar fará parte da sua vitrine e será a forma como você apresenta seus produtos.</p>
							<ul>
								<li>
									<span class="stepBystep">1.</span>
									<p>Escolha de 1 a 4 fotos que tenham uma boa apresentação do prato que você quer vender.</p>
									<div class="clear"></div>
								</li>
								<li>
									<span class="stepBystep">2.</span>
									<p>Escolha um nome para o seu prato.</p>
									<div class="clear"></div>
								</li>
								<li>
									<span class="stepBystep">3.</span>
									<p>Insira o preço, incluindo os centavos também.</p>
									<div class="clear"></div>
								</li>
								<li>
									<span class="stepBystep">4.</span>
									<p>Descreva seu prato, quantas pessoas ele serve, os diferenciais que sua receita pode ter (sem glúten, sem lactose, sem açúcar, etc.), e mais detalhes que podem interessar quem está comprando.</p>
									<div class="clear"></div>
								</li>
								<li>
									<span class="stepBystep">5.</span>
									<p>Coloque os ingredientes principais.</p>
									<div class="clear"></div>
								</li>
								<li>
									<span class="stepBystep">6.</span>
									<p>Insira as palavras-chave que ajudarão as pessoas a encontrarem seu prato, sempre separadas por vírgulas (ex: vegano, light, chocolate, sem gordura, etc.).</p>
									<div class="clear"></div>
								</li>
								<li>
									<span class="stepBystep">7.</span>
									<p>Escolha a categoria que mais se encaixa com seu prato. Você pode escolher mais de uma opção.</p>
									<div class="clear"></div>
								</li>
								<li>
									<span class="stepBystep">8.</span>
									<p>Salve suas informações.</p>
									<div class="clear"></div>
								</li>
							</ul>
						</div>
						<div class="col c-right">&nbsp;</div>
					</div>
				</div>
			</div>
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
