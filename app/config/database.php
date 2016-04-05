<?php

if ($_SERVER['HTTP_HOST'] == 'localhost.101chefs'){
	// ambiente de desenvolvimento
	define('DBhost', 'localhost');
	define('DBport', '');
	define('DBbasename', 'baobba');
	define('DBuser', 'root');
	define('DBpassword', '');
} else {
	// Ambiente de produção
	define('DBhost', '');
	define('DBport', '');
	define('DBbasename', '');
	define('DBuser', '');
	define('DBpassword', ''); 
}