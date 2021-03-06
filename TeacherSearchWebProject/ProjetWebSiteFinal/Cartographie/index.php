<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8 />
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, minimal-ui">

<title>Cartographie</title>
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">-->
  <link href="style/style.css" rel="stylesheet">
</head>
<body>
  <div id="cy"></div>
  <div id="loading">
    <span class="fa fa-refresh fa-spin"></span>
  </div>
  
  <div id="search-wrapper">
    <input type="text" class="form-control" id="search"  value="">
	<input style="display:none;" id="searchdefault"  value="<?php echo $_GET['requete'];?>">
  </div>
  
  <div id="info">
  </div>

  <script src="http://cdnjs.cloudflare.com/ajax/libs/fastclick/1.0.3/fastclick.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  
  <script src="http://cytoscape.github.io/cytoscape.js/api/cytoscape.js-latest/cytoscape.min.js"></script>
  <!--<script src="../cytoscape.js/build/cytoscape.js"></script>-->
  
  <script src="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.js"></script>
  <link href="http://cdnjs.cloudflare.com/ajax/libs/qtip2/2.2.0/jquery.qtip.min.css" rel="stylesheet" type="text/css" />
  <script src="https://cdn.rawgit.com/cytoscape/cytoscape.js-qtip/2.2.3/cytoscape-qtip.js"></script>
  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.2/handlebars.min.js"></script>
  <script src="cartographie.js"></script>
  
  <button id="reset" class="btn btn-default"><i class="fa fa-arrows-h"></i></button>
  <div id="legende">
      <img src="legende.jpg" width="250" height="130">
  </div>
</body>
</html>

