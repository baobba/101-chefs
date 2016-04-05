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
	<section id="pag-politica-termos">
		<div class="info-politica-termos">
			<h2>Políticas de Privacidade</h2>
			
			<p class="subtitle">Última atualização: 8 de março de 2016.</p>

			<p><strong>Bem-vindo ao 101Chefs!</strong> Essa é uma plataforma que tem o objetivo de conectar pessoas que sabem cozinhar com quem quer comer bem. Se você se encaixar em uma dessas definições, temos gratidão em poder lhe oferecer os nossos serviços. </p>

			<p>POR FAVOR, ANTES DE UTILIZAR O NOSSO SERVIÇO, LEIA E CERTIFIQUE-SE DE TER ENTENDIDO ESSA “POLÍTICA DE PRIVACIDADE” E OS “TERMOS DE SERVIÇO”, POIS ELES CONTÊM INFORMAÇÕES IMPORTANTES SOBRE SEUS DIREITOS E OBRIGAÇÕES, LIMITAÇÕES E EXCLUSÕES, BEM COMO SOBRE O USO DO 101CHEFS.  A UTILIZAÇÃO DO NOSSO SERVIÇO EM DESACORDO COM ESTES TERMOS PODE SUJEITAR VOCÊ A SANÇÕES CIVIS E CRIMINAIS. </p>

			<p>Para prestar nossos serviços e para melhor atender nossos usuários, o 101Chefs coleta informações sobre você e demais usuários quando utilizam nossa plataforma. Esta Política de Privacidade traz as informações relevantes sobre o tratamento que conferimos às informações pessoais que nós processamos.</p>

			<p>Caso você não concorde com alguma parte desta Política, não podemos fornecer nossos serviços a você. Nesse caso, solicitamos que você interrompa seu acesso e desative sua conta no 101Chefs.</p>

			<p>O 101Chefs poderá, sempre que entender necessário, alterar esta Política. As alterações produzem efeitos após a publicação pelo 101Chefs, por isso fique atento à data referente à última atualização. A continuação do acesso ou da utilização dos nossos serviços após a referida publicação e atualização constitui concordância do Usuário em ficar vinculado na versão alterada e atualizada da presente Política.</p>

			<div class="box-sep">
				<h3>1.	Informações Coletadas</h3>
				<p>Coletamos as informações que você nos envia diretamente, por exemplo, ao criar ou modificar sua conta, cadastrar-se ou comunicar-se conosco. Dentre essas informações incluem-se: nome, fotos, imagens, endereço, número de telefone, interesses, atividades, histórico profissional, gênero e idade.</p>
				<p>São também coletadas informações ao você vincular sua conta a um site de terceiro (por exemplo, Facebook ou Google+), caso em que obteremos as informações que você forneceu ao site de terceiro, no limite do que for permitido nas suas configurações no site do terceiro e autorizado por você.</p>
				<p>Nós também podemos receber, armazenar e coletar informações gravadas automaticamente por nossos servidores sempre que você acessa ou usa a plataforma do 101Chefs, tendo ou não você se registrado no 101Chefs ou realizado login em sua conta, tais como endereço de IP, data e horário de acesso, hardware e software utilizados para acesso, páginas vistas, o número de cliques, quantidade de tempo gasto em determinada página, entre outras. </p>
				<p>O 101Chefs se reserva o direito de utilizar cookies próprios ou de terceiros (por exemplo, Facebook ou Google), pequenos arquivos de texto armazenados no seu navegador ou dispositivos, ou outras tecnologias de identificação, como pixel tags. Você pode escolher se aceita ou não o envio dessas informações ao 101Chefs, porém ressaltamos que elas são parte importante do funcionamento dos nossos serviços e, assim sendo, ao optar por recusar ou remover cookies e outras tecnologias, a disponibilidade e funcionalidade dos nossos serviços podem ser afetadas.</p>
				<p>Nossa plataforma também pode utilizar plugin sociais que são fornecidos e operados por terceiros, como o botão “curtir” do Facebook. Em decorrência disso, ao clicá-los, você pode enviar informações a terceiros. Consulte a política de privacidades desses terceiros antes de compartilhar informações. A presente declaração não abrange as informações fornecidas a terceiros, não podendo o 101Chefs ser responsabilizado pelas práticas de privacidade ou pelo conteúdo oferecido pelos terceiros.</p>
			</div>

			<div class="box-sep">
				<h3>2.	Uso das Informações</h3>
				<p>O 101Chefs somente utilizará informações pessoais para os fins relacionados aos indicados na ocasião de seu fornecimento. As informações coletadas e armazenadas pelo 101Chefs poderão ser utilizadas, por exemplo, para:</p>
				<p>
					<ul>
						<li>Fornecer, manter ou melhorar nossos serviços, desenvolver novos recursos, prestar suporte aos usuários, enviar atualizações;</li>
						<li>Executar operações internas para minimizar o risco de atos ilícitos e fraudes; ou</li>
						<li>Enviar comunicados que, em nossa opinião, serão de seu interesse, como promoções, novos recursos, eventos, workshops.</li>
					</ul>
				</p>
				<p>Ao encaminhar suas informações ao 101Chefs e ter concordado com os termos desta Política, será considerado que o usuário terá dado sua permissão para o processamento dos dados, conforme estabelecido nesta Política.</p>
				<p>O 101Chefs não divulga publicamente tampouco a terceiros suas informações de modo que possam individualmente identificá-lo, mas poderá fazê-lo de forma agregada com as informações de outros usuários no intuito de realizar estudos, melhoria do sistema e do serviço ou por ordem judicial.</p>
				<p>O 101Chefs não divulgará, venderá ou alugará as informações a qualquer outra organização ou entidade ou as permutará com elas, se não estiver expressamente previsto nesta Política ou sem antes ter comunicado o usuário e este ter dado seu consentimento expresso nesse sentido, ou conforme exigido por lei e por força de ordem judicial.</p>
			</div>
			
			<div class="box-sep">
				<h3>3.	Violação de conta</h3>
				<p>Se você suspeitar que suas informações possam estar sob algum risco, como no caso de invasão de conta, alteração de dados, usuário suspeito, entre outras, por favor, entre em contato conosco para podermos mitigar danos que possam vir a ocorrer.</p>
			</div>
			
			<div class="box-sep">
				<h3>4.	Fale Conosco</h3>
				<p>Para esclarecimentos sobre a Política de Privacidade, entre em contato conosco em: contato@101chefs.com.br</p>
			</div>

		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
