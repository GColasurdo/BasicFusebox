<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><cfoutput>#pageTitle# | Health Sciences Center | The University of New Mexico</cfoutput></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="copyright" content="Design and Layout Copyright 2008 University of New Mexico" />
    <meta name="author" content="HSLIC Web Team">
    <link rel="shortcut icon" href="/favicon.ico">

    <!-- Style Sheets -->
    <link href="includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="includes/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="includes/css/localstyle.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->
  </head>

  <body>
	<cfinclude template="/_includes/dsp_unmheader.html">
    <div class="container-fluid">
		<cfoutput>#depthead#</cfoutput>
		<cfoutput>#body#</cfoutput>
        <cfinclude template="/_includes/dsp_unmfooter.html">
    </div>

    <!-- Javascript -->
    <script src="includes/scripts/jquery-1.9.1.min.js"></script>
    <script src="includes/scripts/bootstrap.min.js"></script>
    <cfif Len(jplugins)><cfoutput>#jplugins#</cfoutput></cfif>
	<cfif Len(readyCode)><script type="text/javascript">
		$(document).ready(function(){
			<cfoutput>#readycode#</cfoutput>
		});	
	</script></cfif>
  </body>
</html>
