<?php
require('treatment.php');

?>


<!DOCTYPE html>
<html>

	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="bootstrap-3.3.6-dist\bootstrap-3.3.6-dist\css\bootstrap.min.css">
		<link rel="stylesheet" href="bootstrap-3.3.6-dist\bootstrap-3.3.6-dist\css\bootstrap-theme.min.css">
		<script src="http://code.jquery.com/jquery-latest.js"></script><!-- Bootstrap javascript requires Jquery -->
		<script src="bootstrap-3.3.6-dist/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="webSite.css">
	</head>
		
	<body>
		
		<div class="container" id ="container">		
			<?php 
				include('header.html')
			?>
			<div class="row" id="page-content3">
				<div class="col-md-12">
					<?php
						include('contact.html')
					?>
				</div>
			</div>
			<?php
				include('footer.html')
			?>
		</div>

	</body>
	
</html>
