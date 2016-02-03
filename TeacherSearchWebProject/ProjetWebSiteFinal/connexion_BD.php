<?php
	/*
	try
	{
		// On se connecte à MySQL
		$BDD = mysql_connect("sql4.freemysqlhosting.net","sql4103734","s81z9hm929");
		mysql_select_db("sql4103734");  // S�lection de la base de donn�es utilis�e.
	
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
			die('Erreur : '.$e->getMessage());
	}
	*/


try
	{
		// On se connecte à MySQL
		$BDD = mysql_connect("92.222.29.95","iwebRayane","CestLeProjet2.0");
		mysql_select_db("projetiweb");  // S�lection de la base de donn�es utilis�e.
		//    public function connect($host="92.222.29.95", $user="iwebRayane", $paswd="CestLeProjet2.0", $db="projetiweb")   

	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
			die('Erreur : '.$e->getMessage());
	}


	//if($BDD)
		//echo "connexion réussie";
	/*
	try
{
    // On se connecte à MySQL
     //$bdd = new PDO('mysql:host=localhost;dbname=iweb_project_db;charset=utf8', 'root', 'root');
     $BDD = new PDO('mysql:host=localhost;dbname=sql4103734;charset=utf8', 'root', 'root');
}
catch(Exception $e)
{
    // En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : '.$e->getMessage());
}

*/

	
?> 


