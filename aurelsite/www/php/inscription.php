
 <?php

  try
  {
  
   $bdd = new PDO ('mysql:host=localhost;dbname=infotech', 'root', '');
  
  }
    catch(Exception $e)
  {
   die('Erreur :'.$e->getMessage());
  }
  

//On créer les variables
$login =   $_POST['login'];
$password = $_POST['password'];

if(!empty($login) && !empty($password))
{


}else{
?>


<b>Pseudo ou MDP vide !</b>


<?php
}


if(empty($login) && empty($password))
{
 header('Location: http://localhost/joadcorp/www/indexclientrater') ;

}if(empty($login) or empty($password))
{
 header('Location: http://localhost/joadcorp/www/indexclientrater') ;
}
  else{

$req = $bdd->prepare('INSERT INTO client(cli_nom, cli_mdp) VALUES (:login , :password)');

$req->execute(array("login" => $login, "password" => $password));
session_start();
$_SESSION['login'] = $_POST['login'];
header('Location: http://localhost/joadcorp/www/indexclient');
//header('Location: http://joadcorp.fr/indexclient');


}





   
   ?>