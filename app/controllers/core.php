<?php

##############################################
######### 
############################################## 
/* PAG DE Landing*/
$app->get("/landingp",function() use($app){
    $app->render('landing.tpl');
});

/* INDEX TEMPORÁRIA */
$app->get("/",function() use($app){
    $app->render('landing.tpl');
});




/* RAIZ */
/* INDEX ORIGINAL */
//$app->get("/",function() use($app){
$app->get("/index2",function() use($app){

    //mais visualizados
    $pratos = new \Chefs\Chefs\Pratos($app->database);
    $lista_categorias = $pratos->pratos_mais_buscados_categorias();

    $lista_categorias2 = $pratos->lista_categorias();

    $app->render('index.tpl', array('lista_categorias' => $lista_categorias,
                                    'lista_categorias2' => $lista_categorias2));
});




/* NEWSLETTER */
$app->post("/mailNews",function() use($app){

    $data = $_POST;

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $valida_cadastro = $usuarios->cadastraNewsletter($data);

});


/* PAG DE INSCRIÇÃO */
$app->get("/inscricao(/:flag)",function($flag=null) use($app){
    $app->render('pag-inscricao.tpl', array('flag' => $flag));
});


/* LOGIN COM FACEBOOK */
$app->get(
    '/fb_callback',
    function () use ($app){
        session_start();
        if($_GET['error']){
            $app->redirect('inscricao/erro'); 
            exit;
        } else {

            $fb = new Facebook\Facebook([  
                'app_id' => 'xxx',  
                'app_secret' => 'xxx',  
                'default_graph_version' => 'v2.4',  
            ]);  

            $helper = $fb->getRedirectLoginHelper(); 

            //USADO PARA TESTE
            //$accessToken = $helper->getAccessToken();
            //print_r($accessToken); die; 

            try {  
                $accessToken = $helper->getAccessToken();  
            } catch(Facebook\Exceptions\FacebookResponseException $e) {  
                // When Graph returns an error  
                echo 'Graph returned an error: ' . $e->getMessage();  
                exit;  
            } catch(Facebook\Exceptions\FacebookSDKException $e) {  
                // When validation fails or other local issues  
                echo 'Facebook SDK returned an error (primeiro): ' . $e->getMessage();  
                exit;  
            }  


            // Sets the default fallback access token so we don't have to pass it to each request
            $fb->setDefaultAccessToken($accessToken);

            try {
                $response = $fb->get('/me?locale=pt_BR&fields=name,email');
                $userNode = $response->getGraphUser();
            } catch(Facebook\Exceptions\FacebookResponseException $e) {
                // When Graph returns an error
                echo 'Graph returned an error: ' . $e->getMessage();
                exit;
            } catch(Facebook\Exceptions\FacebookSDKException $e) {
                // When validation fails or other local issues
                echo 'Facebook SDK returned an error (segundo): ' . $e->getMessage();
                exit;
            }

            $data = array('nome' => $userNode->getName(), 'email' => $userNode->getEmail(), 'fb_id' => $userNode->getId(), 'tipo_login' => 'facebook');

            $usuarios = new \Chefs\Chefs\Usuarios($app->database);
            $valida_cadastro = $usuarios->validaCadastro($data);

            if($valida_cadastro == 0){ //sem cadastro
                $array = $usuarios->save($data);


                /* ENVIO DE EMAIL DE BOAS-VINDAS */
                require 'public/phpmailer/PHPMailerAutoload.php';

                //Create a new PHPMailer instance
                $mail = new PHPMailer;

                $mail->SMTPDebug = 2;

                //Set who the message is to be sent from
                $mail->setFrom('contato@101chefs.com.br', '101Chefs');

                //Set who the message is to be sent to
                $mail->addAddress($data['email']);

                //Set the subject line
                $mail->Subject = '101chefs.com.br - Yes! Gratidão por se cadastrar no 101Chefs!';

                //Read an HTML message body from an external file, convert referenced images to embedded,
                //convert HTML into a basic plain-text alternative body
                $mail->msgHTML('
                                <!doctype html>
                                <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt-br"> <![endif]-->
                                <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="pt-br"> <![endif]-->
                                <!--[if IE 8]>    <html class="no-js lt-ie9" lang="pt-br"> <![endif]-->
                                <!--[if gt IE 8]><!--> <html class="no-js" lang="pt-br"> <!--<![endif]-->
                                <head>
                                    <meta charset="utf-8">
                                    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                                    <title>:: Mail 101Chefs ::</title>
                                    <!--[if lt IE 9]>
                                        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                                    <![endif]-->
                                    <meta name="description" content="">
                                    <meta name="author" content="">
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                                </head>
                                <body>
                                    <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#f9f9f9" style="border:1px solid #dcdcdc">
                                        <tr>
                                            <td align="center" style="padding:30px 0 0;"><a href="http://101chefs.com.br" target="_blank"><img src="http://101chefs.com.br/newsletter/logo-mail-101chefs.png" border="0" /></a></td>
                                        </tr>
                                        <tr style="margin:30px 60px; display:block; border-top:1px solid #dcdcdc; border-bottom:1px solid #dcdcdc;">
                                            <td style="padding: 30px 0;">
                                                <font face="Helvetica, sans-serif, Arial" size="2">
                                                <p>Yes! Gratidão por se cadastrar no <strong style="color:#af194b;">101Chefs</strong>!</p>
                                                <p>Agora você pode adicionar seus pratos e mostrar suas delícias para o mundo! :D</p>
                                                <p>Antes disso, que tal algumas recomendações nossas?</p>
                                                <ol>
                                                    <li><p>Capriche na sua apresentação. Nossos amigos que usam o <strong style="color:#af194b;">101Chefs</strong> gostam de conhecer os chefs e não olham apenas para a comida.</p></li>
                                                    <li><p>Dedique um tempinho para descrever seus pratos. Quanto melhor a descrição, mais vontade a gente tem de comer :D</p></li>
                                                    <li><p>Invista no visual. Tire fotos boas, use uma boa câmera, atenção para a iluminação e dê um tapinha na decoração. Faz toda a diferença!</p></li>
                                                    <li><p>Higiene é tudo. Isso é coisa que a gente sabe que nem precisaria dizer, mas nunca é demais lembrar. Recomendamos que sigam as boas práticas desse curso gratuito da Anvisa: <a href="http://www20.anvisa.gov.br/restaurantes_curso/index.php">http://www20.anvisa.gov.br/restaurantes_curso/index.php</a></p></li>
                                                </ol>
                                                <p>Por ora é isso! Já da pra começar, né?</p>
                                                <p>Se precisar de alguma ajuda é só gritar! Mande pro contato@101chefs.com.br que a gente corre aqui pra te ajudar!</p>
                                                <p><img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /></p>
                                                <p>Equipe <strong style="color:#af194b;">101Chefs</strong></p>
                                                </font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td bgcolor="#35222d">
                                                <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align:center; padding:20px 0;">
                                                    <tr>
                                                        <td>
                                                            <font face="Helvetica, sans-serif, Arial" color="#af194b" size="2">
                                                            <p>Enviado com <img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /> pelo <a href="http://101chefs.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>101Chefs</strong></a> | <a href="http://baobba.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>Baobbá</strong></a></p>
                                                            <p>São Paulo - Brasil</p>
                                                            </font>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </body>
                                </html>



                            ');


                //send the message, check for errors
                $msg = '';
                if (!$mail->send()) {
                    $msg = "Mailer Error: " . $mail->ErrorInfo;
                } else {
                    $app->redirect('abertura');
                }


            } else { //ja tem cadastro
                //$array = $usuarios->validaCadastro($data);
                $app->redirect('abertura');
            }
        }

    }
);


/* CADASTRO DIRETO PELO SITE */
$app->post("/cadastro_site",function() use($app){

    $data = $_POST;

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $valida_cadastro = $usuarios->validaCadastroEmail($data);

    if($valida_cadastro == 0){ //sem cadastro
        $array = $usuarios->saveSite($data);

        /* ENVIO DE EMAIL DE BOAS-VINDAS */
        require 'public/phpmailer/PHPMailerAutoload.php';

        //Create a new PHPMailer instance
        $mail = new PHPMailer;

        $mail->SMTPDebug = 2;

        //Set who the message is to be sent from
        $mail->setFrom('contato@101chefs.com.br', '101Chefs');

        //Set who the message is to be sent to
        $mail->addAddress($_POST['email']);

        //Set the subject line
        $mail->Subject = '101chefs.com.br - Yes! Gratidão por se cadastrar no 101Chefs!';

        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        $mail->msgHTML('
                        <!doctype html>
                        <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt-br"> <![endif]-->
                        <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="pt-br"> <![endif]-->
                        <!--[if IE 8]>    <html class="no-js lt-ie9" lang="pt-br"> <![endif]-->
                        <!--[if gt IE 8]><!--> <html class="no-js" lang="pt-br"> <!--<![endif]-->
                        <head>
                            <meta charset="utf-8">
                            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                            <title>:: Mail 101Chefs ::</title>
                            <!--[if lt IE 9]>
                                <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                            <![endif]-->
                            <meta name="description" content="">
                            <meta name="author" content="">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                        </head>
                        <body>
                            <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#f9f9f9" style="border:1px solid #dcdcdc">
                                <tr>
                                    <td align="center" style="padding:30px 0 0;"><a href="http://101chefs.com.br" target="_blank"><img src="http://101chefs.com.br/newsletter/logo-mail-101chefs.png" border="0" /></a></td>
                                </tr>
                                <tr style="margin:30px 60px; display:block; border-top:1px solid #dcdcdc; border-bottom:1px solid #dcdcdc;">
                                    <td style="padding: 30px 0;">
                                        <font face="Helvetica, sans-serif, Arial" size="2">
                                        <p>Yes! Gratidão por se cadastrar no <strong style="color:#af194b;">101Chefs</strong>!</p>
                                        <p>Agora você pode adicionar seus pratos e mostrar suas delícias para o mundo! :D</p>
                                        <p>Antes disso, que tal algumas recomendações nossas?</p>
                                        <ol>
                                            <li><p>Capriche na sua apresentação. Nossos amigos que usam o <strong style="color:#af194b;">101Chefs</strong> gostam de conhecer os chefs e não olham apenas para a comida.</p></li>
                                            <li><p>Dedique um tempinho para descrever seus pratos. Quanto melhor a descrição, mais vontade a gente tem de comer :D</p></li>
                                            <li><p>Invista no visual. Tire fotos boas, use uma boa câmera, atenção para a iluminação e dê um tapinha na decoração. Faz toda a diferença!</p></li>
                                            <li><p>Higiene é tudo. Isso é coisa que a gente sabe que nem precisaria dizer, mas nunca é demais lembrar. Recomendamos que sigam as boas práticas desse curso gratuito da Anvisa: <a href="http://www20.anvisa.gov.br/restaurantes_curso/index.php">http://www20.anvisa.gov.br/restaurantes_curso/index.php</a></p></li>
                                        </ol>
                                        <p>Por ora é isso! Já da pra começar, né?</p>
                                        <p>Se precisar de alguma ajuda é só gritar! Mande pro contato@101chefs.com.br que a gente corre aqui pra te ajudar!</p>
                                        <p><img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /></p>
                                        <p>Equipe <strong style="color:#af194b;">101Chefs</strong></p>
                                        </font>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#35222d">
                                        <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align:center; padding:20px 0;">
                                            <tr>
                                                <td>
                                                    <font face="Helvetica, sans-serif, Arial" color="#af194b" size="2">
                                                    <p>Enviado com <img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /> pelo <a href="http://101chefs.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>101Chefs</strong></a> | <a href="http://baobba.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>Baobbá</strong></a></p>
                                                    <p>São Paulo - Brasil</p>
                                                    </font>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </body>
                        </html>



                    ');


        //send the message, check for errors
        $msg = '';
        if (!$mail->send()) {
            $msg = "Mailer Error: " . $mail->ErrorInfo;
        } else {
            $app->redirect('abertura');
        }


        $app->redirect('pag-perfil-edit');
    } else { //ja tem cadastro
        //$app->redirect('pag-perfil-edit');
        $app->redirect('inscricao/email');
    }

});


/* VERIFICA LOGIN EXISTENTE */
$app->post("/checa_login",function() use($app){

    $data = $_POST;

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $valida_login = $usuarios->checaLogin($data['login']);

    print_r($valida_login);

});


/* VERIFICA CPF EXISTENTE */
$app->post("/checa_cpf",function() use($app){

    $data = $_POST;

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $valida_login = $usuarios->checaCpf($data['cpf']);

    print_r($valida_login);

});


/* VERIFICA CNPJ EXISTENTE */
$app->post("/checa_cnpj",function() use($app){

    $data = $_POST;

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $valida_login = $usuarios->checaCnpj($data['cnpj']);

    print_r($valida_login);

});


/* TODOS OS MENUS */
$app->get("/pag-todos-menus",function() use($app){

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $lista = $prato->lista_pratos();

    $app->render('pag-todos-menus.tpl', array('lista' => $lista));

});


/* LOGIN */
$app->post("/login",function() use($app){

    $data = $_POST;

    //print_r($data);die; 

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $valida_login = $usuarios->login($data);

    //echo $valida_login;die;

    if($valida_login == 1){
        $app->redirect('abertura');
    }
    else if($valida_login == 'nosenha'){
        $app->redirect('inscricao/nosenha');
    } 
    else if($valida_login == 0){
        $app->redirect('inscricao/noinscricao');
    }
    else {

        //if($valida_login == 0){ //sem cadastro
        //    $app->redirect('inscricao');
        //} else { //ja tem cadastro
        //$app->redirect('abertura');
        //}

    }

});


/* ESQUECI SENHA */
$app->get("/esqueci-senha(/:flag)",function($flag=null) use($app){
    $app->render('esqueci-senha.tpl', array('flag' => $flag));
});


/* ESQUECI SENHA */
$app->post("/email-esqueci-senha",function($flag=null) use($app){

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $valida_email = $usuarios->valida_email($_POST);

    if($valida_email == 0){
        $app->redirect('esqueci-senha/erro');
    } else {

        $id = (int)$valida_email;

        require 'public/phpmailer/PHPMailerAutoload.php';

        //Create a new PHPMailer instance
        $mail = new PHPMailer;

        $mail->SMTPDebug = 2;

        //Set who the message is to be sent from
        $mail->setFrom('contato@101chefs.com.br', '101Chefs');

        //Set who the message is to be sent to
        $mail->addAddress($_POST['email']);

        //Set the subject line
        $mail->Subject = '101chefs.com.br - Você esqueceu sua senha? Sem problemas!';

        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        $mail->msgHTML('
                    <!doctype html>
                    <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt-br"> <![endif]-->
                    <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="pt-br"> <![endif]-->
                    <!--[if IE 8]>    <html class="no-js lt-ie9" lang="pt-br"> <![endif]-->
                    <!--[if gt IE 8]><!--> <html class="no-js" lang="pt-br"> <!--<![endif]-->
                    <head>
                        <meta charset="utf-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                        <title>:: Mail 101Chefs ::</title>
                        <!--[if lt IE 9]>
                            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                        <![endif]-->
                        <meta name="description" content="">
                        <meta name="author" content="">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    </head>
                    <body>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#f9f9f9" style="border:1px solid #dcdcdc">
                            <tr>
                                <td align="center" style="padding:30px 0 0;"><a href="http://101chefs.com.br" target="_blank"><img src="http://101chefs.com.br/newsletter/logo-mail-101chefs.png" border="0" /></a></td>
                            </tr>
                            <tr style="margin:30px 60px; display:block; border-top:1px solid #dcdcdc; border-bottom:1px solid #dcdcdc;">
                                <td style="padding: 30px 0;">
                                    <font face="Helvetica, sans-serif, Arial" size="2">
                                    <p>Ops!</p>
                                    <p>Você esqueceu sua senha? Sem problemas! <br /> A gente também esquece direto.</p>
                                    <p>Vamos criar uma nova. Clique no link abaixo e crie novamente.</p>
                                    <br>
                                    <a href="http://101chefs.com.br/app/nova-senha/'.$valida_email.'" style="color:#af194b;">Redefinir sua senha</a>
                                    <br><br>
                                    <p>Se você não fez essa solicitação, desconsidere este email. </p>
                                    <p>Um abraço, <br />Equipe <strong style="color:#af194b;">101Chefs</strong></p>
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#35222d">
                                    <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align:center; padding:20px 0;">
                                        <tr>
                                            <td>
                                                <font face="Helvetica, sans-serif, Arial" color="#af194b" size="2">
                                                <p>Enviado com <img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /> pelo <a href="http://101chefs.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>101Chefs</strong></a> | <a href="http://baobba.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>Baobbá</strong></a></p>
                                                <p>São Paulo - Brasil</p>
                                                </font>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </body>
                    </html>


                ');


        //send the message, check for errors
        $msg = '';
        if (!$mail->send()) {
            $msg = "Mailer Error: " . $mail->ErrorInfo;
        } else {
            $msg = "Mensagem enviada com sucesso. Acesse seu email para redefinir uma nova senha.";
        }

        $app->render('esqueci-senha.tpl', array('msg' => $msg));
    }
});


/* ESQUECI SENHA */
$app->get("/nova-senha(/:id)",function($id=null) use($app){
    $app->render('nova-senha.tpl', array('id' => $id));
});


/* BUSCA */
$app->post("/pag-busca-realizada",function() use($app){

    $pratos = new \Chefs\Chefs\Pratos($app->database);
    $lista_pratos = $pratos->busca_prato($_POST);
    $lista_categorias = $pratos->lista_categorias();

    $app->render('pag-busca-realizada.tpl', array('pratos' => $lista_pratos,
                                                  'lista_categorias' => $lista_categorias));
});


/* BUSCA */
$app->get("/pag-busca-realizada",function() use($app){

    $pratos = new \Chefs\Chefs\Pratos($app->database);
    $lista_pratos = $pratos->busca_prato($_POST);
    $lista_categorias = $pratos->lista_categorias();

    $app->render('pag-busca-realizada.tpl', array('pratos' => $lista_pratos,
                                                  'lista_categorias' => $lista_categorias));
});


/* BUSCA CATEGORIAS */
$app->get("/pag-busca-realizada-categoria/:flag/:categoria",function($flag, $categoria) use($app){

    if($flag == 'categoria')
        $arr_cat['prato_categoria'][] = $categoria;

    if($flag == 'pchave')
        $arr_cat['prato_pchave'][] = $categoria;

    $pratos = new \Chefs\Chefs\Pratos($app->database);
    $lista_pratos = $pratos->busca_prato($arr_cat);
    $lista_categorias = $pratos->lista_categorias();

    $app->render('pag-busca-realizada.tpl', array('pratos' => $lista_pratos,
                                                  'lista_categorias' => $lista_categorias));
});


/* PAG PRATOS */
$app->get("/pag-prato-off/:prato_id",function($prato_id=null) use($app){

    $pratos = new \Chefs\Chefs\Pratos($app->database);
    $dados_prato = $pratos->dados_prato($prato_id);
    $dados_prato_fotos = $pratos->dados_prato_fotos($prato_id);
    $dados_prato_palavraschave = $pratos->dados_prato_palavraschave($prato_id);
    $dados_prato_categorias = $pratos->dados_prato_categorias($prato_id);
    $dados_prato_categorias_nome = $pratos->dados_prato_categorias_nome($prato_id);
    $dados_prato_precos = $pratos->dados_prato_precos($prato_id);


    $arr_cat['prato_categoria'] = $dados_prato_categorias;
    $pratos_parecidos = $pratos->busca_prato($arr_cat, 3);

    $contator_visualizacao = $pratos->conta_visualizacao_prato($prato_id);

    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $dados = $perfil->dados_perfil($dados_prato[0]['usuario_id']);
    $dados_end = $perfil->dados_perfil_endereco($dados_prato[0]['usuario_id']);
    $dados_ent = $perfil->dados_perfil_entrega($dados_prato[0]['usuario_id']);
    $dados_tel = $perfil->dados_perfil_telefone($dados_prato[0]['usuario_id']);
    $dados_soc = $perfil->dados_perfil_sociais($dados_prato[0]['usuario_id']);

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $dados_usuario = $usuarios->dados_usuario_by_id($dados_prato[0]['usuario_id']);
    $usuario = $dados_usuario[0]['usuario'];

    $app->render('pag-prato-off.tpl', array('dados_prato' => $dados_prato[0],
                                            'dados_prato_fotos' => $dados_prato_fotos,
                                            'dados_prato_palavraschave' => $dados_prato_palavraschave,
                                            'dados_prato_categorias' => $dados_prato_categorias,
                                            'dados_prato_categorias_nome' => $dados_prato_categorias_nome,

                                            'dados_prato_precos' => $dados_prato_precos,

                                            'dados' => $dados[0],
                                            'dados_end' => $dados_end[0],
                                            'dados_ent' => $dados_ent[0],
                                            'dados_tel' => $dados_tel,
                                            'dados_soc' => $dados_soc,

                                            'usuario' => $usuario,

                                            'pratos_parecidos' => $pratos_parecidos
                                           ));
});


/* PAG CHEF */
$app->get("/chef/:usuario",function($usuario=null) use($app){

    $usuarios = new \Chefs\Chefs\Usuarios($app->database);
    $dados_usuario = $usuarios->dados_usuario_by_usuario($usuario);
    $user_id = $dados_usuario[0]['usuario_id'];

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $lista = $prato->lista_pratos_usuario($user_id);

    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $dados = $perfil->dados_perfil($user_id);
    $dados_end = $perfil->dados_perfil_endereco($user_id);
    $dados_ent = $perfil->dados_perfil_entrega($user_id);
    $dados_tel = $perfil->dados_perfil_telefone($user_id);
    $dados_soc = $perfil->dados_perfil_sociais($user_id);

    $app->render('pag-chef-off.tpl', array('lista' => $lista, 
                                           'dados' => $dados[0], 
                                           'dados_end' => $dados_end[0],
                                           'dados_ent' => $dados_ent[0],
                                           'dados_tel' => $dados_tel,
                                           'dados_soc' => $dados_soc
                                          ));

});





##############################################
######### ADMIN
##############################################  

/* PAG INICIAL DEPOIS DE LOGADO */
$app->get("/abertura(/:flag)",function($flag=null) use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $lista = $prato->lista_pratos_usuario($_SESSION['user_id']);

    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $dados = $perfil->dados_perfil($_SESSION['user_id']);
    $dados_end = $perfil->dados_perfil_endereco($_SESSION['user_id']);
    $dados_ent = $perfil->dados_perfil_entrega($_SESSION['user_id']);
    $dados_tel = $perfil->dados_perfil_telefone($_SESSION['user_id']);
    $dados_soc = $perfil->dados_perfil_sociais($_SESSION['user_id']);

    $checkCpf = $perfil->checkCPF($_SESSION['user_id']);

    if($checkCpf != ''){

        $app->render('admin/pag-chef.tpl', array('lista' => $lista, 
                                                 'dados' => $dados[0], 
                                                 'dados_end' => $dados_end[0],
                                                 'dados_ent' => $dados_ent[0],
                                                 'dados_tel' => $dados_tel,
                                                 'dados_soc' => $dados_soc,

                                                 'flag' => $flag
                                                ));

    } else {

        $app->redirect('/pag-perfil-edit');

    }

});


/* LISTA DE PRATOS DO USUARIO */
$app->get("/pag-meus-pratos",function() use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $lista = $prato->lista_pratos_usuario_status($_SESSION['user_id']);

    $app->render('admin/pag-meus-pratos.tpl', array('lista' => $lista));
});


/* CADASTRO E EDIÇÃO DE PRATO */
$app->get("/pag-prato-edit(/:prato_id)",function($prato_id=null) use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    if($prato_id){
        $prato = new \Chefs\Chefs\Pratos($app->database);
        $dados = $prato->dados_prato($prato_id);
        $dados_palavraschave = $prato->dados_prato_palavraschave($prato_id);
        $dados_categorias = $prato->dados_prato_categorias($prato_id);
        $dados_fotos = $prato->dados_prato_fotosid($prato_id);
        $dados_precos = $prato->dados_prato_precos($prato_id);
        //$dados_categorias = array();

        $lista_categorias = $prato->lista_categorias();

        $app->render('admin/pag-prato-edit.tpl', array('dados' => $dados[0], 
                                                       'palavraschave' => $dados_palavraschave,
                                                       'categorias' => $dados_categorias,
                                                       'fotos' => $dados_fotos,
                                                       'precos' => $dados_precos,

                                                       'lista_categorias' => $lista_categorias
                                                      ));
    } else {
        $prato = new \Chefs\Chefs\Pratos($app->database);
        $lista_categorias = $prato->lista_categorias();

        $app->render('admin/pag-prato-edit.tpl', array('dados' => array(), 
                                                       'palavraschave' => array(),
                                                       'categorias' => array(),
                                                       'fotos' => array(),

                                                       'lista_categorias' => $lista_categorias
                                                      ));
    }

}); 


