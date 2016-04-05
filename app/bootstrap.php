<?php
//Definindo Time zone do sistema como default para São Paulo
date_default_timezone_set('America/Sao_Paulo');

session_cache_limiter(false);
session_start();


if ($_SERVER['HTTP_HOST'] == 'localhost.101chefs'){
	define('APP_URI', 'http://localhost.101chefs/app/');
	define('APP_URI_PUBLIC', 'http://localhost.101chefs/app/public/');
	define('APP_URI_APP', 'http://localhost.101chefs/app/');
} else {
	//define('APP_URI', 'http://101chefs.com.br/app/');
	//define('APP_URI_PUBLIC', 'http://101chefs.com.br/app/public/');
	//define('APP_URI_APP', 'http://101chefs.com.br/app/');

	define('APP_URI', 'http://101chefs.com.br/');
	define('APP_URI_PUBLIC', 'http://101chefs.com.br/public/');
	define('APP_URI_APP', 'http://101chefs.com.br/');
}
