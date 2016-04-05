<?php if(count($dados_soc) > 0){ ?>
	<div class="share-chef">
		
		<p class="sub">Minhas redes sociais</p>
		
		<?php 
		foreach($dados_soc as $keys => $valuess){ 
			if($valuess['redesocial'] == 'Facebook'){
				echo '<a href="'.$valuess['link'].'" target="_blank" class="s-media bt-share-facebook"><i class="flaticon-logotype42"></i></a>';
			}
			if($valuess['redesocial'] == 'Twitter'){
				echo '<a href="'.$valuess['link'].'" target="_blank" class="s-media bt-share-twitter"><i class="flaticon-twitter1"></i></a>';
			}
			if($valuess['redesocial'] == 'Youtube'){
				echo '<a href="'.$valuess['link'].'" target="_blank" class="s-media bt-share-pinterest"><i class="flaticon-social"></i></a>';
			}
			if($valuess['redesocial'] == 'Pinterest'){
				echo '<a href="'.$valuess['link'].'" target="_blank" class="s-media bt-share-pinterest"><i class="flaticon-pinterest3"></i></a>';
			}
			if($valuess['redesocial'] == 'Instagram'){
				$check_insta = strripos($valuess['link'], '@');
				if($check_insta === false){
					echo '<a href="'.$valuess['link'].'" target="_blank" class="s-media bt-share-instagram"><i class="flaticon-instagram12"></i></a>';
				} else {
					echo '<a href="https://www.instagram.com/'.substr($valuess['link'], 1).'" target="_blank" class="s-media bt-share-instagram"><i class="flaticon-instagram12"></i></a>';			
				}
			}
			if($valuess['redesocial'] == 'Google+'){
				echo '<a href="'.$valuess['link'].'" target="_blank" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a>';
			}
			if($valuess['redesocial'] == 'Site pessoal'){
				echo '<a href="http://'.$valuess['link'].'" target="_blank" class="s-media bt-share-pinterest"><i class="flaticon-web"></i></a>';
			}
			?>
			<!--a href="#" class="s-media bt-share-google-plus"><i class="flaticon-google116"></i></a-->
			<?php 
		} ?>
	</div>
<?php } ?>