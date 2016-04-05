<?php

function converteData($data){
	
	$arr = explode('-', $data);
	$nova_data = $arr[2] .'-'. $arr[1] .'-'. $arr[0];

	return $nova_data;

}

?>