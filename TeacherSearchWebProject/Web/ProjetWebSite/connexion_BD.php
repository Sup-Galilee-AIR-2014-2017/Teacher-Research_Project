<?php
	
	try
	{
		// On se connecte à MySQL
		//$BDD = mysql_connect("sql4.freemysqlhosting.net","sql4103734","s81z9hm929");
		$BDD = mysql_connect("92.222.29.95", "iwebRayane", "CestLeProjet2.0");
		mysql_select_db("projetiweb");  // S�lection de la base de donn�es utilis�e.
	
	}
	catch(Exception $e)
	{
		// En cas d'erreur, on affiche un message et on arrête tout
			die('Erreur : '.$e->getMessage());
	}
	
	
?> 