/* LISTA DE PRATOS DO USUARIO */
$app->post("/apaga-foto",function() use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $lista = $prato->apaga_foto($_POST['id_foto']);

    //$app->render('admin/pag-meus-pratos.tpl', array('lista' => $lista));
});


/* DELETE PRATO */
$app->get("/delete-prato(/:prato_id)",function($prato_id=null) use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    if($prato_id){

        $prato = new \Chefs\Chefs\Pratos($app->database);
        $dados = $prato->delete_prato($prato_id);

        $app->redirect('../pag-meus-pratos');

    }

}); 


/* OCULTAR PRATO */
$app->get("/ocultar-prato(/:prato_id)",function($prato_id=null) use($app){

    if(!$_SESSION['user_id']){ 
        $app->redirect('/');
    }

    if($prato_id){

        $prato = new \Chefs\Chefs\Pratos($app->database);
        $dados = $prato->ocultar_prato($prato_id);

        $app->redirect('../pag-meus-pratos');

    }

}); 


/* SALVA DADOS DO PRATO */
$app->post("/save_prato",function() use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $flag_primeiro = $prato->qtde_prato_usuario($_SESSION['user_id']);

    if($flag_primeiro == 0){

        $perfil = new \Chefs\Chefs\Perfil($app->database);
        $dados_perfil = $perfil->dados_perfil($_SESSION['user_id']);

        $id = (int)$valida_email;

        require 'public/phpmailer/PHPMailerAutoload.php';

        //Create a new PHPMailer instance
        $mail = new PHPMailer;

        $mail->SMTPDebug = 2;

        //Set who the message is to be sent from
        $mail->setFrom('contato@101chefs.com.br', '101Chefs');

        //Set who the message is to be sent to
        $mail->addAddress($dados_perfil[0]['email']);

        //Set the subject line
        $mail->Subject = '101chefs.com.br - Seu primeiro prato foi adicionado!';

        //Read an HTML message body from an external file, convert referenced images to embedded,
        //convert HTML into a basic plain-text alternative body
        $mail->msgHTML('
                    <!doctype html>
                    <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt-br"> <![endif]-->
                    <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="pt-br"> <![endif]-->
                    <!--[if IE 8]>    <html class="no-js lt-ie9" lang="pt-br"> <![endif]-->
                    <!--[if gt IE 8]><!--> <html class="no-js" lang="pt-br"> <!--<![endif]-->
                    <head>
                        <meta charset="utf-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                        <title>:: Mail 101Chefs ::</title>
                        <!--[if lt IE 9]>
                            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                        <![endif]-->
                        <meta name="description" content="">
                        <meta name="author" content="">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    </head>
                    <body>
                        <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#f9f9f9" style="border:1px solid #dcdcdc">
                            <tr>
                                <td align="center" style="padding:30px 0 0;"><a href="http://101chefs.com.br" target="_blank"><img src="http://101chefs.com.br/newsletter/logo-mail-101chefs.png" border="0" /></a></td>
                            </tr>
                            <tr style="margin:30px 60px; display:block; border-top:1px solid #dcdcdc; border-bottom:1px solid #dcdcdc;">
                                <td style="padding: 30px 0;">
                                    <font face="Helvetica, sans-serif, Arial" size="2">
                                    <p>Olá!</p>
                                    <p>Seu primeiro prato foi adicionado!</p>
                                    <p>Agora você já pode compatilhar sua página e mostrar os pratos que você faz com amor para nossos amigos que usam o <strong style="color:#af194b;">101Chefs</strong>.</p>
                                    <p>Algumas dicas:</p>
                                    <ol>
                                        <li><p>Quanto mais informação você colocar, mais fácil de lhe achar.</p></li>
                                        <li><p>Coloque mais fotos com boa qualidade pra dar mais água na boca. Dê atenção ao ângulo da foto, iluminação, definição, e tudo mais que possa favorecer e tornar seu prato mais atraente.</p></li>
                                        <li><p>Cadastre mais pratos porque você pode vender mais de uma coisa para o mesmo cliente. Tem gente que gosta de fazer um pacotão e comprar coisas variadas de uma só vez.</p></li>
                                    </ol>
                                    <p>E conte conosco caso tenha dúvidas.</p>
                                    <p>Com <img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /> <br />Equipe <strong style="color:#af194b;">101Chefs</strong></p>
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td bgcolor="#35222d">
                                    <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align:center; padding:20px 0;">
                                        <tr>
                                            <td>
                                                <font face="Helvetica, sans-serif, Arial" color="#af194b" size="2">
                                                <p>Enviado com <img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /> pelo <a href="http://101chefs.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>101Chefs</strong></a> | <a href="http://baobba.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>Baobbá</strong></a></p>
                                                <p>São Paulo - Brasil</p>
                                                </font>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </body>
                    </html>



                ');


        //send the message, check for errors
        $msg = '';
        if (!$mail->send()) {
            $msg = "Mailer Error: " . $mail->ErrorInfo;
        } else {
            $msg = "Mensagem enviada com sucesso. Acesse seu email para redefinir uma nova senha.";
        }

    }

    $retorno = $prato->save($_POST);

    $app->redirect('pag-prato/'.$retorno);

}); 


