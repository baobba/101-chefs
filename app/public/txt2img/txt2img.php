<?php

ob_start();

@session_start();

header ("Content-type: image/png");

$text= base64_decode($_GET['img']);

if($text=='')

 exit;
 
 $string = $text;  

// Create a 300x100 image
$im = imagecreatetruecolor(250, 28);
$background = imagecolorallocate ($im, 255, 235, 160);
$fontcolor = imagecolorallocate ($im, 90, 90, 90);

imagecolortransparent($im, $background);

// Make the background red
imagefilledrectangle($im, 0, 0, 299, 99, $background);

// Path to our ttf font file
$font_file = 'Lato regular.ttf';

// Draw the text 'PHP Manual' using font size 9
imagefttext($im, 10, 0, 6, 19, $fontcolor, $font_file, $string);
header('Content-Type: image/png');

echo imagepng($im);
//imagedestroy($im);