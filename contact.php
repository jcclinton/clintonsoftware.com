<?php

require('email.php');

$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['message'];

if( nameCheck($name, $email) ){
	die('Error: illegal newline characters in email address');
}

if( !validityCheck($email) ){
	die('Error: invalid email address');
}

$formcontent="From: $name \n Address: $email \n Message: $message";
$subject = "Contact Form";
$mailheader = "From: $email \r\n";
mail($myEmail, $subject, $formcontent, $mailheader) or die("Error: Please try again.");
echo "Message Sent, Thank You!";
?>
