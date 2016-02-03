<?php
require('treatment.php');

?>


<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/css/bootstrap-theme.min.css">
		<script src="http://code.jquery.com/jquery-latest.js"></script><!-- Bootstrap javascript requires Jquery -->
		<script src="bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="webSite.css">
	</head>
		
	<body>
		
		<div class="container">		
			<?php include('header.html')?>
			
			<div class="row" id="page-content">
				<div class="col-md-12">
		
								<?php
									
									if($connexionOK){
										
									echo '
										<div class="bs-example" 
											<div class="panel-group" id="accordion" > ';
												while($data=mysql_fetch_array($req) ){
												
														echo'<div class="panel panel-default" class="col-md-6">
																<div class="panel-heading">
																	<h4 class="panel-title" >
																		<div class="row">
																			<div class="col-md-10 col-sm-10 col-xs-10">
																				<a data-toggle="collapse" data-parent = "#accordion" href="#collapse">
																					<button type="button" class="btn btn-success" data-toggle="collapse" data-target="#collapse'.$data['id'].'">
																						<span class="glyphicon glyphicon-collapse-down"></span> + dInfos
																					</button>
																				</a> '.utf8_encode($data['first_name']).'  '.utf8_encode($data['last_name']).'
																			</div>';
																			//$requete=utf8_encode($data['first_name']);
																			$tmpName=utf8_encode($data['first_name'].$data['last_name']);
																			$requete=utf8_encode ($data['id'] .substr($tmpName, 0, 4) );
																			
																			echo'<div class="col-md-2 col-sm-2 col-xs-10">
																			
																				<a  class="btn btn-success" href="Cartographie/index.php?requete='.$requete.'" role="button" target="_blank">
																						Cartographie 
																				</a>
																			</div>
																		</div>	
																		
																	</h4>
																		
																</div>
																<div id="collapse'.$data['id'].'" class="panel-collapse collapse ">
																	<div class="panel-body">
																		<div class="row">
																			<div class="col-md-6">
																				<table class="table table-hover">
																					<tr>
																						<th><strong>Profession:</strong></th> <td>'.utf8_encode($data['profession']).   '</td>   
																					</tr>
																					<tr>
																						<th><strong>email:</strong> </th><td><a href="mailto:'.utf8_encode($data['email']).'">'.utf8_encode($data['email']).   '</a> </td>
																					</tr>
																					<tr>
																						<th><strong>Telephone:</strong></th> <td>'.utf8_encode($data['telephone']).   '</td>   
																					</tr>
																					<tr>
																						<th><strong>Bureau:</strong> </th><td>'.utf8_encode($data['bureau']).'</td>
																					</tr>
																					<tr>
																						<th><strong>Site web:</strong></th><td><a href = "'.($data['url_site']).'">'.($data['url_site']).   '</a> </td>
																					</tr>
																					<tr>
																						<th><strong>Laboratory:</strong></th><td> '.utf8_encode($data['descripition']).'</td>
																					</tr>
																				</table>
																			</div>
																			<div class="col-md-6"> 
																				<table class="table table-hover">
																					<thead>
																						<tr>
																							<th><strong>Publications:</strong> </th>
																						</tr>
																					</thead>
																					<tbody>';
																							$tab=explode('|', $data['title']);
																							foreach($tab as $title){
																								echo'
																									<tr>
																										<td> '.utf8_encode($title).'</td>
																									</tr>';
																					
																							}
																				echo'</tboby>
																				</table>
																			</div>
																		</div>
																		
																	</div>
																</div>	
															</div>';		
												}
												
										echo'</div>
										
										</div>';
									}
									else echo ' <h3>Pas de resultats à retourner! </h3>';
								?>
				</div>		
			</div>
			<?php include('footer.html')?>
		</div>

	</body>
	
</html>
