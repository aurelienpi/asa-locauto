<?php
// on se connecte à MySQL 

  try
  {
  
   $bdd = new PDO ('mysql:host=localhost;dbname=infotech', 'root', '');
  
  }
    catch(Exception $e)
  {
   die('Erreur :'.$e->getMessage());
  }
   
  $login = $_POST['login'];
  $password= $_POST['password'];
 
if (($_POST['login']) && ($_POST['password'])){
	$login = $_POST['login'];
	$password= $_POST['password'];
}
if(empty($login) && empty($password))
{
     header('Location: http://localhost/joadcorp/www/indexclientrater') ;

}else{

$req = $bdd->prepare('SELECT cli_nom from client where cli_nom=login');

$req->execute(array("login" => $login, "password" => $password));
session_start();
$_SESSION['login'] = $_POST['login'];
header('Location: http://localhost/joadcorp/www/indexclient');
}
?>