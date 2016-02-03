<?php
require('connexion_BD.php');
?>

<?php
@session_start();
$connexionOK = FALSE;
session_destroy();
// ?>

<?php 

if(isset($_POST["requete"])){
   
   // On regarde si tout les champs sont remplis. Sinon on lui affiche un message d'erreur.   
   if($_POST["text"] == NULL ){
      	
		$sql = "SELECT user.id, first_name, last_name, profession, email, url_site, bureau, telephone, laboratory.descripition, GROUP_CONCAT(title SEPARATOR '|') 
		as title FROM user, team, user_team,laboratory, publication, user_publication WHERE user.id = user_team.user_id and team_id = team.id  
		and laboratory.id=laboratory_id and user.id= user_publication.user_id and publication_id=publication.id group by user.id order by first_name asc";
		$req = mysql_query($sql);
	
   }
   
   // Sinon si tout les champs sont remplis alors on regarde si le nom de compte rentr� existe bien dans la base de donn�es.
   else{
		if($_POST['filtre'] == "all"){
			$sql = "SELECT user.id, first_name, last_name, profession, email, url_site, bureau, telephone, laboratory.descripition, GROUP_CONCAT(title SEPARATOR '|') 
			as title FROM user, team, user_team, laboratory, publication, user_publication WHERE user.id = user_team.user_id and team_id = team.id  
			and laboratory.id=laboratory_id and user.id= user_publication.user_id and publication_id=publication.id and 
			(first_name like '%".$_POST["text"]."%' OR last_name like '%".$_POST["text"]."%'OR publication.title like '%".$_POST["text"]."%' 
			OR laboratory.descripition ) group by user.id order by first_name asc";
			
			$req = mysql_query($sql);
		}
		
		if($_POST['filtre'] == "publication"){
			$sql = "SELECT user.id, first_name, last_name, profession, email, url_site, bureau, telephone, laboratory.descripition, GROUP_CONCAT(title SEPARATOR '|') 
			as title FROM user, team, user_team, laboratory, publication, user_publication WHERE user.id = user_team.user_id and team_id = team.id  
			and laboratory.id=laboratory_id and user.id= user_publication.user_id and publication_id=publication.id and title like '%".$_POST["text"]."%' 
			group by user.id order by first_name asc"; 
			
			$req = mysql_query($sql);
		}
		
		if($_POST['filtre'] == "laboratory"){
			$sql = "SELECT user.id, first_name, last_name, profession, email, url_site, bureau, telephone, laboratory.descripition, GROUP_CONCAT(title SEPARATOR '|') 
			as title FROM user, team, user_team, laboratory, publication, user_publication WHERE user.id = user_team.user_id and team_id = team.id  
			and laboratory.id=laboratory_id and user.id= user_publication.user_id and publication_id=publication.id and (laboratory.name 
			like '%".$_POST["text"]."%' OR laboratory.descripition like '%".$_POST["text"]."%') group by user.id order by first_name asc";
			
			$req = mysql_query($sql);
		}
   }
   
	
      
      // Si oui, on continue le script...      
	if($req){
         
		 $connexionOK = TRUE;
		 //$donnees = mysql_fetch_assoc($req);
  
	}
	
	else{
	}
	  
 }   
 
 


?>

	
