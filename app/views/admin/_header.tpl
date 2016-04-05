<?php
require('config/config.php'); 
?>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt-br"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="pt-br"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="pt-br"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="pt-br"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>101Chefs</title>
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="shortcut icon" href="favicon.ico">
	<link rel="apple-touch-icon-precomposed apple-touch-icon" href="touch-icon.png">
	<link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>css/style.css">
	<link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>css/style_2.css">
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>css/responsive.css">
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>css/slippry.css">
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>css/jquery.bxslider.css">
    <link href='https://fonts.googleapis.com/css?family=Lato:400,700,900' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
    <script src="<?= APP_URI_PUBLIC ?>js/jquery.bxslider.min.js"></script>

    <script type="text/javascript" src="<?= APP_URI_PUBLIC ?>js/jquery.maskMoney.js"></script>
    <script type="text/javascript" src="<?= APP_URI_PUBLIC ?>js/jquery.mask.js"></script>

	<script type="text/javascript" src="<?= APP_URI_PUBLIC ?>js/jquery.scrollTo-1.4.2-min.js"></script>
	<script type="text/javascript" src="<?= APP_URI_PUBLIC ?>js/jquery.localscroll-1.2.7-min.js"></script>
	<script type="text/javascript" src="<?= APP_URI_PUBLIC ?>js/validationForm.js"></script>

	<script src="<?= APP_URI_PUBLIC ?>js/slippry.min.js"></script>

	<!-- MAPA -->
	    <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
	    <script src="<?= APP_URI_PUBLIC ?>marker/js/gmaps.js" type="text/javascript"></script>
	    <script src="<?= APP_URI_PUBLIC ?>marker/js/markers.js" type="text/javascript"></script>
	    <link href="<?= APP_URI_PUBLIC ?>marker/css/main.css" rel="stylesheet" />
    
    <!-- Sweet Alert -->
    <script src="<?= APP_URI_PUBLIC ?>swal/sweetalert.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="<?= APP_URI_PUBLIC ?>swal/sweetalert.css">
    <!-- croppie -->
    <link rel="stylesheet" href="<?= APP_URI_PUBLIC ?>croppie/croppie.css" />
    <script src="<?= APP_URI_PUBLIC ?>croppie/croppie.js"></script>

    <script>
	jQuery(document).ready(function() {
		jQuery('li.hover-sub').hover(function(){
			jQuery(this).children('span.sub-menu').stop().slideDown();
		},function(){
			jQuery(this).children('span.sub-menu').stop().slideUp();
		});


		if(jQuery('#a_combinar:checked').length > 0){
			jQuery('.entrega').attr('disabled', 'disabled');
			jQuery('#taxa_entrega').attr('disabled', 'disabled');
		} else {
			jQuery('.entrega').prop("disabled", false);
			jQuery('#taxa_entrega').prop("disabled", false);
		}

		jQuery("#cpf").mask("999.999.999-99");
		jQuery("#cnpj").mask("99.999.999/9999-99");

		jQuery('.fone').mask('00 000000009');

	});

	function desabilitaValores(){
		if(jQuery('#a_combinar:checked').length > 0){
			jQuery('.entrega').attr('disabled', 'disabled');
			jQuery('#taxa_entrega').attr('disabled', 'disabled');
		} else {
			jQuery('.entrega').prop("disabled", false);
			jQuery('#taxa_entrega').prop("disabled", false);
		}
	}

	function abrediv(div){
		jQuery('.area-edit').attr('style', 'display: none;');
		jQuery('#'+div).attr('style', '');
	}

	function checaEstado(estado){
		//if(estado != 'SP')
			//alert('Ainda não atendemos sua região, blablablabla...');
	}
    </script>


<script>
 (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
 (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
 m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
 })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

 ga('create', 'UA-74704037-1', 'auto');
 ga('send', 'pageview');

</script>    