/* PERFIL */
$app->get("/pag-perfil-edit",function() use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $dados_perfil = $perfil->dados_perfil($_SESSION['user_id']);
    $dados_endereco = $perfil->dados_perfil_endereco($_SESSION['user_id']);
    $dados_entrega = $perfil->dados_perfil_entrega($_SESSION['user_id']);
    $dados_telefone = $perfil->dados_perfil_telefone($_SESSION['user_id']);
    $dados_sociais = $perfil->dados_perfil_sociais($_SESSION['user_id']);

    $app->render('admin/pag-perfil-edit.tpl', array('dados_perfil' => $dados_perfil[0],
                                                    'dados_endereco' => $dados_endereco[0],
                                                    'dados_entrega' => $dados_entrega[0],
                                                    'dados_telefone' => $dados_telefone,
                                                    'dados_sociais' => $dados_sociais
                                                   ));

});


/* SALVA PERFIL */
$app->post("/perfil/save",function() use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $retorno = $perfil->save($_POST);

    $app->redirect('../abertura/'.$retorno);

});


/* SALVA SENHA */
$app->post("/perfil/save_senha",function() use($app){

    //if(!$_SESSION['user_id']){
    //    $app->redirect('/');
    //}


    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $retorno = $perfil->saveSenha($_POST);
    $dados_perfil = $perfil->dados_perfil($_POST['user_id']);


    require 'public/phpmailer/PHPMailerAutoload.php';

    //Create a new PHPMailer instance
    $mail = new PHPMailer;

    $mail->SMTPDebug = 2;

    //Set who the message is to be sent from
    $mail->setFrom('contato@101chefs.com.br', '101Chefs');

    //Set who the message is to be sent to
    $mail->addAddress($dados_perfil[0]['email']);

    //Set the subject line
    $mail->Subject = '101chefs.com.br - Sua senha foi alterada!';

    //Read an HTML message body from an external file, convert referenced images to embedded,
    //convert HTML into a basic plain-text alternative body
    $mail->msgHTML('
                <!doctype html>
                <!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt-br"> <![endif]-->
                <!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="pt-br"> <![endif]-->
                <!--[if IE 8]>    <html class="no-js lt-ie9" lang="pt-br"> <![endif]-->
                <!--[if gt IE 8]><!--> <html class="no-js" lang="pt-br"> <!--<![endif]-->
                <head>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                    <title>:: Mail 101Chefs ::</title>
                    <!--[if lt IE 9]>
                        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                    <![endif]-->
                    <meta name="description" content="">
                    <meta name="author" content="">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                </head>
                <body>
                    <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="#f9f9f9" style="border:1px solid #dcdcdc">
                        <tr>
                            <td align="center" style="padding:30px 0 0;"><a href="http://101chefs.com.br" target="_blank"><img src="http://101chefs.com.br/newsletter/logo-mail-101chefs.png" border="0" /></a></td>
                        </tr>
                        <tr style="margin:30px 60px; display:block; border-top:1px solid #dcdcdc; border-bottom:1px solid #dcdcdc;">
                            <td style="padding: 30px 0;">
                                <font face="Helvetica, sans-serif, Arial" size="2">
                                <p>Olá!</p>
                                <p>Sua senha foi alterada!</p>
                                <p>Mude quantas vezes quiser! <br />Você é livre para fazer do seu jeito! 😄</p>
                                <p>Com <img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /> <br />Equipe <strong style="color:#af194b;">101Chefs</strong></p>
                                </font>
                            </td>
                        </tr>
                        <tr>
                            <td bgcolor="#35222d">
                                <table width="600" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align:center; padding:20px 0;">
                                    <tr>
                                        <td>
                                            <font face="Helvetica, sans-serif, Arial" color="#af194b" size="2">
                                            <p>Enviado com <img src="http://101chefs.com.br/newsletter/icon-heart.png" border="0" /> pelo <a href="http://101chefs.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>101Chefs</strong></a> | <a href="http://baobba.com.br" target="_blank" style="color:#af194b; text-decoration:none;"><strong>Baobbá</strong></a></p>
                                            <p>São Paulo - Brasil</p>
                                            </font>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </body>
                </html>



            ');


    //send the message, check for errors
    $msg = '';
    if (!$mail->send()) {
        $msg = "Mailer Error: " . $mail->ErrorInfo;
    } else {
        $msg = "Mensagem enviada com sucesso. Acesse seu email para redefinir uma nova senha.";
    }


    session_unset();

    $app->redirect('/');

});


/* DELETE PERFIL */
$app->get("/delete-perfil(/:id)",function($id=null) use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    if($id){

        $perfil = new \Chefs\Chefs\Perfil($app->database);
        $dados = $perfil->delete_perfil($id);

        session_unset();

        $app->redirect('/');

    }

}); 


