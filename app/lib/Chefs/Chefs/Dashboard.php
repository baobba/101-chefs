<?php
/**
 * Slim - a micro PHP 5 framework
 *
 * @author      Jonas Thomaz de Faria <jonasthomaz@gmail.com>
 * @version     0.0.1
 * @package     Oficina\Soldwork
 *
 */

namespace Chefs\Chefs;
use \Slim\Middleware;
use \PDO;

class Dashboard extends \Slim\Middleware{

	protected $db;

	public function __construct($db){
		$this->db = $db;
		//$core= Core::getInstance();
	}

	public function call(){
		//Chama método queé executado antes de todas as chamadas
		$this->app->hook('slim.before.dispatch', array($this, 'loadinfo'));
        $this->next->call();
	}



	public function loadinfo(){
		//Aqui entra a função de load
		
		//echo "Jonas Thomaz de Faria";
		//$data="";
		//$this->app->view()->setData($data);


		//dados de usuario
			$query = $this->db->prepare('SELECT * FROM tb_usuarios where id = :usuario_id');
			$query->bindParam(':usuario_id',$_SESSION['user_id']);
			$query->execute();

			$list = $query->fetch(1);
			$perfil_nome = $list['nome'];


		//dados de usuario
			$query2 = $this->db->prepare('SELECT * FROM tb_perfil where id_usuario = :usuario_id');
			$query2->bindParam(':usuario_id',$_SESSION['user_id']);
			$query2->execute();

			$list2 = $query2->fetch(1);
			$perfil_foto = $list2['foto'];

			//print_r($perfil_nome);


		//dados de usuario
			$query3 = $this->db->prepare("SELECT distinct(cidade) as cidades FROM tb_perfil_endereco WHERE cidade != '' ORDER BY cidade");
			$query3->execute();

			while($list3 = $query3->fetch(1)){
				$cidades[] = $list3['cidades'];
			}

			//print_r($perfil_nome);


		//dados de usuario
			$query4=$this->db->prepare("SELECT cpf FROM tb_perfil WHERE id_usuario = :user_id");
			$query4->bindParam(':user_id',$_SESSION['user_id']);
			$query4->execute();

			$list=$query4->fetch(1);
			$flag_cpf = $list['cpf'];


		$this->app->view()->setData('perfil_nome', $perfil_nome);
		$this->app->view()->setData('perfil_foto', $perfil_foto);
		$this->app->view()->setData('cidades', $cidades);
		$this->app->view()->setData('flag_cpf', $flag_cpf);

	}


}