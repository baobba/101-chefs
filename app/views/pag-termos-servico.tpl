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
			<h2>Termos de Serviço</h2>
			
			<p class="subtitle">Última atualização: 8 de março de 2016.</p>
			
			<p><strong>Bem-vindo ao website 101Chefs!</strong> Esta é uma plataforma que tem o objetivo de conectar pessoas que sabem cozinhar com quem quer comer bem. Se você se encaixar em uma dessas definições, temos gratidão em poder lhe oferecer os nossos serviços. </p>

			<p>POR FAVOR, ANTES DE UTILIZAR O NOSSO SERVIÇO, LEIA E CERTIFIQUE-SE DE TER ENTENDIDO ESSES “TERMOS DE SERVIÇO” E A “POLÍTICA DE PRIVACIDADE”, POIS ELES CONTÊM INFORMAÇÕES IMPORTANTES SOBRE SEUS DIREITOS E OBRIGAÇÕES, LIMITAÇÕES E EXCLUSÕES, BEM COMO SOBRE O USO DO 101CHEFS.  A UTILIZAÇÃO DO NOSSO SERVIÇO EM DESACORDO COM ESSES TERMOS PODE SUJEITAR VOCÊ A SANÇÕES CIVIS E CRIMINAIS.</p>

			<p>Os Termos de Serviço (“Termos”) regulam o acesso ou a utilização pelo Usuário, pessoa particular, de serviços, websites e conteúdo disponibilizados pelo 101Chefs.</p>

			<p>Estes termos vinculam o Usuário com relação aos atuais ou novos serviços oferecidos pelo 101Chefs. Pelo cadastramento como Usuário e/ou utilização dos nossos serviços de qualquer maneira, o Usuário concorda em se vincular e cumprir os Termos, independente de utilizar ou não os nossos serviços. Desse modo, o cadastro como usuário e/ou utilização do 101Chefs é proibido para qualquer pessoa juridicamente incapaz ou que não tenha lido e entendido esses Termos. </p>

			<p>O 101Chefs poderá, sempre que entender necessário, alterar estes Termos. As alterações produzem efeitos após a publicação pelo 101Chefs, por isso fique atento à data referente à última atualização. A continuação do acesso ou da utilização dos nossos serviços após a referida publicação e atualização constitui concordância do Usuário em ficar vinculado na versão alterada e atualizada dos presentes Termos.</p>

			<div class="box-sep">
				<h3>1.	O Serviço</h3>
				<p>O 101Chefs fornece uma plataforma online que conecta pessoas que tenham habilidade ou competência nos ramos da gastronomia ou culinária, devidamente cadastradas e que se dispõem a preparar receitas de comidas e/ou bebidas para o consumo alheio (doravante denominadas “Usuário Fornecedor”), com os potenciais adquirentes desses produtos preparados (doravante denominados “Usuário Consumidor”). Por meio da plataforma do 101Chefs também será possível que os Usuários Fornecedores e aqueles interessados em suas comidas e bebidas acordem entre si sobre a forma de entrega dos produtos. Esse é o Serviço prestado pelo 101Chefs.</p>
				<p>O objetivo do 101Chefs é fomentar o acesso de comidas e bebidas de qualidade, para quem quer comer bem e desfrutar no conforto de seu local particular de preferência. Assim, incentivamos o anúncio de pratos e bebidas que propiciem essa experiência. Não será permitido o anúncio de pratos ou bebidas à base de bebidas alcóolicas  , tabaco, substâncias e medicamentos sujeitos a controle especial (especialmente aqueles elencados na Portaria nº 344/1998 da Agência Nacional de Vigilância Sanitária – ANVISA) ou qualquer outra que tenha comercialização proibida para menores de 18 anos. Não são considerados pratos à base de bebidas alcóolicas aqueles que as utilizam em suas receitas de forma não preponderante, como em molhos, na forma de cozimento ou até mesmo como um de seus ingredientes, porém o Usuário Fornecedor deverá informar a utilização das bebidas em seu anúncio no 101Chefs.</p>
				<p>Esse Serviço é acessível em http://www.101chefs.com.br e quaisquer outros endereços eletrônicos (sites) nos quais o 101Chefs torna o Serviço disponível.</p>
				<p>Os contatos entre os Usuários Fornecedores e os Usuários Consumidores podem se dar pelos meios disponibilizados na plataforma do 101Chefs, como telefones pessoais, endereços de e-mail e outros. Quaisquer tarifas ou cobranças realizadas por esses contatos, como aquelas das operadoras de celular, são de responsabilidade dos Usuários Fornecedores e dos Usuários Consumidores, conforme aplicável.</p>
				<p>Após o Usuário Consumidor selecionar o anúncio que lhe interessa e entrar em contato com o Usuário Fornecedor para adquirir o produto, as formas de entrega e pagamento devem ser livremente acordadas entre o Usuário Fornecedor e o Usuário Consumidor. O serviço prestado pelo 101 Chefs não inclui essas atividades. O 101Chefs não terá nenhuma responsabilidade em relação à entrega e à forma de pagamento dos produtos.</p>
				<p>O SERVIÇO PRESTADO PELO 101CHEFS CONSTITUI UMA PLATAFORMA ONLINE POR MEIO DA QUAL OS USUÁRIOS FORNECEDORES PODEM CRIAR ANÚNCIOS PARA OS SEUS PRATOS E BEBIDAS E USUÁRIOS CONSUMIDORES PODEM TOMAR CONHECIMENTO E ADQUIRIR OS PRODUTOS DIRETAMENTE COM OS USUÁRIOS FORNECEDORES. VOCÊ ENTENDE E CONCORDA QUE O 101CHEFS NÃO É PARTE EM QUALQUER CONTRATO CELEBRADO ENTRE OS USUÁRIOS FORNECEDORES E OS USUÁRIOS CONSUMIDORES E QUE O 101CHEFS NÃO É ESTABELECIMENTO DA ÁREA DE ALIMENTOS, TRANSPORTADOR, AGENTE, REPRESENTANTE OU SEGURADORA. O 101CHEFS NÃO TEM CONTROLE SOBRE A CONDUTA DOS USUÁRIOS NEM SOBRE O PAGAMENTO PELO PRODUTO ADQUIRIDO, TAMPOUCO PELA ENTREGA, QUALIDADE, QUANTIDADE DOS PRODUTOS, EXONERANDO-SE DE QUALQUER RESPONSABILIDADE A ESTE RESPEITO, NA MÁXIMA EXTENSÃO PERMITIDA PELA LEI. </p>
			</div>

			<div class="box-sep">
				<h3>2.	O Cadastro</h3>
				<p>As pessoas que desejarem se tornar Usuários Fornecedores e oferecer seus produtos ou receitas na plataforma do 101Chefs deverão obrigatoriamente criar uma conta, preencher os campos de cadastro e fornecer informações válidas e corretas. </p>
				<p>Para as pessoas que desejaram se tornar Usuários Consumidores, não será necessária a elaboração de um cadastro, mas informações poderão ser solicitadas para o contínuo aprimoramento dos serviços prestados pelo 101Chefs e para facilitar a comunicação com os seus usuários.</p>
				<p>Com intuito de garantir um padrão de qualidade ao serviço prestado, O 101Chefs poderá checar a veracidade, a exatidão e a completude dos dados fornecidos pelos Usuários Fornecedores e pelos Usuários Consumidores. Respeitado o disposto no Código de Defesa do Consumidor (Lei nº 8.078/1990) e no Marco Civil da Internet (Lei nº  12.965/2014), ou em qualquer lei que os altere ou venha a revogá-los total ou parcialmente, o 101 Chefs poderá negar o cadastro, após análise das informações fornecidas, não sendo necessário informar o usuário do motivo da negativa.</p>
				<p>As informações do cadastro são de exclusiva responsabilidade de quem as inseriu, incluindo imagens, dados pessoais, localização e qualidade dos produtos. No caso de acarretarem danos ou prejuízos de qualquer espécie, medidas legais podem ser adotadas pelo 101Chefs a fim de resguardar seus interesses e a integridade dos demais usuários da plataforma.</p>
				<p>Os usuários concordam que a Política de Privacidade, rege a coleta e utilização de suas informações pessoais, e poderá ser atualizada, sempre que o 101Chefs julgar oportuno.</p>
			</div>

			<div class="box-sep">
				<h3>3.	O Anúncio</h3>
				<p>O 101Chefs criou uma plataforma para que pessoas que queiram mostrar seu trabalho na cozinha possam se conectar com aqueles que se interessem por prová-lo e adquirir seu produto. Assim, o 101Chefs possibilita que sejam criados anúncios dos pratos e bebidas elaborados, bem como dos indivíduos responsáveis por elaborá-los.</p>
				<p>O Usuário Fornecedor reconhece e concorda que é o único responsável por quaisquer e todos os anúncios que postar. Assim, o Usuário Fornecedor declara e garante que os anúncios que postar estarão em conformidade com todas as leis aplicáveis. </p>
				<p>O Usuário Fornecedor é o único responsável pela veracidade e exatidão das informações contidas nos anúncios, inclusive pelas imagens que postar para ilustrar o produto oferecido e pela definição do preço a ser cobrado do Usuário Consumidor.</p>
				<p>O 101Chefs não age como seguradora ou respectivo agente de contratação em relação ao Usuário Fornecedor. Se um Usuário Consumidor solicitar um produto anunciado, qualquer acordo que celebrar com o Usuário Fornecedor será entre os dois usuários e o 101Chefs não fará parte dele, eximindo-se da responsabilidade por qualquer descumprimento, mora ou danos resultantes.</p>
				<p>O 101Chefs se reserva no direito de, a qualquer momento e sem aviso prévio, remover ou impossibilitar o acesso a qualquer anúncio por qualquer motivo, incluindo anúncios que o 101Chefs, a seu exclusivo critério, considerar como censuráveis por qualquer motivo, violação a estes Termos ou à Política de Privacidade então em vigor ou, de outra forma, prejudiciais para as plataformas do 101Chefs.</p>
			</div>

			<div class="box-sep">
				<h3>4.	Limitações de Responsabilidade</h3>
				<p>O 101Chefs não é estabelecimento da área de alimentos e não presta serviços de agenciamento, representação ou de seguro. Nós apenas cedemos nossa plataforma para facilitar o contato inicial entre os Usuários Fornecedores e as pessoas interessas em seus produtos. Quaisquer defeitos, perdas ou danos relativos à compra, venda, transporte e entrega dos produtos são de responsabilidade exclusiva dos Usuários Fornecedores e demais usuários.</p>
				<p>Os usuários reconhecem e concordam que o 101Chefs (i) não realiza seleção dos Usuários Fornecedores tampouco dos Usuários Consumidores, (ii) não atesta suas idoneidades tampouco a capacidade legal, física ou mental dos Usuários Fornecedores para elaborar e fornecer os produtos, e (iii) não fiscaliza nem inspeciona o local de elaboração dos alimentos.</p>
				<p>O 101Chefs poderá disponibilizar e/ou fornecer conteúdo, informações, cursos, palestras, workshops  aos Usuários Fornecedores que os auxiliem a elaborar, promover, vender e transportar seus produtos da melhor maneira possível. No entanto, o 101Chefs não participará da elaboração, promoção, venda e transporte dos produtos, eximindo-se da responsabilidade por qualquer dano eventualmente decorrente dessas atividades,</p>
				<p>Os dados pessoais disponibilizados na plataforma do 101Chefs foram fornecidos pelos próprios Usuários Fornecedores, conforme disposto na seção “2. O Cadastro ” acima.</p>
			</div>

			<div class="box-sep">
				<h3>5.	Utilização Indevida</h3>
				<p>O uso da plataforma do 101Chefs de forma indevida ou qualquer violação ao disposto nestes Termos poderá implicar na exclusão do cadastro do usuário e na proibição de utilização dos serviços. O usuário reconhece e concorda que seus dados poderão ser preservados para uso das autoridades competentes, caso o 101Chefs venha a ser notificado ou acionado por violações em decorrência do mau uso da plataforma.</p>
				<p>Os usuários concordam em indenizar o 101Chefs, seus administradores, colaboradores e representantes por qualquer perda, responsabilização, reclamação ou demanda, por quaisquer prejuízos decorrentes da sua utilização indevida da plataforma.</p>
				<p>O 101Chefs se reserva o direito de, a qualquer momento, notificar, suspender ou cancelar, temporária ou definitivamente, a conta de um usuário e tomar as medidas legais cabíveis, caso:</p>
				<p>
					<ul>
						<li>Seja constatada violação de qualquer declaração, garantia ou obrigação que constam destes Termos ou da Política de Privacidade; </li>
						<li>Suspeite que as atividades e/ou atitudes dos usuários tenham causado ou possam vir a causar algum dano a terceiro ou ao próprio 101Chefs; ou</li>
						<li>Suspeite que os usuários estejam praticando atos fraudulentos ou dolosos.</li>
					</ul>
				</p>
				<p>Não será devida qualquer indenização ou compensação a usuário que tenha tido sua conta cancelada ou suspensa.</p>
			</div>
			
			<div class="box-sep">
				<h3>6.	Links</h3>
				<p>Nas plataformas do 101Chefs pode haver links informáticos para sites ou plataformas de terceiros. Os usuários reconhecem e concordam que o 101Chefs não é responsável pela disponibilidade ou precisão de tais sites e plataformas, tampouco pelo conteúdo, produtos ou serviços contidos ou disponibilizados nesses sites e plataformas. A existência desses links não implica em endosso do 101Chefs de tais sites ou plataformas ou de seus conteúdos, produtos ou serviços. </p>
				<p>Os usuários reconhecem sua exclusiva responsabilidade pelo acesso aos links e assumem todos os riscos de acesso aos sites ou plataforma e da consequente utilização de serviços ou aquisição de produtos por eles oferecidos.</p>
				<p>O 101Chefs recomenda que seus usuários leiam os termos dos serviços prestados e as regras em relação à privacidade das informações dos sites ou plataformas de terceiros previamente à utilização dos mesmos.</p>
			</div>
			
			<div class="box-sep">
				<h3>7.	Propriedade Intelectual</h3>
				<p>As marcas, nomes, logotipos, nomes de domínio e demais sinais distintivos, assim como todo e qualquer conteúdo, desenho, arte ou leiaute publicados na plataforma ou nos sites disponibilizados para acesso à plataforma, são de propriedade exclusiva do 101Chefs.</p>
				<p>Os usuários da plataforma do 101Chefs não estão autorizados a:</p>
				<p>
					<ul>
						<li>Reproduzir, modificar, elaborar trabalhos derivados, destruir, licenciar, alugar, vender, revender, ceder, transferir, expor ou apresentar publicamente, transmitir, reproduzir, ou de qualquer outra forma explorar o serviço e propriedades do 101Chefs, exceto se expressamente permitido pelo 101Chefs;</li>
						<li>Descompilar, usar engenharia reversa ou desmontar de qualquer forma contrária à lei a plataforma disponibilizada pelo 101Chefs;</li>
						<li>Criar ligações ou reproduzir por meio de “frames” qualquer parte da plataforma ou outra propriedade do 101Chefs;</li>
						<li>Criar ou utilizar quaisquer programas ou scripts para captar, indexar, recolher ou, de qualquer outra forma, extrair dados da plataforma do 101Chefs, ou sobrecarregar indevidamente ou impossibilitar a operação e/ou funcionalidade de qualquer aspecto da plataforma; ou</li>
						<li>Tentar ou obter acesso não autorizado e/ou prejudicar qualquer aspecto da plataforma do 101Chefs.</li>
					</ul>
				</p>
			</div>
			
			<div class="box-sep">
				<h3>8.	Lei aplicável e eleição do foro</h3>
				<p>Os presentes Termos serão exclusivamente regidos e interpretados conforme as leis da República Federativa do Brasil. Eventuais conflitos a serem dirimidos serão de competência do Foro da Comarca de São Paulo/SP.</p>
			</div>
			
			<div class="box-sep">
				<h3>9.	Disposição Gerais</h3>
				<p>VOCÊ RECONHECE E CONCORDA QUE, AO ACESSAR OU USAR A PLATAFORMA DO 101CHEFS, PUBLICANDO OU NÃO QUALQUER CONTEÚDO NO OU DO SITE, VOCÊ ESTÁ INDICANDO QUE LEU, E QUE COMPREENDE E CONCORDA EM CUMPRIR ESTES TERMOS, TENDO OU NÃO SE REGISTRADO COM O SITE. SE VOCÊ NÃO CONCORDA COM ESTES TERMOS, ENTÃO NÃO TEM O DIREITO DE ACESSAR OU USAR ESTE SITE. Se você aceitar ou concordar com estes Termos em nome de uma empresa (sociedade empresária) ou outra pessoa jurídica, você declara e garante que tem autoridade para obrigar que a empresa ou outra entidade legal cumpra estes Termos e, em tal caso, "você" refere-se e aplica-se à empresa (sociedade empresária) ou à outra pessoa jurídica.</p>
				<p>Se qualquer disposição destes Termos for considerada ilegal, inválida ou inaplicável, no seu todo ou em parte, essa disposição ou parte dela serão nessa medida entendidas como não fazendo parte dos presentes Termos. Nessas situações, a legalidade, validade e aplicabilidade das demais disposições dos presentes Termos não serão afetadas. A disposição ou parte dela que for considerada ilegal, inválida ou inaplicável será substituída por outra que seja legal, válida e aplicável e que tenha, na maior medida do possível, um efeito semelhante à disposição substituída, tendo em conta o serviço prestado pelo 101Chefs e o conteúdo e finalidade dos presentes Termos.</p>
			</div>
			
			<div class="box-sep">
				<h3>10.	Fale Conosco</h3>
				<p>Para esclarecimentos sobre os Termos de Serviço, entre em contato conosco em: contato@101chefs.com.br</p>
			</div>
			
		</div>
	</section>
    
<?php include('_footer.tpl'); ?>
