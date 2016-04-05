<?php
//incluindo o autoload (slim e Classes)
require "vendor/autoload.php";
require "config/database.php";
require "public/functions.php";

//Arquivo do bootstrap
$entityManager = require __DIR__ . "/bootstrap.php";

//Declaração dos controllers
define('CONTROLLERS_PATH', './controllers/');

//Declaracao das views
define('VIEWS_PATH', './views/');


$app = new \Slim\Slim(
	array(
		'templates.path' => VIEWS_PATH,
		'log.level' => 4,
		'log.enable' => true
	)
);

$controllerDir = opendir(CONTROLLERS_PATH);

while ($controller = readdir($controllerDir)) {
	if($controller != '.' && $controller != '..') require CONTROLLERS_PATH . $controller;
}

require("singleton.php");

//Instanciando Objetos do sistema
$app->add( new \Chefs\Chefs\Dashboard($app->database));

$app->run();



   

