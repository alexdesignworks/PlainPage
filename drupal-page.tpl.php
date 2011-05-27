<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<!-- Conditional html tag classes. As seen at http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither -->
<!--[if lt IE 7 ]> <html xmlns="http://www.w3.org/1999/xhtml" class="ie6" lang="en" xml:lang="en"> <![endif]-->
<!--[if IE 7 ]> <html xmlns="http://www.w3.org/1999/xhtml" class="ie7" lang="en" xml:lang="en"> <![endif]-->
<!--[if IE 8 ]> <html xmlns="http://www.w3.org/1999/xhtml" class="ie8" lang="en" xml:lang="en"> <![endif]-->
<!--[if IE 9 ]> <html xmlns="http://www.w3.org/1999/xhtml" class="ie9" lang="en" xml:lang="en"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
  <title><?php print $head_title ?></title>
  
  <?php print $head ?> 
  
  <?php print $scripts ?>	 <!-- need to inject  selectivizr -->
  <!--[if (gte IE 6)&(lte IE 8)]>
  <script type="text/javascript" src="js/selectivizr.js"></script>  
  <![endif]-->     
  <script type="text/javascript"><?php /* Needed to avoid Flash of Unstyle Content in IE */ ?> </script>	
  <?php print $styles ?>	  

</head>
<body>
	<div id="pagewrap">
		Main content
		<div class="footer_blank"> </div>
	</div><!-- .wrap -->

	<div id="footer">
		Footer content
		<div class="clearfix"></div>
	</div><!-- #footer -->
</body>
</html>