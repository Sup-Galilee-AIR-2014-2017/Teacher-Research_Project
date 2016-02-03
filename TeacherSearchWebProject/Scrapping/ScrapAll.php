<?php
	//include('Scrapper.php');
	//include('ScrapperSites/Scrapper_L2TI.php');
	//include('ScrapperSites/Scrapper_LIPN.php');
	include('../Scrapping/Scrapper.php');
	include('../Scrapping/ScrapperSites/Scrapper_L2TI.php');
	include('../Scrapping/ScrapperSites/Scrapper_LIPN.php');
	
	$time_exec = microtime(true);
	
	$scrapper = new Scrapper_LIPN;
	$scrapper->DeleteAllTables();
	$scrapper->InsertUniversity();
	$scrapper->InsertUpdateIntoBdd();
	
	$scrapper = new Scrapper_L2TI;
	$scrapper->InsertUpdateIntoBdd();
	
	$time_end_exec = microtime(true);
	$time = round ($time_end_exec - $time_exec , 2 );
	echo "Temps Execution total: $time secondes <br>";
	
?>
