<?php

$link = mysql_connect('108.179.253.78', 'baobb416_news', 'baobbnews');
mysql_select_db("baobb416_newsletter", $link) or print(mysql_error()); 

$sql = "INSERT INTO newsletter (email, site, data) VALUES ('".$_POST['email']."', '101chefs.com.br', now())";
$rs = mysql_query($sql) or die('erro: '.$sql);

mysql_close($link);


###############################
##### ENVIA EMAIL PARA O USUARIO
###############################

// multiple recipients
$to  = $_POST['email'];

// subject
$subject = '101 CHEFS';

// message
$message = '
<!doctype html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>101 Chefs</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
	<table width="620" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#f5f5f5" style="padding:10px 30px 20px;">
		<tr>
			<td>
				<font face="MS Sans Serif4, Geneva, sans-serif" color="#6e6e6e">
					<h2>LANÇAMENTO 101 CHEFS (beta)</h2>
				</font>
			</td>
		</tr>
		<tr>
			<td>
				<font face="MS Sans Serif4, Geneva, sans-serif" color="#6e6e6e">
					<p>Ficamos felizes com o seu interesse no projeto. <br />Nossa equipe está trabalhando no desenvolvimento para lançarmos <br />o <strong>101 Chefs</strong> em breve.</p>
					<p>Você será comunicado antes de todo mundo e poderá nos ajudar com <br />sugestões e recomendações.</p>
				</font>
			</td>
		</tr>
		<tr>
			<td>
				<font face="MS Sans Serif4, Geneva, sans-serif" color="#6e6e6e">
					<p>Acompanhe nossa página no facebook: <a href="http://facebook.com/baobbalab" style="color:#6e6e6e;"><strong>Baobbá Lab</strong></a></p>
				</font>
			</td>
		</tr>
		<tr>
			<td>
				<font face="MS Sans Serif4, Geneva, sans-serif" color="#6e6e6e">
					<p>Equipe Baobbá Lab</p>
				</font>
			</td>
		</tr>
		<tr>
			<td><a href="http://baobbalab.com"><img src="http://101chefs.com.br/images/logo.png" border="0" alt="Baobbá Lab" title="Baobbá Lab" /></a></td>
		</tr>
		<tr>
			<td align="center"><font size="1" face="MS Sans Serif4, Geneva, sans-serif" color="#6e6e6e"><p>E-mail automático, favor não respondê-lo.</p></font></td>
		</tr>
	</table>
</body>
</html>

';

// To send HTML mail, the Content-type header must be set
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";

// Additional headers
$headers .= 'From: Portal 101 CHEFS <contato@baobba.com.br>' . "\r\n";

// Mail it
mail($to, $subject, $message, $headers);
?>