/* WEBSERVICE CEP */
$app->post("/busca-cep",function() use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $cep = $_POST['cep'];

    //print_r($_POST);die;

    $url = "https://viacep.com.br/ws/".$cep."/json/";

    //echo $url;die;

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    $output = curl_exec($curl);
    curl_close($curl);

    //$output = simplexml_load_string($output);

    $arr_dados = explode("|", $output);

    foreach($arr_dados as $key1 => $value1){
        $arr_dados2 = explode(':', $value1);    
        $arr_dados3[$arr_dados2[0]] = $arr_dados2[1];
    }            

    print_r($output);die;

    return $output;

});


/* PAG PRATOS */
$app->get("/pag-prato/:prato_id",function($prato_id=null) use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $pratos = new \Chefs\Chefs\Pratos($app->database);
    $dados_prato = $pratos->dados_prato($prato_id);
    $dados_prato_fotos = $pratos->dados_prato_fotos($prato_id);
    $dados_prato_palavraschave = $pratos->dados_prato_palavraschave($prato_id);
    $dados_prato_categorias = $pratos->dados_prato_categorias($prato_id);
    $dados_prato_categorias_nome = $pratos->dados_prato_categorias_nome($prato_id);
    $dados_prato_precos = $pratos->dados_prato_precos($prato_id);

    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $dados = $perfil->dados_perfil($_SESSION['user_id']);
    $dados_end = $perfil->dados_perfil_endereco($_SESSION['user_id']);
    $dados_ent = $perfil->dados_perfil_entrega($_SESSION['user_id']);
    $dados_tel = $perfil->dados_perfil_telefone($_SESSION['user_id']);
    $dados_soc = $perfil->dados_perfil_sociais($_SESSION['user_id']);

    $app->render('admin/pag-prato.tpl', array('dados_prato' => $dados_prato[0],
                                              'dados_prato_fotos' => $dados_prato_fotos,
                                              'dados_prato_palavraschave' => $dados_prato_palavraschave,
                                              'dados_prato_categorias' => $dados_prato_categorias,
                                              'dados_prato_categorias_nome' => $dados_prato_categorias_nome,

                                              'dados_prato_precos' => $dados_prato_precos,

                                              'dados' => $dados[0],
                                              'dados_end' => $dados_end[0],
                                              'dados_ent' => $dados_ent[0],
                                              'dados_tel' => $dados_tel,
                                              'dados_soc' => $dados_soc
                                             ));

});


