<?php 


	class DB_Datas {
		var $functions;
		var $users;
		var $university;
		var $laboratory;
		var $teams;
		var $userTeams;
		var $projects;
		var $userProjects;
		var $publications;
		var $userPublications;

		function DB_Datas() {
			$this->functions = array();//Function();
			$this->users = array();
			$this->university = array();
			$this->laboratory = array();
			$this->teams = array();
			$this->userTeams = array();
			$this->projects = array();
			$this->userProjects = array();
			$this->publications = array();
			$this->userPublications = array();
		}

	}

	//a virer
	class Fonction {
		var $Id;
		var $Name;

		function Fonction($id, $function) {
			$this->Name = $function;
			$this->Id = $id;
		}

	}
	//
	
	class User {
		var $Id;
		var $FirstName;
		var $LastName;		
		var $Age;
		var $Url;
		var $Telephone;
		var $Email;
		var $Bureau;
		var $Profession;
		
		// A virer 
		var $IdFunction;
		var $IdSkill;//Normalement il devrait y avoir une table de transition entre les compétences et l'utilisateur car un utilisateur doit pouvoir avoir plusieurs compétences et vice-versa.
		//
		
		function User($id, $firstName ,$lastName, $age, $url_site, $telephone, $email, $bureau, $profession) {
			$this->Id = $id;
			$this->FirstName = $firstName;
			$this->LastName = $lastName;
			$this->Age = $age;
			$this->Url = $url_site;
			$this->Telephone = $telephone;
			$this->Email = $email;
			$this->Bureau = $bureau;
			$this->Profession = $profession;
		}
		
		public function toStringDb(){
			return array(
						  "id"  => $this->Id,
						  "first_name"  => $this->FirstName,
						  "last_name"  => $this->LastName,
						  "age"=> $this->Age,
						  "url_site"=> $this->Url,
						  "telephone"=> $this->Telephone,
						  "email"=> $this->Email,
						  "bureau"=> $this->Bureau,
						  "profession"=> $this->Profession
						);
		}
	}

	class University {
		var $Id;
		var $Name;
		var $Adress;
		
		function University($id, $name, $adress) {
			$this->Id = $id;
			$this->Name = $name;
			$this->Adress = $adress;
		}
		
		public function toStringDb(){
			return array(
						  "id"  => ($this->Id.""),
						  "name"  => $this->Name,
						  "address"  => $this->Adress
						);
		}
	}
	
	class Laboratory {
		var $Id;
		var $Name;
		var $Description;
		var $UniversityId;
		
		function Laboratory($id, $name, $description, $universityId) {
			$this->Id = $id;
			$this->Name = $name;
			$this->Description = $description;
			$this->UniversityId = $universityId;
		}
		
		public function toStringDb(){
			return array(
						  "id"  => $this->Id,
						  "name"  => $this->Name,
						  "descripition"  => $this->Description,
						  "university_id"=> $this->UniversityId
						);
		}
	}
	
	class Team {
		var $Id;
		var $Name;
		var $Description;
		var $LaboratoryId;

		function Team($id, $name, $description, $laboratoryId) {
			$this->Id = $id;
			$this->Name = $name;
			$this->Description = $description;
			$this->LaboratoryId = $laboratoryId;
		}

		public function toStringDb(){
			return array(
						  "id"  => $this->Id,
						  "name"  => $this->Name,
						  "description"  => $this->Description,
						  "laboratory_id"=> $this->LaboratoryId
						);
		}
	}
	
	class UserTeam {
		var $TeamId;
		var $UserId;
		
		function UserTeam($teamId,  $userId )  {
			$this->TeamId = $teamId;
			$this->UserId = $userId ;
		}
		
		public function toStringDb(){
			return array(
						  "team_id"  => $this->TeamId,
						  "user_id"  => $this->UserId
						);
		}
	}

	class Project {
		var $Id;
		var $Title;
		var $Description;
		var $Url;
		var $Date_publication;
		
		function Project($id, $name, $description, $url, $date_publication) {
			$this->Id = $id;
			$this->Title = $name;
			$this->Description = $description;
			$this->Url = $url;
			$this->Date_publication = $date_publication;
		}
		
		public function toStringDb(){
			return array(
						  "id"  => $this->Id,
						  "title"  => $this->Title,
						  "description"  => $this->Description,
						  "url"  => $this->Url,
						  "date_publication"  => $this->Date_publication
						);
		}
	}
	
	class UserProject {
		var $ProjectId;
		var $UserId;
		
		function UserProject($projectId,  $userId )  {
			$this->ProjectId = $projectId;
			$this->UserId = $userId ;
		}
		
		public function toStringDb(){
			return array(
						  "user_id"  => $this->UserId,
						  "project_id"  => $this->ProjectId
						);
		}
	}

		
	class Publication {
		var $Id;
		var $Title;
		var $Description;
		var $Url;
		var $Date_publication;
		
		function Publication($id, $name, $description, $url, $date_publication) {
			$this->Id = $id;
			$this->Title = $name;
			$this->Description = $description;
			$this->Url = $url;
			$this->Date_publication = $date_publication;
		}
		
		public function toStringDb(){
			return array(
						  "id"  => $this->Id,
						  "title"  => $this->Title,
						  "description"  => $this->Description,
						  "url"  => $this->Url,
						  "date_publication"  => $this->Date_publication
						);
		}
	}
	
	class UserPublication {
		var $PublicationId;
		var $UserId;
		
		function UserPublication($publicationId,  $userId )  {
			$this->PublicationId = $publicationId;
			$this->UserId = $userId ;
		}
		
		public function toStringDb(){
			return array(
						  "user_id"  => $this->UserId,
						  "publication_id"  => $this->PublicationId
						);
		}
		
	}

?>
