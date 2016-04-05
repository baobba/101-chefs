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

class Perfil{

	protected $db;

	public function __construct($db){
		$this->db = $db;
	}


	public function sanitizeString($str) {
	    $str = preg_replace('/[áàãâä]/ui', 'a', $str);
	    $str = preg_replace('/[éèêë]/ui', 'e', $str);
	    $str = preg_replace('/[íìîï]/ui', 'i', $str);
	    $str = preg_replace('/[óòõôö]/ui', 'o', $str);
	    $str = preg_replace('/[úùûü]/ui', 'u', $str);
	    $str = preg_replace('/[ç]/ui', 'c', $str);
	    // $str = preg_replace('/[,(),;:|!"#$%&/=?~^><ªº-]/', '_', $str);
	    $str = preg_replace('/[^a-z0-9]/i', '_', $str);
	    $str = preg_replace('/_+/', '_', $str); // ideia do Bacco :)
	    return $str;
	}


	public function saveSenha($dados){

		if($_SESSION['user_id'])
			$user_id = $_SESSION['user_id'];
		else 
			$user_id = $dados['user_id'];

		$query=$this->db->prepare("UPDATE tb_usuarios set 
										senha = md5(:senha)
									WHERE id = :user_id
									");
		
		$query->bindParam(':user_id',$user_id);
		$query->bindParam(':senha',$dados['senha_nova']);
		
		$query->execute();
	}


	public function validaPerfil(){
		$user_id = $_SESSION['user_id'];

		$query=$this->db->prepare("SELECT *
									FROM tb_perfil
									WHERE id_usuario = :user_id");

		$query->bindParam(':user_id',$user_id);

		$query->execute();

        $num_rows=$query->rowCount();

        //print_r($num_rows);die;

        if($num_rows > 0){
        	return 1;
        } else {
        	return 0;
        }

	}


	public function checkCPF($user_id){

		if($_SESSION['user_id'])
			$user_id = $_SESSION['user_id'];
		else 
			$user_id = $user_id;

		$query=$this->db->prepare("SELECT cpf FROM tb_perfil WHERE id_usuario = :user_id");
		$query->bindParam(':user_id',$user_id);
		$query->execute();

		$list=$query->fetch(1);

		return $list['cpf'];
	}


	public function save($dados){

		//print_r($dados);die;

		$user_id = $_SESSION['user_id'];

		$nome = $dados['nome'];
		$usuario = $this->sanitizeString($dados['usuario']);

		//ATUALIZA DADOS DE USUARIO
			$query=$this->db->prepare("UPDATE tb_usuarios set 
											nome = :nome,
											email = :email,
											usuario = :usuario
										WHERE id = :user_id
										");
			
			$query->bindParam(':user_id',$user_id);
			$query->bindParam(':nome',$nome);
			$query->bindParam(':email',$dados['email']);
			$query->bindParam(':usuario',$usuario);
			
			$query->execute();

		if($this->validaPerfil() > 0){
			$this->update($dados);
			return 'salvo';
		} else {
			$this->insert($dados);
			return 'salvo';
		}
		

	}


	public function insert($dados){

		$user_id = $_SESSION['user_id'];

		//SALVA PERFIL
			$query=$this->db->prepare("INSERT INTO tb_perfil set 
											id_usuario = :user_id,
											sexo = :sexo,
											dia_nascimento = :dia_nascimento,
											mes_nascimento = :mes_nascimento,
											ano_nascimento = :ano_nascimento,
											bio = :bio,
											cpf = :cpf,
											cnpj = :cnpj");
			
			$query->bindParam(':user_id',$user_id);
			$query->bindParam(':sexo',$dados['sexo']);
			$query->bindParam(':dia_nascimento',$dados['dia_nascimento']);
			$query->bindParam(':mes_nascimento',$dados['mes_nascimento']);
			$query->bindParam(':ano_nascimento',$dados['ano_nascimento']);
			$query->bindParam(':bio',$dados['bio']);
			$query->bindParam(':cpf',$dados['cpf']);
			$query->bindParam(':cnpj',$dados['cnpj']);

			$query->execute();

			$lastInsertId = $this->db->lastInsertId();

			//FOTO
				$imgs = array();

			    $files_perfil = $_FILES['foto_perfil'];

			    if($files_perfil){

				    //print_r($files); die;

				    if ($files_perfil['error'] === 0) {
			        	
			            //$name = uniqid('img-'.date('Ymd').'-');
			            //$name = $files_perfil['name'];

			            $name_img = $files_perfil['name'];

			            $arr_nome = explode('.', $name_img);
			            $arr_nome_rev = array_reverse($arr_nome);
			            
			            $extensao = $arr_nome_rev[0];

			            $nome_novo = $lastInsertId.'_'.time();
			            $name = $nome_novo.'.'.$extensao;

			            //echo '/public/upload_perfil/' . $name;die;

			            if (move_uploaded_file($files_perfil['tmp_name'], 'public/upload_perfil/' . $name) === true) {
			                $imgs[] = array('url' => 'public/upload_perfil/' . $name, 'name' => $files_perfil['name']);

			                $query6=$this->db->prepare("UPDATE tb_perfil set 
														foto = :foto
														WHERE id = :perfil_id");
							
							$query6->bindParam(':perfil_id',$lastInsertId);
							$query6->bindParam(':foto',$name);


							$query6->execute();

			            }

			        }
			    }


		//SALVA ENDEREÇO
			$query2=$this->db->prepare("INSERT INTO tb_perfil_endereco set 
											id_perfil = :id_perfil,
											id_usuario = :user_id,
											cep = :cep,
											rua = :rua, 
											complemento = :complemento,
											numero = :numero,
											estado = :estado,
											bairro = :bairro,
											cidade = :cidade,
											pais = :pais");
			
			$query2->bindParam(':id_perfil',$lastInsertId);
			$query2->bindParam(':user_id',$user_id);
			$query2->bindParam(':cep',$dados['cep']);
			$query2->bindParam(':rua',$dados['rua']);
			$query2->bindParam(':complemento',$dados['complemento']);
			$query2->bindParam(':numero',$dados['numero']);
			$query2->bindParam(':estado',$dados['estado']);
			$query2->bindParam(':bairro',$dados['bairro']);
			$query2->bindParam(':cidade',$dados['cidade']);
			$query2->bindParam(':pais',$dados['pais']);

			$query2->execute();


		//SALVA ENTREGA

			if($dados['a_combinar'] == 1){
				$realiza_entrega = '';
				$taxa_entrega = '';
			} else {
				$realiza_entrega = $dados['entrega'];
				$taxa_entrega = $dados['taxa_entrega'];
			}

			$query3=$this->db->prepare("INSERT INTO tb_perfil_entrega set 
											id_perfil = :id_perfil,
											id_usuario = :user_id,
											realiza_entrega = :realiza_entrega,
											a_combinar = :a_combinar, 
											taxa_entrega = :taxa_entrega");
			
			$query3->bindParam(':id_perfil',$lastInsertId);
			$query3->bindParam(':user_id',$user_id);
			$query3->bindParam(':realiza_entrega',$realiza_entrega);
			$query3->bindParam(':a_combinar',$dados['a_combinar']);
			$query3->bindParam(':taxa_entrega',$taxa_entrega);

			$query3->execute();


		//SALVA TELEFONES
			foreach($dados['telefone'] as $key1 => $telefone){
				$query4=$this->db->prepare("INSERT INTO tb_perfil_telefone set 
												id_perfil = :id_perfil,
												id_usuario = :user_id,
												telefone = :telefone");
				
				$query4->bindParam(':id_perfil',$lastInsertId);
				$query4->bindParam(':user_id',$user_id);
				$query4->bindParam(':telefone',$telefone);

				$query4->execute();

			}


		//SALVA TELEFONES
			foreach($dados['rede_social'] as $key2 => $redessocial){

				$link = $_POST['link_social'][$key2];

				$query5=$this->db->prepare("INSERT INTO tb_perfil_redessociais set 
												id_perfil = :id_perfil,
												id_usuario = :user_id,
												redesocial = :redesocial,
												link = :link");
				
				$query5->bindParam(':id_perfil',$lastInsertId);
				$query5->bindParam(':user_id',$user_id);
				$query5->bindParam(':redesocial',$redessocial);
				$query5->bindParam(':link',$link);

				$query5->execute();

			}
	}


	public function update($dados){

		$perfil_id = $dados['perfil_id'];
		$user_id = $_SESSION['user_id'];
		
		//SALVA PERFIL
			$query=$this->db->prepare("UPDATE tb_perfil set 
											id_usuario = :user_id,
											sexo = :sexo,
											dia_nascimento = :dia_nascimento,
											mes_nascimento = :mes_nascimento,
											ano_nascimento = :ano_nascimento,
											bio = :bio,
											cpf = :cpf,
											cnpj = :cnpj
										WHERE id_usuario = :user_id");
			
			$query->bindParam(':user_id',$user_id);
			$query->bindParam(':sexo',$dados['sexo']);
			$query->bindParam(':dia_nascimento',$dados['dia_nascimento']);
			$query->bindParam(':mes_nascimento',$dados['mes_nascimento']);
			$query->bindParam(':ano_nascimento',$dados['ano_nascimento']);
			$query->bindParam(':bio',$dados['bio']);
			$query->bindParam(':cpf',$dados['cpf']);
			$query->bindParam(':cnpj',$dados['cnpj']);

			$query->execute();

			$lastInsertId = $this->db->lastInsertId();

			//FOTO
				$imgs = array();

			    $files_perfil = $_FILES['foto_perfil'];

			    if($files_perfil){

				    //print_r($files); die;

				    if ($files_perfil['error'] === 0) {
			        	
			            //$name = uniqid('img-'.date('Ymd').'-');
			            //$name = $files_perfil['name'];

			            $name_img = $files_perfil['name'];

			            $arr_nome = explode('.', $name_img);
			            $arr_nome_rev = array_reverse($arr_nome);

			            $extensao = $arr_nome_rev[0];

			            $nome_novo = $perfil_id.'_'.time();
			            $name = $nome_novo.'.'.$extensao;

			            //echo '/public/upload_perfil/' . $name;die;

			            if (move_uploaded_file($files_perfil['tmp_name'], 'public/upload_perfil/' . $name) === true) {
			                $imgs[] = array('url' => 'public/upload_perfil/' . $name, 'name' => $files_perfil['name']);

			                $query6=$this->db->prepare("UPDATE tb_perfil set 
														foto = :foto
														WHERE id = :perfil_id");
							
							$query6->bindParam(':perfil_id',$perfil_id);
							$query6->bindParam(':foto',$name);


							$query6->execute();

			            }

			        }
			    }


		//SALVA ENDEREÇO
			$query2=$this->db->prepare("UPDATE tb_perfil_endereco set 
											id_perfil = :id_perfil,
											id_usuario = :user_id,
											cep = :cep,
											rua = :rua, 
											complemento = :complemento,
											numero = :numero,
											estado = :estado,
											bairro = :bairro,
											cidade = :cidade,
											pais = :pais
										WHERE id_usuario = :user_id");
			
			$query2->bindParam(':id_perfil',$perfil_id);
			$query2->bindParam(':user_id',$user_id);
			$query2->bindParam(':cep',$dados['cep']);
			$query2->bindParam(':rua',$dados['rua']);
			$query2->bindParam(':complemento',$dados['complemento']);
			$query2->bindParam(':numero',$dados['numero']);
			$query2->bindParam(':estado',$dados['estado']);
			$query2->bindParam(':bairro',$dados['bairro']);
			$query2->bindParam(':cidade',$dados['cidade']);
			$query2->bindParam(':pais',$dados['pais']);

			//$query2->bindParam(':latitude',$json->results[0]->geometry->location->lat);
			//$query2->bindParam(':longitude',$json->results[0]->geometry->location->lng);

			$query2->execute();


		//SALVA ENTREGA
			$query3=$this->db->prepare("UPDATE tb_perfil_entrega set 
											id_perfil = :id_perfil,
											id_usuario = :user_id,
											realiza_entrega = :realiza_entrega,
											a_combinar = :a_combinar, 
											taxa_entrega = :taxa_entrega
										WHERE id_usuario = :user_id");
			
			$query3->bindParam(':id_perfil',$perfil_id);
			$query3->bindParam(':user_id',$user_id);
			$query3->bindParam(':realiza_entrega',$dados['entrega']);
			$query3->bindParam(':a_combinar',$dados['a_combinar']);
			$query3->bindParam(':taxa_entrega',$dados['taxa_entrega']);

			$query3->execute();


		//SALVA TELEFONES
			//APAGA
				$sql1 = $this->db->prepare("DELETE FROM tb_perfil_telefone WHERE id_usuario = :user_id");
				$sql1->bindParam(':user_id',$user_id);
				$sql1->execute();

				if(count($dados['telefone']) > 0){
					foreach($dados['telefone'] as $key1 => $telefone){
						$query4=$this->db->prepare("INSERT INTO tb_perfil_telefone set 
														id_perfil = :id_perfil,
														id_usuario = :user_id,
														telefone = :telefone");
						
						$query4->bindParam(':id_perfil',$perfil_id);
						$query4->bindParam(':user_id',$user_id);
						$query4->bindParam(':telefone',$telefone);

						$query4->execute();

					}
				}


		//SALVA REDES SOCIAIS
			//APAGA
				$sql2 = $this->db->prepare("DELETE FROM tb_perfil_redessociais WHERE id_usuario = :user_id");
				$sql2->bindParam(':user_id',$user_id);
				$sql2->execute();

				if(count($dados['rede_social']) > 0){
					foreach($dados['rede_social'] as $key2 => $redessocial){

						$link = $_POST['link_social'][$key2];

						$query5=$this->db->prepare("INSERT tb_perfil_redessociais set 
														id_perfil = :id_perfil,
														id_usuario = :user_id,
														redesocial = :redesocial,
														link = :link");
						
						$query5->bindParam(':id_perfil',$perfil_id);
						$query5->bindParam(':user_id',$user_id);
						$query5->bindParam(':redesocial',$redessocial);
						$query5->bindParam(':link',$link);

						$query5->execute();

					}
				}
	}


	public function dados_perfil($user_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_usuarios
									WHERE id = :user_id");

		$query->bindParam(':user_id',$user_id);  
		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

        	$query2=$this->db->prepare("SELECT * 
										FROM tb_perfil
										WHERE id_usuario = :user_id");

			$query2->bindParam(':user_id',$user_id);
			$query2->execute();
			$list2=$query2->fetch(1);

            $array[] = array('usuario' => $list['usuario'],
            					'nome' => $list['nome'], 
            					//'sobrenome' => utf8_encode($list['sobrenome']),
            					'sexo' => $list2['sexo'],
            					'dia_nascimento' => $list2['dia_nascimento'],
            					'mes_nascimento' => $list2['mes_nascimento'],
            					'ano_nascimento' => $list2['ano_nascimento'],
            					'email' => $list['email'],
            					'bio' => $list2['bio'],
            					'foto' => $list2['foto'],
            					'id' => $list2['id'],
            					'user_id' => $user_id,
            					'cpf' => $list2['cpf'],
            					'cnpj' => $list2['cnpj'],
            				);
        }

		return $array;

	}


	public function dados_perfil_endereco($user_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_perfil_endereco
									WHERE id_usuario = :user_id");

		$query->bindParam(':user_id',$user_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

            $array[] = array('cep' => $list['cep'],
            					'rua' => $list['rua'], 
            					'complemento' => $list['complemento'],
            					'numero' => $list['numero'],
            					'estado' => $list['estado'],
            					'cidade' => $list['cidade'],
            					'bairro' => $list['bairro'],
            					'pais' => $list['pais'],
            				);
        }

		return $array;

	}


	public function dados_perfil_entrega($user_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_perfil_entrega
									WHERE id_usuario = :user_id");

		$query->bindParam(':user_id',$user_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

            $array[] = array('realiza_entrega' => $list['realiza_entrega'],
            					'a_combinar' => $list['a_combinar'], 
            					'taxa_entrega' => $list['taxa_entrega'],
            				);
        }

		return $array;

	}


	public function dados_perfil_telefone($user_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_perfil_telefone
									WHERE id_usuario = :user_id");

		$query->bindParam(':user_id',$user_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

            $array[] = $list['telefone'];
        }

		return $array;

	}


	public function dados_perfil_sociais($user_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_perfil_redessociais
									WHERE id_usuario = :user_id");

		$query->bindParam(':user_id',$user_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

            $array[] = array('redesocial' => $list['redesocial'],
            					'link' => $list['link'], 
            				);
        }

		return $array;

	}


	public function delete_perfil($id){

		$status = 0;

		$query=$this->db->prepare("UPDATE tb_usuarios set 
									status = :status
									WHERE id = :id");
		
		$query->bindParam(':id',$id);
		$query->bindParam(':status',$status);

		$query->execute();

	}



};

