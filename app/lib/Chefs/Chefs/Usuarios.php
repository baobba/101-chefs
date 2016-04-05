<?php
/**
 * Slim - a micro PHP 5 framework
 *
 * @author      Jonas Thomaz de Faria <jonasthomaz@gmail.com>
 * @version     0.0.1
 * @package     Oficina\Spacer
 *
 */

namespace Chefs\Chefs;
use \PDO;

class Usuarios{

	protected $db;

	public function __construct($db){
		$this->db = $db;
	}


	public function login($dados){

		//print_r($dados);die;

		//autenticar usuario
		//parametros: login, senha

		//md5(:senha) 


		$senha = $this->checaSenha($dados);

		//echo $senha .' <br> '. md5($dados['pass']);die;

		$query=$this->db->prepare("SELECT * FROM tb_usuarios 
									WHERE (email = :login OR usuario = :login)
										AND status = 1");
		$query->bindParam(':login', $dados['login']);
		$query->bindParam(':senha', $dados['pass']);

		$query->execute();

		$num_rows=$query->rowCount();

		if($num_rows == 1){

			if(trim($senha) == trim(md5($dados['pass']))){
				$list=$query->fetch(1);
				$_SESSION['user_id'] = $list['id'];
				return true;
			} else {
				return 'nosenha';
			}
		} else {
			return false;
		}

		/*
		if(trim($senha) == trim(md5($dados['pass']))){

			$query=$this->db->prepare("SELECT * FROM tb_usuarios 
										WHERE (email = :login OR usuario = :login)
											AND senha = md5(:senha)");
			$query->bindParam(':login', $dados['login']);
			$query->bindParam(':senha', $dados['pass']);

			$query->execute();

			$num_rows=$query->rowCount();

			if($num_rows == 1){

				$list=$query->fetch(1);

				$_SESSION['user_id'] = $list['id'];

				return true;
			} else
				return false;

		} else {
			return 'nosenha';
		}
		*/

	}

	public function checaSenha($dados){

		//print_r($dados);die;

		//autenticar usuario
		//parametros: login, senha

		//md5(:senha)

		$query=$this->db->prepare("SELECT senha FROM tb_usuarios 
									WHERE (email = :login OR usuario = :login)");
		$query->bindParam(':login', $dados['login']);
		$query->bindParam(':senha', $dados['pass']);

		$query->execute();

		$list=$query->fetch(1);

		return $list['senha'];

	}

	public function save($dados){

		//print_r($dados);die;

		$tipo_login = 'facebook';
		$agree_termos = 1;
		$agree_privacidade = 1;

		$query=$this->db->prepare("INSERT INTO tb_usuarios set 
									nome = :nome,
									tipo_login = :tipo_login,
									agree_termos = :agree_termos, 
									agree_privacidade = :agree_privacidade,
									senha = md5(:senha),
									email = :email,
									fb_id = :fb_id,
									data_entrada = now()");
		
		$query->bindParam(':nome',$dados['nome']);
		$query->bindParam(':tipo_login',$tipo_login);
		$query->bindParam(':agree_termos',$agree_termos);
		$query->bindParam(':agree_privacidade',$agree_privacidade);
		$query->bindParam(':senha',$dados['senha']);
		$query->bindParam(':email',$dados['email']);
		$query->bindParam(':fb_id',$dados['fb_id']);

		$query->execute();

		$lastInsertId = $this->db->lastInsertId();
		$_SESSION['user_id'] = $lastInsertId;

	}


	public function saveSite($dados){

		//print_r($dados);die;

		$tipo_login = 'site';
		$agree_termos = 1;
		$agree_privacidade = 1;

		$query=$this->db->prepare("INSERT INTO tb_usuarios set 
									nome = :nome,
									senha = md5(:senha),
									email = :email,
									agree_termos = :agree_termos, 
									agree_privacidade = :agree_privacidade,
									tipo_login = :tipo_login,
									data_entrada = now()
									");
		
		$query->bindParam(':nome',$dados['nome']);
		$query->bindParam(':senha',$dados['senha']);
		$query->bindParam(':email',$dados['email']);
		$query->bindParam(':agree_termos',$agree_termos);
		$query->bindParam(':agree_privacidade',$agree_privacidade);
		$query->bindParam(':tipo_login',$tipo_login);
		
		$query->execute();

		$lastInsertId = $this->db->lastInsertId();
		$_SESSION['user_id'] = $lastInsertId;

	}


	public function validaCadastro($dados){

		$email = '';

		$query=$this->db->prepare("SELECT *
									FROM tb_usuarios
									WHERE fb_id = :fb_id
										AND status = 1");

		$query->bindParam(':fb_id',$dados['fb_id']);

		$query->execute();

        $num_rows=$query->rowCount();

        //print_r($num_rows);die;

        if($num_rows > 0){
        	$list=$query->fetch(1);
        	$_SESSION['user_id'] = $list['id'];

        	return 1;
        } else {
        	return 0;
        }
            
	}

	public function validaCadastroEmail($dados){

		$email = '';

		$query=$this->db->prepare("SELECT *
									FROM tb_usuarios
									WHERE email = :email");

		$query->bindParam(':email',$dados['email']);

		$query->execute();

        $num_rows=$query->rowCount();

        //print_r($num_rows);die;

        if($num_rows > 0){
        	return 1;
        } else {
        	return 0;
        }
            
	}


	public function checaLogin($login){

		$email = '';

		$query=$this->db->prepare("SELECT *
									FROM tb_usuarios
									WHERE usuario = :login");

		$query->bindParam(':login',$login);

		$query->execute();

        $num_rows=$query->rowCount();

        //print_r($num_rows);die;

        if($num_rows > 0){
        	return 1;
        } else {
        	return 0;
        }
            
	}


	public function checaCpf($cpf){

		$query=$this->db->prepare("SELECT *
									FROM tb_perfil
									WHERE cpf = :cpf");

		$query->bindParam(':cpf',$cpf);

		$query->execute();

        $num_rows=$query->rowCount();

        print_r($num_rows);die;

        if($num_rows > 0){
        	return 1;
        } else {
        	return 0;
        }
            
	}


	public function checaCnpj($cnpj){

		$query=$this->db->prepare("SELECT *
									FROM tb_perfil
									WHERE cnpj = :cnpj");

		$query->bindParam(':cnpj',$cnpj);

		$query->execute();

        $num_rows=$query->rowCount();

        print_r($num_rows);die;

        if($num_rows > 0){
        	return 1;
        } else {
        	return 0;
        }
            
	}


	public function dados_usuario_by_usuario($usuario){

		$query=$this->db->prepare("SELECT * 
									FROM tb_usuarios
									WHERE usuario = :usuario");

		$query->bindParam(':usuario',$usuario);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

            $array[] = array('usuario_id' => $list['id'],
            				);
        }

		return $array;

	}


	public function dados_usuario_by_id($id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_usuarios
									WHERE id = :id");

		$query->bindParam(':id',$id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

            $array[] = array('usuario' => $list['usuario'],
            				);
        }

		return $array;

	}


	public function valida_email($dados){

		$query=$this->db->prepare("SELECT * FROM tb_usuarios WHERE email = :email");
		$query->bindParam(':email', $dados['email']);

		$query->execute();

		$num_rows=$query->rowCount();


		if($num_rows == 1){
			$list=$query->fetch(1);
			$id = $list['id'];

			return $id;
		} else {
			return 0;
		}

	}


	public function cadastraNewsletter($dados){

		//print_r($dados);die;

		$query=$this->db->prepare("INSERT INTO newsletter set 
									email = :email,
									data = now()");
		
		$query->bindParam(':email',$dados['email']);

		$query->execute();

	}


};

