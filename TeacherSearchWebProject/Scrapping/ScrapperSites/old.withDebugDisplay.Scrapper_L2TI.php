<?php
	include '../Scrapping/Scrapper.php';//Pour Rayane
	//include '../Scrapper.php';

	class Scrapper_L2TI extends Scrapper{

		
		//Liste Urls
		var $urlUniversite;
		var $urlLaboratoire;
		var $urlEquipe;
		var $urlMembres;
		var $urlPublications;

		function Scrapper_L2TI(){
			$this->urlUniversite="https://www.kimonolabs.com/api/9oasi060?apikey=siODu9OxJP7ffWgYaPGCqNAiMUgy0t8F";
			$this->urlLaboratoire="https://www.kimonolabs.com/api/eblon2xc?apikey=siODu9OxJP7ffWgYaPGCqNAiMUgy0t8F";
			$this->urlEquipe="https://www.kimonolabs.com/api/95290iiy?apikey=siODu9OxJP7ffWgYaPGCqNAiMUgy0t8F";
			$this->urlMembres="https://www.kimonolabs.com/api/3b4ngva2?apikey=siODu9OxJP7ffWgYaPGCqNAiMUgy0t8F";
			$this->urlPublications="https://api.archives-ouvertes.fr/search/hal/?omitHeader=true&wt=json&q=structure_t%3A%28LIPN%29&fq=NOT+instance_s%3Asfo&fq=NOT+instance_s%3Adumas&fq=NOT+instance_s%3Amemsic&fq=NOT+%28instance_s%3Ainria+AND+docType_s%3A%28MEM+OR+PRESCONF%29%29&fq=NOT+%28instance_s%3Aafssa+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Aenpc+AND+docType_s%3A%28OTHERREPORT+OR+MINUTES+OR+NOTE+OR+SYNTHESE+OR+MEM+OR+PRESCONF%29%29&fq=NOT+%28instance_s%3Auniv-mlv+AND+docType_s%3A%28OTHERREPORT+OR+MINUTES+OR+NOTE+OR+MEM+OR+PRESCONF%29%29&fq=NOT+%28instance_s%3Ademocrite+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Aafrique+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Asaga+AND+docType_s%3A%28PRESCONF+OR+BOOKREPORT%29%29&fq=NOT+%28instance_s%3Aunice+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Alara+AND+docType_s%3AREPACT%29&fq=NOT+status_i%3A111&defType=edismax&rows=2000&fl=uri_s%2Ctitle_s%2Cdescription_s%2CauthFullName_s%2CproducedDate_s&sort=score+desc";
			
			$this->idUniversity = 0;
			$this->idLaboratory = 1;

			parent::Scrapper();
		}




		public function ProcessScrappingSite(){
			// ##### Récupération des donnée #####
			echo "<h1> Recuperation des donnees </h1>";
			
			$time_all = microtime(true);
			/*
			$time_start = microtime(true);
			$Universite = parent::RetrieveDatas( $this->urlUniversite );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Universite: $time secondes <br>";
			
			$time_start = microtime(true);
			$Laboratoire = parent::RetrieveDatas( $this->urlLaboratoire );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Laboratoire: $time secondes <br>";
			
			
			$time_start = microtime(true);
			$Equipe = parent::RetrieveDatas( $this->urlEquipe );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Equipe: $time secondes <br>";
			*/
			
			$time_start = microtime(true);			
			$Membres = parent::RetrieveDatas( $this->urlMembres );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Membres: $time secondes <br>";
			/*
			$time_start = microtime(true);			
			$Publications = parent::RetrieveDatas( $this->urlPublications );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Publications: $time secondes <br>";*/
			
			$time = round ($time_end - $time_all,2);
			echo "<br>Temps total : $time secondes <br>";
			
			
			// ##### Traitement des données #####
			echo "<h1> Traitement des donnees </h1>";
			

			$finalDatas = new DB_Datas();

			//var_dump($Membres);
			$indice = 0;
			$indiceTeam = 0;
			$indiceUserTeam = 0;
			foreach($Membres['results']['collection1'] as $membre) {

				if($indice > 0) {# Le premier element est vide pour ainsi dire.
					$nomPrenom = explode(" ", $membre['Nom']['text']); //Ajouter un petit trim
					$nom = $nomPrenom[0];
					$prenom = $nomPrenom[1];
				
					$fonction = $membre['Profession'];
					$equipe = $membre['Equipe'];
					$descriptionEquipe = "";

					$url_site = $membre['url'];
					$telephone = $membre['Téléphone'];
					$email = $membre['Email'];
					$bureau = $membre['Salle'];
					$age = "";

					//echo "Nom = { $nom }, Prenom = { $prenom }, Fonction = { $fonction }, Equipe = { $equipe } <br>";
					
					if($equipe != "") {

						$idTeamContained = $this->getIdElementByName($equipe, $finalDatas->teams);

						if($idTeamContained == -1){ # Team not already added
							$finalDatas->teams[$indiceTeam] = new Team($indiceTeam, $equipe, $descriptionEquipe, $this->idLaboratory);							
							$finalDatas->userTeams[$indiceUserTeam] = new UserTeam($indiceTeam,  $indice);
							$indiceTeam++;
						}else {
							$finalDatas->userTeams[$indiceUserTeam] = new UserTeam($idTeamContained,  $indice);
						}
						$indiceUserTeam++;
					}
					
						
						
					$finalDatas->users[$indice] = new User($indice, $prenom, $nom, $age, $url_site, $telephone, $email, $bureau, $fonction);

				}

				$indice++;

			}

			$finalDatas->university[0] = new University($this->idUniversity, "Paris 13", "99 Avenue J.B. Clément - 93430 Villetaneuse");

			$finalDatas->laboratory[0] = new Laboratory($this->idLaboratory, "L2TI", "Laboratoire de traitement et transport de l'information ", $this->idUniversity);


			## Partie publications ##

			$time_start = microtime(true);
			$Publications = parent::RetrieveDatas( $this->urlPublications );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Publications: $time secondes <br>";


			$indice = 0;
			$indiceUserPub = 0;
			foreach($Publications['response']['docs'] as $publication) {
				$publicationName = $publication['title_s'][0];
				$date_publication = $publication['producedDate_s'];
				$authors = $publication['authFullName_s'];
				$description = "";
				$url = $publication['uri_s'];

				$finalDatas->publications[$indice] = new Publication($indice, $publicationName, $description, $url, $date_publication);

				//echo "<br><br><br>publicationName = '$publicationName'<br>date_publication = '$date_publication'<br>authors = '$authors'<br><br><br>";
				foreach($authors as $author) {
					$splitedName = explode(" ", $author);
					$authorFirstName = $splitedName[0];
					$authorLastName = $splitedName[1];
		//echo "nom = $authorFirstName, prenom = $authorLastName";
					$idUserExisting = $this->getIdElementByFirstNameAndLastName($authorFirstName, $authorLastName, $finalDatas->users);
					
					if($idUserExisting != -1)
						$finalDatas->userPublications[$indiceUserPub++] = new UserPublication($indice,  $idUserExisting );

					//echo "<br><br>authorFirstName = '$authorFirstName', authorLastName = '$authorLastName'<br><br>";
				}
				$indice++;
				
			}

			## Partie Equipe (description) ##

			$time_start = microtime(true);
			$Equipe = parent::RetrieveDatas( $this->urlEquipe );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Equipe: $time secondes <br>";

			$indice = 0;
			foreach($Equipe['results']['collection1'] as $equipe) {
				//echo "Team => {$equipe['Nom']['text']}";
				$indexExistingTeam = $this->getIndexElementByName($equipe['Nom']['text'], $finalDatas->teams);
				if($indexExistingTeam != -1) {
					$finalDatas->teams[$indexExistingTeam]->Description = $equipe['Description'];
					//echo "EquipeDesc = '{$equipe['Nom']['text']}', Description = '{$equipe['Description']}'<br>";
				}
				$indice++;
			}
			

			




				#####			   #####
				#####   AFFICHAGEs TESTS   #####
				#####			   #####





			//echo $Membres['results']['collection1'][2]['Equipe'];
			/*
			$indice = 0;
			foreach($finalDatas->functions as $function) {
				echo "Fonction No $indice = '{$function->Name}' <br>";
				$indice++;
			}*/
			$indice = 0;
			/*foreach($finalDatas->users as $user) {
				echo "User No $indice : { Id = '{$user->Id}', FirstName = '{$user->FirstName}', LastName = '{$user->LastName}', Age = '{$user->Age}' , url_site = '{$user->Url}' , Telephone = '{$user->Telephone}' , Email = '{$user->Email}' , Bureau = '{$user->Bureau}' , Profession = '{$user->Profession}' } <br>";
				$indice++;
			}*/
			
			foreach($finalDatas->teams as $team) {
				echo "Team No $indice : { Id = '{$team->Id}', Name = '{$team->Name}', Description = '{$team->Description}', LaboratoryId = '{$team->LaboratoryId}' } <br>";
				$indice++;
			}/*
			echo "<br><br><br>";
			$indice = 0;
			foreach($finalDatas->userTeams as $userTeam) {
				echo "UserTeam No $indice : { TeamId = '{$userTeam->TeamId}', UserId = '{$userTeam->UserId}' } <br>";
				$indice++;
			}*/
			/*$indice = 0;
			foreach($finalDatas->publications as $publi) {
				echo "Publication No $indice : { Id = '{$publi->Id}', Title = '{$publi->Title}', Description = '{$publi->Description}', Url = '{$publi->Url}', Date_publication = '{$publi->Date_publication}' } <br>";
				$indice++;
			}*/
			/*echo "<br><br>";
			$indice = 0;
			foreach($finalDatas->userPublications as $publi) {
				echo "PublicationUser No $indice : { PublicationId = '{$publi->PublicationId}', UserId = '{$publi->UserId}'<br>";
				$indice++;
			}*/

			
			return $finalDatas;

		}

		
		function getIdElementByName($elementName, $arrayElements) {
			foreach($arrayElements as $currentElement){
				
				if($currentElement->Name == $elementName){
					return $currentElement->Id;
				}
			}
			return -1;
		}
		
		function getIndexElementByName($elementName, $arrayElements) {
			$i = 0;
			foreach($arrayElements as $currentElement){				
				if($currentElement->Name == $elementName){
					return $i;
				}
				$i++;
			}
			return -1;
		}

		function getIdElementByFirstNameAndLastName($elementFirstName, $elementLastName, $arrayElements) {

			foreach($arrayElements as $currentElement){
/*
				if(mb_strtolower($elementFirstName, 'UTF-8') == "nicolas") {
					echo "<br>currentElement->FirstName: " . $this->formatStringUniforme($currentElement->FirstName) . "<br>";
					echo "currentElement->LastName: " . $this->formatStringUniforme($currentElement->LastName) . "<br>";
					echo "elementFirstName: " . $this->formatStringUniforme($elementFirstName) . "<br>";
					echo "elementLastName: " . $this->formatStringUniforme($elementLastName) . "<br>";
				}*/
				
				if($this->formatStringUniforme($currentElement->FirstName, 'UTF-8') == $this->formatStringUniforme($elementFirstName, 'UTF-8') && $this->formatStringUniforme($currentElement->LastName, 'UTF-8') == $this->formatStringUniforme($elementLastName, 'UTF-8')) {
					//echo "OK! Id = '{$currentElement->Id}', FirstName = '{$currentElement->FirstName}', LastName = '{$currentElement->LastName}'<br><br><br>";
					return $currentElement->Id;
					
				}
			}

			/*echo "<br>elementFirstName: " . $this->formatStringUniforme($elementFirstName, 'UTF-8') . "<br>";
			echo "elementLastName: " . $this->formatStringUniforme($elementLastName, 'UTF-8') . "<br>";
			echo "NON<br><br><br>";*/

			return -1;
		}

		function formatStringUniforme($chaineStr) {
			   $chaineStr = mb_strtolower($chaineStr, 'UTF-8');

			   $chaineStr = str_replace(

			      array('é', 'è', 'ê', 'ë', 'à', 'â', 'î', 'ï', 'ô', 'ù', 'û'),

			      array('e', 'e', 'e', 'e', 'a', 'a', 'i', 'i', 'o', 'u', 'u'),

			      $chaineStr

			   );
			return $chaineStr;
		}



	}

	$time_exec = microtime(true);
	$scrapper = new Scrapper_L2TI;
	//$scrapper->InsertUpdateIntoBdd();
	$time_end_exec = microtime(true);
	$time = round ($time_end_exec - $time_exec , 2 );
	echo "Temps Execution total: $time secondes <br>";


?>
