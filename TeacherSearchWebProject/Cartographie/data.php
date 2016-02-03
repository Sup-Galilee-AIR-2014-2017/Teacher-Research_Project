<?php

	try
{
    // On se connecte à MySQL
     //$bdd = new PDO('mysql:host=localhost;dbname=iweb_project_db;charset=utf8', 'root', 'root');
     //$bdd = new PDO('mysql:host=localhost;dbname=sql4103734;charset=utf8', 'root', 'root');
     $bdd = new PDO('mysql:host=92.222.29.95;dbname=projetiweb;charset=utf8', 'iwebRayane', 'CestLeProjet2.0');
}
catch(Exception $e)
{
    // En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : '.$e->getMessage());
}



/*$requestProf = "SELECT  DISTINCT u.id, CONCAT(first_name , ' ', last_name) AS name_prof
			FROM user u, user_team ut, team t 
			WHERE u.id = ut.user_id
			AND ut.team_id = t.id";*/


$requestProf = "SELECT id, CONCAT(first_name , ' ', last_name) AS name, profession, telephone, bureau
			    FROM user";
$answerProf = $bdd->query($requestProf);
$infoProf = [$answerProf, 1];

$requestEquip = "SELECT id, name, description
				 FROM  team";
$answerEquip = $bdd->query($requestEquip);
$infoEquip = [$answerEquip, 4];


$requestPublication = "SELECT id, title AS name, date_publication AS description
				 FROM  publication";
$answerPublication= $bdd->query($requestPublication);
$infoPublication = [$answerPublication, 5];


$requestLabo = "SELECT id, name, descripition AS description
				 FROM laboratory";
$answerLabo= $bdd->query($requestLabo);
$infoLabo = [$answerLabo, 2];

$requestUniv = "SELECT id, name, address AS description
				 FROM university";
$answerUniv= $bdd->query($requestUniv);
$infoUniv = [$answerUniv, 3];


$requestProfTeam  = "SELECT  u.id AS id_user, last_name, CONCAT(first_name , ' ', last_name) AS name_prof, t.id AS id_thing_common, 
					t.name AS name_thing_common
					FROM user u, user_team ut, team t 
					WHERE u.id = ut.user_id
					AND ut.team_id = t.id";
$answerProfTeam = $bdd->query($requestProfTeam);
$infoProfTeam = [$answerProfTeam, 4];



$requestProfPublication  = "SELECT  u.id AS id_user, last_name, CONCAT(first_name , ' ', last_name) AS name_prof, p.id AS id_thing_common,
					 p.title AS name_thing_common, p.date_publication
					FROM user u, user_publication up, publication p 
					WHERE u.id = up.user_id
					AND up.publication_id = p.id";

$answerProfPublication = $bdd->query($requestProfPublication);
$infoProfPublication = [$answerProfPublication, 5];


$requestEquipLabo  = "SELECT  t.id AS id_user, t.name AS name_prof, l.id AS id_thing_common,
					 l.name AS name_thing_common
					FROM  team t, laboratory l
					WHERE t.laboratory_id = l.id";

$answerEquipLabo = $bdd->query($requestEquipLabo);
$infoEquipLabo = [$answerEquipLabo, 2];


$requestLaboUniv  = "SELECT  l.id AS id_user, l.name AS name_prof, u.id AS id_thing_common,
					 u.name AS name_thing_common
					FROM laboratory l, university u
					WHERE l.university_id = u.id";

$answerLaboUniv = $bdd->query($requestLaboUniv);
$infoLaboUniv = [$answerLaboUniv, 3];


function getNode($answer){
	$json = array();
	$data = array();
	$nodes = array();
	
	if($answer[1] == 1)
		$coulor = 'NodeWhite';
	elseif ($answer[1] == 2) {
		$coulor = 'NodeYellow';
	}
	elseif ($answer[1] == 3) {
		$coulor = 'NodeRed';
	}elseif ($answer[1] == 4) {
		$coulor = 'NodeBlue';
	}elseif ($answer[1] == 5) {
		$coulor = 'NodeGreen';
	}

	// equip bleu

	while ($rows = $answer[0]->fetch()) {
		/*if($rows['id'] == 0)
			$rows['id'] = YZ0;*/
		$json['id'] = utf8_encode ($rows['id'] .substr($rows['name'], 0, 4) );//. substr($rows['name'], -5, 2);
		$json['selected'] = 'false';
		$json['name'] = $rows['name'];
		if ($rows['description'] != "")
			$json['description'] = $rows['description'];
		else 
			$json['description'] = $rows['profession'] ;//.'<br>Bureau : '.$rows['bureau'].'<br> Tel : '.$rows['numero'];
		$json['bureau'] = $rows['bureau'];
		$json['telephone'] = $rows['telephone'];
		$json['NodeType'] = $coulor;
		//echo "allo";
		$data['data'] = $json;
		array_push($nodes, $data);
	}
	//$nodes['nodes'] = $tmp;
	//var_dump($nodes);
	return $nodes;
}


function getEdges($answer){
	$json = array();
	$data = array();
	$nodes = array();
	if($answer[1] == 1)
		$coulor = 'EdgeWhite';
	elseif ($answer[1] == 2) {
		$coulor = 'EdgeYellow';
	}
	elseif ($answer[1] == 3) {
		$coulor = 'EdgeRed';
	}elseif ($answer[1] == 4) {
		$coulor = 'EdgeBlue';
	}elseif ($answer[1] == 5) {
		$coulor = 'NodeGreen';
	}


	while ($rows = $answer[0]->fetch()) {
		/*if($rows['id_user'] == 0)
			$rows['id_user'] = YZ0;
		if($rows['id_thing_common'] == 0)
			$rows['id_thing_common'] = YZ0;*/
		$json['id'] = $rows['id_user'] . $rows['last_name'] . $rows['id_thing_common'];
		$json['target'] = utf8_encode ($rows['id_user'] . substr($rows['name_prof'], 0, 4) );//. substr($rows['name_prof'], -5, 2);
		//$json['target'] = uniqid();
		$json['source'] = utf8_encode ($rows['id_thing_common'] . substr($rows['name_thing_common'], 0, 4) );//. substr($rows['name_team'], -5, 2) ;
		//$json['source'] = uniqid();
		$json['selected'] = 'false';
		$json['interaction'] = $coulor;
		$data['data'] = $json;
		array_push($nodes, $data);
	}
	//$nodes['nodes'] = $tmp;
	//var_dump($nodes);
	return $nodes;



}

$allNodes = array_merge(getNode($infoEquip), getNode($infoProf), getNode($infoPublication), getNode($infoLabo), getNode($infoUniv));
//var_dump($allNodes);
$nodes['nodes'] = $allNodes;
//var_dump(getEdges($infoProfPublication));
$allEdges = array_merge(getEdges($infoProfTeam), getEdges($infoProfPublication), getEdges($infoEquipLabo), getEdges($infoLaboUniv) );
$edges['edges'] = $allEdges;//getEdges($infoProfTeam);
$allData = array_merge($nodes, $edges);
//var_dump($allData);
$elements['elements'] = $allData;
//var_dump($elements);
//echo "<br>";
//echo "<br>";
//echo "<br>";
//$file = fopen('dataRead.json', 'w');
//fwrite($file, json_encode($elements));
//fclose($file);
echo json_encode($elements);










//http://www.kodingmadesimple.com/2015/01/convert-mysql-to-json-using-php.html
?>

