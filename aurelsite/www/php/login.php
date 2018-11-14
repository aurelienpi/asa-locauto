<?php
session_start();
$_SESSION['login']=$_POST['login'];
$_SESSION['password']=$_POST['password'];

//echo 'toto:'.$_SESSION['password']; die ();

echo "ioui";
  
// On vérifie si le champ login n'est pas vide.
if ($_SESSION['login']=="")
// Si c'est le cas, le visiteur ne s'est pas loger et subit une redirection
{  
  //header('Location: http://localhost/joadcorp/www/indexclientrater') ;   
  echo "ee";
}
else
{ 
  echo "  <a href src='logout.php'> Se déconnecter </a> || Utilisateur: ". $_SESSION['login'] ."";  }
// Test De vérification que l'user est bien dans la liste des utilisateurs Mysql
// Connexion à la base de données MySql
 try
  {
  
   $bdd = new PDO ('mysql:host=localhost;dbname=infotech', 'root', '');
  
  }
    catch(Exception $e)
  {
   die('Erreur :'.$e->getMessage());
  }



 $query =$bdd->prepare("SELECT cli_nom from client where cli_mdp ='".$_SESSION['password']."'");
  $query->execute();
  $row = $query->fetch();
  



 
if (  $row['cli_nom'] ==$_SESSION['login'] )
// Le vrai mot de passe crypté est sauvergardé dans la variable $RealPasswd
{
  
  header('Location: http://localhost/joadcorp/www/indexclient');
}else {
   header('Location: http://localhost/joadcorp/www/indexclientrater') ;

}

?>