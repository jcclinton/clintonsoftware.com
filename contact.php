<?php

require('email.php');

$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];

$formcontent="From: $name \n Address: $email \n Message: $message";
$subject = "Contact Form";
$mailheader = "From: $email \r\n";
mail($myEmail, $subject, $formcontent, $mailheader) or die("Error!");
echo "Thank You!";
?>
