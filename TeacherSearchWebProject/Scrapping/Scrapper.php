<?php
	//include('C:\wamp\www\TeacherSearchWebProject\Modele\DbTableClasses.php');
	include('../Modele/DbTableClasses.php');//Pour Rayane
	//include('C:\wamp\www\TeacherSearchWebProject\DAO\Manager_base.php');
	include('../DAO/Manager_base.php');//Pour Rayane

	abstract class Scrapper {
	
		var $db_Datas;
		var $idUniversity;
		var $idLaboratory;
		
		function Scrapper() {
			$this->db_Datas= $this->ProcessScrappingSite();
		}
		
		/**
		*	Recupère et traite les données des apis et renvoi le tableau contenant les données.
		*
		* @param 
		* @return array(DB_DATA)
		*/
		public abstract function ProcessScrappingSite();
		
		/**
		*	Appel les classes du DAO afin de remplir la base
		*
		* @param 
		* @return 
		*/
		public function InsertUpdateIntoBdd() {
					
			echo "<h1> Insertion des donnees en base </h1>";
			
			// Init manager
			$managerdb = new Manager_base;
			
			// Connection à la base
			$managerdb->connect();
			
			//Forcer l'encodage
			$managerdb->query('SET NAMES UTF8');

			//### Requete sur table User
			echo ' User: ';
			$data=array();
			foreach ( $this->db_Datas->users as $tmp) {
				$data[]=$tmp->toStringDb();
			}
			$managerdb->insertAssocMultiple("user", $data );
			echo 'Done ! <br>';
			
			//Requete sur table Project
			//echo ' Project: ';
			//$data=array();
			//foreach ( $this->db_Datas["projects"] as $tmp) {
			//	$data[]=$tmp->toStringDb();
			//}
			//$managerdb->insertAssocMultiple("projet", $data );
			//echo 'Done ! <br>';
			
			//Requete sur table UserProject
			//echo ' UserProject: ';
			//$data=array();
			//foreach ( $this->db_Datas["userProjects"] as $tmp) {
			//	$data[]=$tmp->toStringDb();
			//}
			//$managerdb->insertAssocMultiple("user_projet", $data );
			//echo 'Done ! <br>';
			
			//Requete sur table Publication
			echo ' Publication: ';
			$data=array();
			foreach ( $this->db_Datas->publications as $tmp) {
				$data[]=$tmp->toStringDb();
			}
			$managerdb->insertAssocMultiple("publication", $data );
			echo 'Done ! <br>';
			
			//Requete sur table UserPublication
			echo ' UserPublication: ';
			$data=array();
			foreach ( $this->db_Datas->userPublications as $tmp) {
				$data[]=$tmp->toStringDb();
			}
			$managerdb->insertAssocMultiple("user_publication", $data );
			echo 'Done ! <br>';
			
			//Requete sur table Laboratory
			echo ' Laboratory: ';
			$data=array();
			foreach ( $this->db_Datas->laboratory as $tmp) {
				$data[]=$tmp->toStringDb();
			}
			$managerdb->insertAssocMultiple("laboratory", $data );
			echo 'Done ! <br>';
			
			//Requete sur table Team
			echo ' Team: ';
			$data=array();
			foreach ( $this->db_Datas->teams as $tmp) {
				$data[]=$tmp->toStringDb();
			}
			$managerdb->insertAssocMultiple("team", $data );
			echo 'Done ! <br>';
			
			//Requete sur table UserTeam
			echo ' UserTeam: ';
			$data=array();
			foreach ( $this->db_Datas->userTeams as $tmp) {
				$data[]=$tmp->toStringDb();
			}
			$managerdb->insertAssocMultiple("user_team", $data );
			echo 'Done ! <br><br>';			
		}
		
		/**
		*	Recupère les données d'une api
		*
		* @param url
		* @return array(json)
		*/
		public function RetrieveDatas( $url ){
			echo '<meta charset="UTF-8">';
			return json_decode(file_get_contents($url), TRUE);
		}
		
		/**
		*	Purge toutes les tables de la base		*
		* 
		* @param 
		* @return 
		*/
		public function DeleteAllTables(){
			// Init manager
			$managerdb = new Manager_base;
			
			// Connection à la base
			$managerdb->connect();
			
			//Suppression des données des tables
			$managerdb->query("DELETE FROM `user_team`");	
			$managerdb->query("DELETE FROM `team`");
			$managerdb->query("DELETE FROM `laboratory`");			
			$managerdb->query("DELETE FROM `university`");				
			$managerdb->query("DELETE FROM `user_publication`");			
			$managerdb->query("DELETE FROM `publication`");			
			$managerdb->query("DELETE FROM `user_project`");	
			$managerdb->query("DELETE FROM `projet`");
			$managerdb->query("DELETE FROM `user`");
		}
		
		public function InsertUniversity(){
			// Init manager
			$managerdb = new Manager_base;
			
			// Connection à la base
			$managerdb->connect();
			
			//Requete sur table University
			echo ' University: ';
			$data=array();
			foreach ( $this->db_Datas->university as $tmp) {
				$data[]=$tmp->toStringDb();
			}
			$managerdb->insertAssocMultiple("university", $data);	
			echo 'Done ! <br>';
		}
			
	}
?>


