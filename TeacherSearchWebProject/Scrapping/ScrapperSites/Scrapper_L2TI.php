<?php
	//include '../Scrapping/Scrapper.php';//Pour Rayane
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
			$this->urlLaboratoire="https://www.kimonolabs.com/api/709gyu7c?apikey=siODu9OxJP7ffWgYaPGCqNAiMUgy0t8F";
			$this->urlEquipe="https://www.kimonolabs.com/api/aesu0qha?apikey=siODu9OxJP7ffWgYaPGCqNAiMUgy0t8F&kimmodify=1";
			$this->urlMembres="https://www.kimonolabs.com/api/9cdkgdi4?apikey=siODu9OxJP7ffWgYaPGCqNAiMUgy0t8F&kimmodify=1";
			$this->urlPublications="https://api.archives-ouvertes.fr/search/hal/?omitHeader=true&wt=json&q=structure_t%3A%28L2TI%29&fq=NOT+instance_s%3Asfo&fq=NOT+instance_s%3Adumas&fq=NOT+instance_s%3Amemsic&fq=NOT+%28instance_s%3Ainria+AND+docType_s%3A%28MEM+OR+PRESCONF%29%29&fq=NOT+%28instance_s%3Aafssa+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Aenpc+AND+docType_s%3A%28OTHERREPORT+OR+MINUTES+OR+NOTE+OR+SYNTHESE+OR+MEM+OR+PRESCONF%29%29&fq=NOT+%28instance_s%3Auniv-mlv+AND+docType_s%3A%28OTHERREPORT+OR+MINUTES+OR+NOTE+OR+MEM+OR+PRESCONF%29%29&fq=NOT+%28instance_s%3Ademocrite+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Aafrique+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Asaga+AND+docType_s%3A%28PRESCONF+OR+BOOKREPORT%29%29&fq=NOT+%28instance_s%3Aunice+AND+docType_s%3AMEM%29&fq=NOT+%28instance_s%3Alara+AND+docType_s%3AREPACT%29&fq=NOT+status_i%3A111&defType=edismax&rows=2000&fl=title_s%2Cdescription_s%2Curi_s%2CauthFullName_s%2CproducedDate_s&sort=score+desc";
			
			$this->idUniversity = 0;
			$this->idLaboratory = 1;

			parent::Scrapper();
		}



		public function ProcessScrappingSite(){
			// ##### Récupération des donnée #####
			echo "<h1> Recuperation des donnees </h1>";
			
			$time_all = microtime(true);
			
			$time_start = microtime(true);
			$Publications = parent::RetrieveDatas( $this->urlPublications );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Publications: $time secondes <br>";
			
			$time_start = microtime(true);			
			$Membres = parent::RetrieveDatas( $this->urlMembres );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Membres: $time secondes <br>";
			
			$time_start = microtime(true);
			$Equipe = parent::RetrieveDatas( $this->urlEquipe );
			$time_end = microtime(true);
			$time = round ($time_end - $time_start,2);
			echo "Temps Recuperation Equipe: $time secondes <br>";

			$time = round ($time_end - $time_all,2);
			echo "<br>Temps total : $time secondes <br>";
			
			
			// ##### Traitement des données #####
			echo "<h1> Traitement des donnees </h1>";
			

			$finalDatas = new DB_Datas();


			$indice = 0;
			$indiceTeam = 0;
			$indiceUserTeam = 0;
			foreach($Membres['results']['collection1'] as $membre) {

				if($indice > 0) {# Le premier element est vide pour ainsi dire.
					$nomPrenom = explode(" ", $membre['Nom']);
					$nom = $nomPrenom[0];
					if(count($nomPrenom) > 1) {
						$prenom = $nomPrenom[1];
						#$email = "{$this->formatStringUniforme($prenom)}.{$this->formatStringUniforme($nom)}@univ-paris13.fr";
					}else {
						$prenom = "";
						#$email = "{$this->formatStringUniforme($nom)}@univ-paris13.fr";
					}

				
					$fonction = $membre['Profession'];
					$equipe = $membre['Equipe'];
					$descriptionEquipe = "";

					$url_site = "http://www-l2ti.univ-paris13.fr/~{$this->formatStringUniforme($nom)}/";
					$telephone = $membre['Telephone'];
					
					$email = $this->CorrectionEmail($membre["Email"]);
										
					$bureau = $membre['Salle'];
					$age = "";

					$idUser = $this->idLaboratory + (100 * $indice);

					if($equipe != "") {
			
						$idTeam = $this->idLaboratory + (100 * ($indiceTeam + 1));

						$idTeamContained = $this->getIdElementByName($equipe, $finalDatas->teams);

						if($idTeamContained == -1){ # Team not already added
							$finalDatas->teams[$indiceTeam] = new Team($idTeam, $equipe, $descriptionEquipe, $this->idLaboratory);
							$finalDatas->userTeams[$indiceUserTeam] = new UserTeam($idTeam,  $idUser);
							$indiceTeam++;
						}else {
							$finalDatas->userTeams[$indiceUserTeam] = new UserTeam($idTeamContained,  $idUser);
						}
						$indiceUserTeam++;
					}
					
					
					$finalDatas->users[$indice] = new User($idUser, $prenom, $nom, $age, $url_site, $telephone, $email, $bureau, $fonction);

				}

				$indice++;

			}

			

			$finalDatas->university[0] = new University($this->idUniversity, "Paris 13", "99 Avenue J.B. Clément - 93430 Villetaneuse");

			$finalDatas->laboratory[0] = new Laboratory($this->idLaboratory, "L2TI", "Laboratoire de traitement et transport de l'information ", $this->idUniversity);


			## Partie publications ##

			
			$indice = 0;
			$indiceUserPub = 0;
			foreach($Publications['response']['docs'] as $publication) {
				$publicationName = $publication['title_s'][0];
				$date_publication = $publication['producedDate_s'];
				$authors = $publication['authFullName_s'];
				$description = "";
				$url = $publication['uri_s'];

				$idPublication = $this->idLaboratory + (100 * ($indice +1));

				$finalDatas->publications[$indice] = new Publication($idPublication, $publicationName, $description, $url, $date_publication);

				foreach($authors as $author) {
					$splitedName = explode(" ", $author);
					$authorFirstName = $splitedName[0];
					$authorLastName = $splitedName[1];

					$idUserExisting = $this->getIdElementByFirstNameAndLastName($authorFirstName, $authorLastName, $finalDatas->users);
					
					if($idUserExisting != -1)
						$finalDatas->userPublications[$indiceUserPub++] = new UserPublication($idPublication,  $idUserExisting );

				}
				$indice++;
				
			}

			## Partie Equipe (description) ##

			

			$indice = 0;
			foreach($Equipe['results']['collection1'] as $equipe) {
				$indexExistingTeam = $this->getIndexElementByName($equipe['Nom'], $finalDatas->teams);

				if($indexExistingTeam != -1) {
					$finalDatas->teams[$indexExistingTeam]->Description = $equipe['Description'];
				}
				$indice++;
			}			
			




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
				
				if($this->formatStringUniforme($currentElement->FirstName, 'UTF-8') == $this->formatStringUniforme($elementFirstName, 'UTF-8') && $this->formatStringUniforme($currentElement->LastName, 'UTF-8') == $this->formatStringUniforme($elementLastName, 'UTF-8')) {
					return $currentElement->Id;
					
				}
			}


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

		function CorrectionEmail($email) {
			$reversedMail = strrev($email);
			if($email[0] != '<') {
				if(strpos($reversedMail, "@")) # Pour régler un bug de leur site (email erronée)
					$emailFinal = $reversedMail;
				else
					$emailFinal = "";
			}else{
				if(preg_match("/(\S)*@(.*)(\.fr|\.com)/", $reversedMail, $matches)) {
					$emailFinal = $matches[0];
				}else 
					$emailFinal = "";
			}
			return $emailFinal;
		}

	}
/*
	$time_exec = microtime(true);
	$scrapper = new Scrapper_L2TI;
	$scrapper->InsertUpdateIntoBdd();
	$time_end_exec = microtime(true);
	$time = round ($time_end_exec - $time_exec , 2 );
	echo "Temps Execution total: $time secondes <br>";*/


?>
