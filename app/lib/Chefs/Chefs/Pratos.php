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

class Pratos{

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


	public function save($dados){

		//print_r($_FILES['prato_foto']);

		//print_r($dados);die;

		$prato_id = $dados['prato_id'];

		if(!$prato_id){

			//INSERT

			//INSERE DADOS PRATO
			//preco = :preco,
				$query=$this->db->prepare("INSERT INTO tb_pratos set 
											nome = :nome,
											 
											descricao = :descricao,
											usuario_id = :usuario_id");
				
				$query->bindParam(':nome',$dados['prato_nome']);
				//$query->bindParam(':preco',$dados['prato_preco']);
				$query->bindParam(':descricao',$dados['prato_descricao']);
				$query->bindParam(':usuario_id',$_SESSION['user_id']);

				$query->execute();

				$lastInsertId = $this->db->lastInsertId(); //id_prato


			//INSERE PRECOS
				foreach($dados['prato_preco_valor'] as $key_pp => $preco){

					$variacao = $dados['prato_preco_variacao'][$key_pp];

					$query2=$this->db->prepare("INSERT INTO tb_pratos_precos set 
												id_prato = :id_prato,
												preco = :preco,
												variacao = :variacao");
					
					$query2->bindParam(':id_prato', $lastInsertId);
					$query2->bindParam(':preco', $preco);
					$query2->bindParam(':variacao', $variacao);

					$query2->execute();

				}


			//INSERE INGREDIENTES
			/*
				foreach($dados['prato_ingrediente'] as $key => $ingrediente){

					$prato_quantidade = str_replace(',', '.', $dados['prato_quantidade'][$key]);
					$prato_unidade = str_replace(',', '.', $dados['prato_unidade'][$key]);

					$query2=$this->db->prepare("INSERT INTO tb_pratos_ingredientes set 
												id_prato = :id_prato,
												ingrediente = :ingrediente,
												quantidade = :quantidade,
												unidade = :unidade");
					
					$query2->bindParam(':id_prato', $lastInsertId);
					$query2->bindParam(':ingrediente', $ingrediente);
					$query2->bindParam(':quantidade', $prato_quantidade);
					$query2->bindParam(':unidade', $prato_unidade);

					$query2->execute();

				}
			*/
				$query2=$this->db->prepare("INSERT INTO tb_pratos_ingredientes set 
											id_prato = :id_prato,
											ingrediente = :ingrediente");
				
				$query2->bindParam(':id_prato', $lastInsertId);
				$query2->bindParam(':ingrediente', $dados['prato_ingrediente']);

				$query2->execute();


			//INSERE PALAVRAS CHAVE
				$arr_palavrachave = explode(',', $dados['prato_palavrachave']);
				foreach($arr_palavrachave as $key3 => $palavrachave){

					$palavrachave = trim($palavrachave);

					$query3=$this->db->prepare("INSERT INTO tb_pratos_palavraschave set 
												id_prato = :id_prato,
												palavra = :palavra");
					
					$query3->bindParam(':id_prato',$lastInsertId);
					$query3->bindParam(':palavra',$palavrachave);


					$query3->execute();

				}


			//INSERE CATEGORIA
				foreach($dados['prato_categoria'] as $key4 => $categoria){

					$query4=$this->db->prepare("INSERT INTO tb_pratos_categorias set 
												id_prato = :id_prato,
												id_categoria = :categoria");
					
					$query4->bindParam(':id_prato',$lastInsertId);
					$query4->bindParam(':categoria',$categoria);


					$query4->execute();

				}


			//INSERE FOTO
				/*
				foreach($_FILES['prato_foto']['name'] as $key5 => $foto){

					$query5=$this->db->prepare("INSERT INTO tb_pratos_fotos set 
												id_prato = :id_prato,
												foto = :foto");
					
					$query5->bindParam(':id_prato',$lastInsertId);
					$query5->bindParam(':foto',$foto);


					$query5->execute();

				}
				*/

				$imgs = array();

			    $files = $_FILES['prato_foto'];

			    //print_r($files); die;

			    $cnt = count($files['name']);
			    for($i = 0 ; $i < $cnt ; $i++) {
			        if ($files['error'][$i] === 0) {
			            //$name = uniqid('img-'.date('Ymd').'-');
			            //$name = $this->sanitizeString($files['name'][$i]);

			            $name_img = $files['name'][$i];

			            $arr_nome = explode('.', $name_img);
			            $arr_nome_rev = array_reverse($arr_nome);
			            
			            $extensao = $arr_nome_rev[0];

			            $nome_novo = $lastInsertId.'_'.time()."_".$i;
			            $name = $nome_novo.'.'.$extensao;

			            //echo '/public/uploads_fotos/' . $name;die;

			            if (move_uploaded_file($files['tmp_name'][$i], 'public/upload_fotos/' . $name) === true) {
			                $imgs[] = array('url' => 'public/upload_fotos/' . $name, 'name' => $files['name'][$i]);

			                $query5=$this->db->prepare("INSERT INTO tb_pratos_fotos set 
														id_prato = :id_prato,
														foto = :foto");
							
							$query5->bindParam(':id_prato',$lastInsertId);
							$query5->bindParam(':foto',$name);


							$query5->execute();

			            }

			        }
			    }

			    return $lastInsertId;

		} else {
			//UPDATE

			//INSERE DADOS PRATO
				$query=$this->db->prepare("UPDATE tb_pratos set 
												nome = :nome,
												preco = :preco, 
												descricao = :descricao,
												usuario_id = :usuario_id
											WHERE id = :prato_id");
				
				$query->bindParam(':nome',$dados['prato_nome']);
				$query->bindParam(':preco',$dados['prato_preco']);
				$query->bindParam(':descricao',$dados['prato_descricao']);
				$query->bindParam(':usuario_id',$_SESSION['user_id']);

				$query->bindParam(':prato_id',$prato_id);

				$query->execute();


			//INSERE PRECOS
				//APAGA
					$sql_p1 = $this->db->prepare("DELETE FROM tb_pratos_precos WHERE id_prato = :prato_id");
					$sql_p1->bindParam(':prato_id',$prato_id);
					$sql_p1->execute();

				foreach($dados['prato_preco_valor'] as $key_pp => $preco){

					$variacao = $dados['prato_preco_variacao'][$key_pp];

					$query_p2=$this->db->prepare("INSERT INTO tb_pratos_precos set 
												id_prato = :id_prato,
												preco = :preco,
												variacao = :variacao");
					
					$query_p2->bindParam(':id_prato', $prato_id);
					$query_p2->bindParam(':preco', $preco);
					$query_p2->bindParam(':variacao', $variacao);

					$query_p2->execute();

				}


			//INSERE INGREDIENTES
			/*
				foreach($dados['prato_ingrediente'] as $key => $ingrediente){

					$prato_quantidade = str_replace(',', '.', $dados['prato_quantidade'][$key]);
					$prato_unidade = str_replace(',', '.', $dados['prato_unidade'][$key]);

					$query2=$this->db->prepare("INSERT INTO tb_pratos_ingredientes set 
												id_prato = :id_prato,
												ingrediente = :ingrediente,
												quantidade = :quantidade,
												unidade = :unidade");
					
					$query2->bindParam(':id_prato', $lastInsertId);
					$query2->bindParam(':ingrediente', $ingrediente);
					$query2->bindParam(':quantidade', $prato_quantidade);
					$query2->bindParam(':unidade', $prato_unidade);

					$query2->execute();

				}
			*/

				//APAGA
					$sql1 = $this->db->prepare("DELETE FROM tb_pratos_ingredientes WHERE id_prato = :prato_id");
					$sql1->bindParam(':prato_id',$prato_id);
					$sql1->execute();

				//INSERE DE NOVO
					$query2=$this->db->prepare("INSERT INTO tb_pratos_ingredientes set 
												id_prato = :id_prato,
												ingrediente = :ingrediente");
					
					$query2->bindParam(':id_prato', $prato_id);
					$query2->bindParam(':ingrediente', $dados['prato_ingrediente']);

					$query2->execute();


			//INSERE PALAVRAS CHAVE
				//APAGA
					$sql2 = $this->db->prepare("DELETE FROM tb_pratos_palavraschave WHERE id_prato = :prato_id");
					$sql2->bindParam(':prato_id',$prato_id);
					$sql2->execute();

				//INSERE DE NOVO
					$arr_palavrachave = explode(',', $dados['prato_palavrachave']);
					foreach($arr_palavrachave as $key3 => $palavrachave){

						$palavrachave = trim($palavrachave);

						$query3=$this->db->prepare("INSERT INTO tb_pratos_palavraschave set 
													id_prato = :id_prato,
													palavra = :palavra");
						
						$query3->bindParam(':id_prato',$prato_id);
						$query3->bindParam(':palavra',$palavrachave);


						$query3->execute();

					}


			//INSERE CATEGORIA
				//APAGA
					$sql3 = $this->db->prepare("DELETE FROM tb_pratos_categorias WHERE id_prato = :prato_id");
					$sql3->bindParam(':prato_id',$prato_id);
					$sql3->execute();

				//INSERE DE NOVO
					foreach($dados['prato_categoria'] as $key4 => $categoria){

						$query4=$this->db->prepare("INSERT INTO tb_pratos_categorias set 
													id_prato = :id_prato,
													id_categoria = :categoria");
						
						$query4->bindParam(':id_prato',$prato_id);
						$query4->bindParam(':categoria',$categoria);


						$query4->execute();

					}


			//INSERE FOTO
				//APAGA
					//$sql4 = $this->db->prepare("DELETE FROM tb_pratos_fotos WHERE id_prato = :prato_id");
					//$sql4->bindParam(':prato_id',$prato_id);
					//$sql4->execute();

				//INSERE DE NOVO
					$imgs = array();

				    $files = $_FILES['prato_foto'];

				    $cnt = count($files['name']);
				    for($i = 0 ; $i < $cnt ; $i++) {
				        if ($files['error'][$i] === 0) {
				            //$name = uniqid('img-'.date('Ymd').'-');
				            $name_img = $files['name'][$i];

				            $arr_nome = explode('.', $name_img);
				            $arr_nome_rev = array_reverse($arr_nome);
				            
				            $extensao = $arr_nome_rev[0];

				            $nome_novo = $prato_id.'_'.time()."_".$i;
				            $name = $nome_novo.'.'.$extensao;

				            //echo '/public/uploads_fotos/' . $name;die;

				            if (move_uploaded_file($files['tmp_name'][$i], 'public/upload_fotos/' . $name) === true) {
				                $imgs[] = array('url' => 'public/upload_fotos/' . $name, 'name' => $files['name'][$i]);

				                $query5=$this->db->prepare("INSERT INTO tb_pratos_fotos set 
															id_prato = :id_prato,
															foto = :foto");
								
								$query5->bindParam(':id_prato',$prato_id);
								$query5->bindParam(':foto',$name);


								$query5->execute();

				            }

				        }
				    }

			return $prato_id;
		}

	}

	public function duplica_prato($dados, $palavraschave, $categorias){

		//INSERT

		//print_r($palavraschave);die;

		$nome_prato = $dados['nome']." (Cópia)";

		//INSERE DADOS PRATO
			$query=$this->db->prepare("INSERT INTO tb_pratos set 
										nome = :nome,
										descricao = :descricao,
										status = 0,
										usuario_id = :usuario_id");
			
			$query->bindParam(':nome',$nome_prato);
			$query->bindParam(':descricao',$dados['descricao']);
			$query->bindParam(':usuario_id',$dados['usuario_id']);

			$query->execute();

			$lastInsertId = $this->db->lastInsertId(); //id_prato


		//INSERE PALAVRAS CHAVE
			//INSERE DE NOVO
				foreach($palavraschave as $key3 => $palavrachave){

					$palavrachave = trim($palavrachave);

					$query3=$this->db->prepare("INSERT INTO tb_pratos_palavraschave set 
												id_prato = :id_prato,
												palavra = :palavra");
					
					$query3->bindParam(':id_prato',$lastInsertId);
					$query3->bindParam(':palavra',$palavrachave);


					$query3->execute();

				}


			//INSERE CATEGORIA
				foreach($categorias as $key4 => $categoria){

					$query4=$this->db->prepare("INSERT INTO tb_pratos_categorias set 
												id_prato = :id_prato,
												id_categoria = :categoria");
					
					$query4->bindParam(':id_prato',$lastInsertId);
					$query4->bindParam(':categoria',$categoria);


					$query4->execute();

				}


		//INSERE INGREDIENTES
			$query2=$this->db->prepare("INSERT INTO tb_pratos_ingredientes set 
										id_prato = :id_prato,
										ingrediente = :ingrediente");
			
			$query2->bindParam(':id_prato', $lastInsertId);
			$query2->bindParam(':ingrediente', $dados['ingredientes']);

			$query2->execute();

		    return $lastInsertId;

	}

	public function lista_pratos_usuario($user_id){

		$query=$this->db->prepare("SELECT *, a.id as prato_id 
									FROM tb_pratos as a
									WHERE usuario_id = :usuario_id
										AND a.status = 1
									ORDER BY a.id DESC");

		if(!$user_id)
			$query->bindParam(':usuario_id',$_SESSION['user_id']);
		else
			$query->bindParam(':usuario_id',$user_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

	       	$query2=$this->db->prepare("SELECT * FROM tb_pratos_fotos WHERE id_prato = :prato_id LIMIT 1");
        	$query2->bindParam(':prato_id',$list['prato_id']);
			$query2->execute();
			$list2=$query2->fetch(1);


			$query3=$this->db->prepare("SELECT * FROM tb_pratos_precos WHERE id_prato = :prato_id");
			$query3->bindParam(':prato_id',$list['prato_id']);
			$query3->execute();
			$array_precos = array();
    	    while($list3=$query3->fetch(1)){
        	    $array_precos[$list['prato_id']][] = array('preco' => $list3['preco'], 'variacao' => $list3['variacao']);
        	}

        	
            $array[] = array('nome' => $list['nome'],
            					'descricao' => $list['descricao'],
            					'foto' => $list2['foto'],
            					'prato_id' => $list['prato_id'],
            					'array_precos' => $array_precos
            				);
        }

		return $array;

	}

	public function lista_pratos_usuario_status($user_id){

		$query=$this->db->prepare("SELECT *, a.id as prato_id 
									FROM tb_pratos as a
									WHERE usuario_id = :usuario_id
										AND (a.status = 1 OR a.status = 0)
									ORDER BY a.id DESC");

		if(!$user_id)
			$query->bindParam(':usuario_id',$_SESSION['user_id']);
		else
			$query->bindParam(':usuario_id',$user_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

	       	$query2=$this->db->prepare("SELECT * FROM tb_pratos_fotos WHERE id_prato = :prato_id LIMIT 1");
        	$query2->bindParam(':prato_id',$list['prato_id']);
			$query2->execute();
			$list2=$query2->fetch(1);


			$query3=$this->db->prepare("SELECT * FROM tb_pratos_precos WHERE id_prato = :prato_id");
			$query3->bindParam(':prato_id',$list['prato_id']);
			$query3->execute();
			$array_precos = array();
    	    while($list3=$query3->fetch(1)){
        	    $array_precos[$list['prato_id']][] = array('preco' => $list3['preco'], 'variacao' => $list3['variacao']);
        	}
        	
            $array[] = array('nome' => $list['nome'],
            					'descricao' => $list['descricao'],
            					'foto' => $list2['foto'],
            					'prato_id' => $list['prato_id'],
            					'status' => $list['status'],
            					'array_precos' => $array_precos
            				);
        }

		return $array;

	}

	public function lista_pratos(){

		$query=$this->db->prepare("SELECT *, a.id as prato_id 
									FROM tb_pratos as a
									WHERE a.status = 1
									ORDER BY a.id DESC");
		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

        	$query2=$this->db->prepare("SELECT * FROM tb_pratos_fotos WHERE id_prato = :prato_id LIMIT 1");
        	$query2->bindParam(':prato_id',$list['prato_id']);
			$query2->execute();
			$list2=$query2->fetch(1);

            $array[] = array('nome' => utf8_encode($list['nome']),
            					'preco' => $list['preco'], 
            					'descricao' => $list['descricao'],
            					'foto' => $list2['foto'],
            					'prato_id' => $list['prato_id'],
            				);
        }

		return $array;

	}


	public function dados_prato($prato_id){

		$query=$this->db->prepare("SELECT *, a.id as prato_id 
									FROM tb_pratos as a
										JOIN tb_pratos_ingredientes as c ON c.id_prato = a.id
									WHERE a.id = :prato_id");

		$query->bindParam(':prato_id',$prato_id);

		$query->execute();

//'preco' => $list['preco'], 
		$array = array();
        while($list=$query->fetch(1)){
            $array[] = array('nome' => utf8_encode($list['nome']),
            					
            					'descricao' => $list['descricao'],
            					'prato_id' => $list['prato_id'],
            					'ingredientes' => $list['ingrediente'],
            					'prato_id' => $list['prato_id'],
            					'usuario_id' => $list['usuario_id'],
            				);
        }

		return $array;

	}

	public function dados_prato_precos($prato_id){
		$query=$this->db->prepare("SELECT * 
									FROM tb_pratos_precos
									WHERE id_prato = :prato_id");

		$query->bindParam(':prato_id',$prato_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){
            $array[] = array('preco' => $list['preco'], 'variacao' => $list['variacao']);
        }

		return $array;

	}

	public function dados_prato_fotos($prato_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_pratos_fotos
									WHERE id_prato = :prato_id");

		$query->bindParam(':prato_id',$prato_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){
            $array[] = utf8_encode($list['foto']);
        }

		return $array;

	}

	public function dados_prato_fotosid($prato_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_pratos_fotos
									WHERE id_prato = :prato_id");

		$query->bindParam(':prato_id',$prato_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){
            $array[$list['id']] = utf8_encode($list['foto']);
        }

		return $array;

	}

	public function dados_prato_palavraschave($prato_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_pratos_palavraschave
									WHERE id_prato = :prato_id");

		$query->bindParam(':prato_id',$prato_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){
            $array[$list['id']] = utf8_encode($list['palavra']);
        }

		return $array;

	}

	public function dados_prato_categorias($prato_id){


		$query=$this->db->prepare("SELECT * 
									FROM tb_pratos_categorias
									WHERE id_prato = :prato_id");

		$query->bindParam(':prato_id',$prato_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){
            $array[$list['id_categoria']] = utf8_encode($list['id_categoria']);
        }

		return $array;

	}


	public function dados_prato_categorias_nome($prato_id){


		$query=$this->db->prepare("SELECT * 
									FROM tb_pratos_categorias as a
										JOIN tb_categorias as b ON b.id = a.id_categoria
									WHERE id_prato = :prato_id");

		$query->bindParam(':prato_id',$prato_id);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){
            $array[$list['id_categoria']] = utf8_encode($list['categoria']);
        }

		return $array;

	}


	public function lista_categorias(){


		$query=$this->db->prepare("SELECT * FROM tb_categorias");
		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){
            $array[$list['id']] = utf8_encode($list['categoria']);
        }

		return $array;

	}


	public function delete_prato($prato_id){

		$status = 9;

		$query=$this->db->prepare("UPDATE tb_pratos set 
									status = :status
									WHERE id = :prato_id");
		
		$query->bindParam(':prato_id',$prato_id);
		$query->bindParam(':status',$status);

		$query->execute();

	}

	public function ocultar_prato($prato_id){

		$query1 = $this->db->prepare("SELECT status FROM tb_pratos WHERE id = :prato_id");
		$query1->bindParam(':prato_id',$prato_id);
		$query1->execute();
		$list1=$query1->fetch(1);

		if($list1['status'] == 1)
			$status = 0;

		if($list1['status'] == 0)
			$status = 1;


		$query=$this->db->prepare("UPDATE tb_pratos set 
									status = :status
									WHERE id = :prato_id");
		
		$query->bindParam(':prato_id',$prato_id);
		$query->bindParam(':status',$status);

		$query->execute();

	}


	public function busca_prato($dados, $limit=null){

		$nome = $dados['nome_prato'];
		$prato = "%".$nome."%";

		if($dados['prato_categoria'][0] != '0')
			$lista_categorias = $dados['prato_categoria'];
		$realiza_entrega = $dados['realiza_entrega'];
		$nrealiza_entrega = $dados['nrealiza_entrega'];
		$a_combinar = $dados['a_combinar'];
		$lista_pchave = $dados['prato_pchave'];

		$localizacao = $dados['localizacao'];

		/* SALVA PALAVRAS BUSCADAS */
			$query_buscados=$this->db->prepare("INSERT INTO buscados set 
										palavra = :palavra,
										data = now()");
			
			$query_buscados->bindParam(':palavra',$nome);
			$query_buscados->execute();	
		/* FIM */


		$sql = "SELECT * 
					FROM tb_pratos as a";
						if($lista_categorias)
							$sql .= " LEFT JOIN tb_pratos_categorias as b ON b.id_prato = a.id ";
						//if($lista_pchave)
							$sql .= " LEFT JOIN tb_pratos_palavraschave as d ON d.id_prato = a.id ";
							$sql .= " LEFT JOIN tb_usuarios as e ON e.id = a.usuario_id ";
							//$sql .= " LEFT JOIN tb_perfil_endereco as f ON f.id_usuario = a.usuario_id ";
						$sql .= " LEFT JOIN tb_perfil_entrega as c ON c.id_usuario = a.usuario_id
					WHERE a.status = 1 ";

						//$sql .= " AND f.cidade = :cidade ";

						if($nome){
							$sql .= " AND (a.nome like :nome OR d.palavra like :nome OR e.nome like :nome) ";
						}

						if($realiza_entrega && $nrealiza_entrega && $a_combinar)
							$sql .= " AND (realiza_entrega = 1 OR realiza_entrega = 0 OR a_combinar = 1) ";

						else if($realiza_entrega && $nrealiza_entrega)
							$sql .= " AND (realiza_entrega = 1 OR realiza_entrega = 0) ";

						else if($realiza_entrega && $a_combinar)
							$sql .= " AND (realiza_entrega = 1 OR a_combinar = 1) ";

						else if($nrealiza_entrega && $a_combinar)
							$sql .= " AND (realiza_entrega = 0 OR a_combinar = 1) ";

						else if($realiza_entrega)
							$sql .= " AND realiza_entrega = 1 ";
						else if($nrealiza_entrega)
							$sql .= " AND realiza_entrega = 0 ";
						else if($a_combinar)
							$sql .= " AND a_combinar = 1 ";

						if($lista_categorias){
							$sql .= " AND (";
							foreach($lista_categorias as $keyc => $valuec){
								$sql2 .= " id_categoria = $valuec OR ";
							}
							$sql .= substr($sql2, 0, -3);
							$sql .= ")";
						}
						if($lista_pchave){
							$sql .= " AND (";
							foreach($lista_pchave as $keypc => $valuepc){
								$sql2 .= " d.palavra = '$valuepc' OR ";
							}
							$sql .= substr($sql2, 0, -3);
							$sql .= ")";
						}
					$sql .= " ORDER BY a.id DESC ";
					if($limit)
						$sql .= " LIMIT ".$limit;

		//echo $sql;

		$query=$this->db->prepare($sql);
		if($nome)
			$query->bindParam(':nome',$prato);
		if($entrega)
			$query->bindParam(':entrega',$entrega);

		//$query->bindParam(':localizacao',$localizacao);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

        	$foto = $this->dados_prato_fotos($list['id']);

        	$query3=$this->db->prepare("SELECT * FROM tb_pratos_precos WHERE id_prato = :prato_id");
			$query3->bindParam(':prato_id',$list['id']);
			$query3->execute();
			$array_precos = array();
    	    while($list3=$query3->fetch(1)){
        	    $array_precos[] = array('preco' => $list3['preco'], 'variacao' => $list3['variacao']);
        	}


            $array[$list['id']] = array('prato_id' => $list['id'],
            					'nome' => $list['nome'],
            					'preco' => $list['preco'],
            					'descricao' => $list['descricao'],
            					'foto' => $foto[0],
            					'array_precos' => $array_precos
        					);
        }

		return $array;

	}


	public function lista_pratos_chef($usuario){

		$query=$this->db->prepare("SELECT *, a.id as prato_id 
									FROM tb_pratos as a
										JOIN tb_usuarios as b ON b.id = a.id_usuario
									WHERE usuario = :usuario
										AND a.status = 1
									ORDER BY a.id DESC");

		$query->bindParam(':usuario',$usuario);

		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

        	$query2=$this->db->prepare("SELECT * FROM tb_pratos_fotos WHERE id_prato = :prato_id LIMIT 1");
        	$query2->bindParam(':prato_id',$list['prato_id']);
			$query2->execute();
			$list2=$query2->fetch(1);
        	
            $array[] = array('nome' => $list['nome'],
            					'preco' => $list['preco'], 
            					'descricao' => $list['descricao'],
            					'foto' => $list2['foto'],
            					'prato_id' => $list['prato_id'],
            				);
        }

		return $array;

	}


	public function conta_visualizacao_prato($prato_id){

		$query=$this->db->prepare("SELECT * 
									FROM tb_pratos_visualizacoes
									WHERE id_prato = :prato_id");

		$query->bindParam(':prato_id',$prato_id);
		$query->execute();

		$num_rows = $query->rowCount();

		if($num_rows > 0){

			$list=$query->fetch(1);
			$cont = ($list['contador']+1);

			$query2=$this->db->prepare("UPDATE tb_pratos_visualizacoes set 
											contador = :contador
										WHERE id_prato = :prato_id");
			
			$query2->bindParam(':contador',$cont);
			$query2->bindParam(':prato_id',$prato_id);

			$query2->execute();

		} else {

			$contador = 1;

			$query2=$this->db->prepare("INSERT INTO tb_pratos_visualizacoes set 
											contador = :contador,
											id_prato = :prato_id");
			
			$query2->bindParam(':contador',$contador);
			$query2->bindParam(':prato_id',$prato_id);

			$query2->execute();

		}
		

	}


	public function pratos_mais_buscados_categorias(){

		$query=$this->db->prepare("SELECT distinct(categoria), d.id 
									FROM tb_pratos_visualizacoes as a
										JOIN tb_pratos as b ON b.id = a.id_prato
										JOIN tb_pratos_categorias as c ON c.id_prato = a.id_prato
										JOIN tb_categorias as d ON d.id = id_categoria
									ORDER BY contador DESC
									LIMIT 3");
		$query->execute();

		$array = array();
        while($list=$query->fetch(1)){

        	$query2=$this->db->prepare("SELECT * FROM tb_pratos_fotos WHERE id_prato = :prato_id LIMIT 1");
        	$query2->bindParam(':prato_id',$list['prato_id']);
			$query2->execute();
			$list2=$query2->fetch(1);
        	
            $array[] = array('categoria' => utf8_encode($list['categoria']),
            					'categoria_id' => $list['id'],
            				);
        }

		return $array;

	}


	function apaga_foto($foto_id){

		$sql = $this->db->prepare("DELETE FROM tb_pratos_fotos WHERE id = :foto_id");
		$sql->bindParam(':foto_id',$foto_id);
		$sql->execute();

	}


	public function qtde_prato_usuario($user_id){

		$query=$this->db->prepare("SELECT count(*) as qtde
									FROM tb_pratos as a
									WHERE usuario_id = :usuario_id");

		if(!$user_id)
			$query->bindParam(':usuario_id',$_SESSION['user_id']);
		else
			$query->bindParam(':usuario_id',$user_id);

		$query->execute();

		$list=$query->fetch(1);

		return $list['qtde'];

	}



};