/* DUPLICA PRATO */
$app->get("/duplica-prato/:prato_id",function($prato_id=null) use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    $pratos = new \Chefs\Chefs\Pratos($app->database);
    $dados_prato_duplicado = $pratos->dados_prato($prato_id);
    $dados_palavraschave_duplicado = $pratos->dados_prato_palavraschave($prato_id);
    $dados_categorias_duplicado = $pratos->dados_prato_categorias($prato_id);

    $return_id_novo_prato = $pratos->duplica_prato($dados_prato_duplicado[0], $dados_palavraschave_duplicado, $dados_categorias_duplicado);

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $dados = $prato->dados_prato($return_id_novo_prato);
    $dados_palavraschave = $prato->dados_prato_palavraschave($return_id_novo_prato);
    $dados_categorias = $prato->dados_prato_categorias($return_id_novo_prato);
    $dados_fotos = $prato->dados_prato_fotosid($return_id_novo_prato);
    $dados_precos = $prato->dados_prato_precos($return_id_novo_prato);
    //$dados_categorias = array();

    $lista_categorias = $prato->lista_categorias();

    $app->render('admin/pag-prato-edit.tpl', array('dados' => $dados[0], 
                                                   'palavraschave' => $dados_palavraschave,
                                                   'categorias' => $dados_categorias,
                                                   'fotos' => $dados_fotos,
                                                   'precos' => $dados_precos,

                                                   'lista_categorias' => $lista_categorias
                                                  ));

});


