<?php
/**
 * Oficina do Código - Bibliotecas de desenvolvimento
 *
 * @author      Jonas Thomaz de Faria <jonasthomaz@gmail.com>
 * @version     0.0.2
 * @package     Oficina\Lib
 *
 * Middleware para validação de informações
 *
 */
namespace Chefs\Lib;
use \Slim\Middleware;
use PDO;

class ChefsMiddleware extends \Slim\Middleware{
	protected $db;
  protected $configs;

	public function __construct($appconfig){
		$core=Core::getInstance();
    $this->db= $core->dbh;

    $this->configs=$appconfig;
	}

	public function call()
  	{
        $this->app->hook('slim.before.dispatch', array($this, 'VerifyAuthentication'));
        $this->next->call();
  	}


  	/**
  	 * Verifica se o o usuário esta autenticado no sistema, 
  	 * caso contrário redireciona para a interface de login
  	 */
    public function VerifyAuthentication()
    {
		  $current_route=$this->app->request->getResourceUri();
      
		  if ($current_route!='/login' 
          && $current_route!='/' 
          && $current_route!='/recovery'){
      		//Verifica a existencia da sessao user
      		if(!isset($_SESSION['user'])){
      			$this->app->redirect("/");
      			return;
      		}
      }
      

      return; 

    }

    public function teste(){
        echo "teste";
    }

} 

?>