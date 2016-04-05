<?php
/**
 * Oficina do Código - Bibliotecas de desenvolvimento
 *
 * @author      Jonas Thomaz de Faria <jonasthomaz@gmail.com>
 * @version     0.0.2
 * @package     Oficina\Lib
 *
 */


/**
 *  Retorna a conexao com o banco de dados
 */
$app->container->singleton('database',function(){

	$dbHostname = DBhost;
	$dbpost 	= DBport;
	$dbDatabase = DBbasename;
	$dbUsername = DBuser;
	$dbPassword = DBpassword;

	static $db = null; 
	if (null === $db){
		$db_connection = new PDO("mysql:host=$dbHostname;dbname=$dbDatabase", $dbUsername, $dbPassword);
		$db_connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	}
	
	return $db_connection;
});
