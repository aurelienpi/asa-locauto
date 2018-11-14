 <?php
//Connexion à la BDD

  try
  {
  
   $bdd = new PDO ('mysql:host=localhost;dbname=infotech', 'root', '');
  
  }
    catch(Exception $e)
  {
   die('Erreur :'.$e->getMessage());
  }
  

//On créer les variables
$service =   $_POST['service'];
$categorie = $_POST['categorie'];

if(!empty($service) && !empty($categorie))
{


}else{
?>


<b>Pseudo ou MDP vide !</b>


<?php
}


if(empty($service) && empty($categorie))
{
 header('Location: http://localhost/joadcorp/www/indexclientrater') ;

}if(empty($service) or empty($categorie))
{
 header('Location: http://localhost/joadcorp/www/indexclientrater') ;
}
  else{

$req = $bdd->prepare('INSERT INTO categorie_s(cat_libelle, cat_description) VALUES (:service , :categorie)');

$req->execute(array("service" => $service, "categorie" => $categorie));
session_start();
$_SESSION['service'] = $_POST['service'];
header('Location: http://localhost/joadcorp/www/indexclientcat.php');
//header('Location: http://joadcorp.fr/indexclient');


}





   
   ?>