/* PG DE CATEGORIAS E PALAVRAS CHAVE */
$app->get("/pag-chef-busca/:flag/:categoria",function($flag=null, $categoria=null) use($app){

    if(!$_SESSION['user_id']){
        $app->redirect('/');
    }

    if($flag == 'categoria')
        $arr_cat['prato_categoria'][] = $categoria;

    if($flag == 'pchave')
        $arr_cat['prato_pchave'][] = $categoria;

    $prato = new \Chefs\Chefs\Pratos($app->database);
    $lista = $prato->lista_pratos_usuario($_SESSION['user_id']);
    $lista_pratos = $prato->busca_prato($arr_cat);

    $perfil = new \Chefs\Chefs\Perfil($app->database);
    $dados = $perfil->dados_perfil($_SESSION['user_id']);
    $dados_end = $perfil->dados_perfil_endereco($_SESSION['user_id']);
    $dados_ent = $perfil->dados_perfil_entrega($_SESSION['user_id']);
    $dados_tel = $perfil->dados_perfil_telefone($_SESSION['user_id']);
    $dados_soc = $perfil->dados_perfil_sociais($_SESSION['user_id']);

    $app->render('admin/pag-chef-busca.tpl', array('lista' => $lista_pratos, 
                                                   'dados' => $dados[0], 
                                                   'dados_end' => $dados_end[0],
                                                   'dados_ent' => $dados_ent[0],
                                                   'dados_tel' => $dados_tel,
                                                   'dados_soc' => $dados_soc,

                                                   'flag' => $flag
                                                  ));

});




/* LOGOUT */
$app->get("/logout",function() use($app){
    session_unset();

    $app->redirect('/');
});


/* PAG DE FAQ*/
$app->get("/faq",function() use($app){
    $app->render('pag-faq.tpl');
});


/* PAG DE POLITICAS DE USO*/
$app->get("/politicas-privacidade",function() use($app){
    $app->render('pag-politicas-privacidade.tpl');
});

/* PAG DE TERMOS DE PRIVACIDADE*/
$app->get("/termos-servico",function() use($app){
    $app->render('pag-termos-servico.tpl');
});


/* ERRO 404 */
$app->notFound(function () use ($app) { 
    $view = $app->view(); 
    $view->setTemplatesDirectory('./views/'); 
    $app->render('pag-erro404.tpl'); 
});



?>