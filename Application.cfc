<cfcomponent extends="fusebox5.Application" output="false">

    <!--- set application name based on the directory path --->
	<cfset this.name = right(REReplace(getDirectoryFromPath(getCurrentTemplatePath()),'[^A-Za-z]','','all'),64) />

	<!--- for session & client management --->
    <cfset this.sessionmanagement = true />
	<!--- <cfset this.sessiontimeout = CreateTimeSpan(0,0,20,0) /> --->
	<!--- <cfset this.setclientcookies = true /> --->
    <!--- <cfset this.setdomaincookies = false /> --->
	<!--- <cfset this.clientmanagement = false /> --->

	<!--- Data Source Names --->
    <cfset variable.DSN = "HSCAppUniversal" />

	<!--- fusebox parameters --->
	<cfscript>
	// to enable implicit (no-XML) mode set to true
	FUSEBOX_PARAMETERS.allowImplicitFusebox = true;
	FUSEBOX_PARAMETERS.allowImplicitCircuits = true;
	// default seettings
	FUSEBOX_PARAMETERS.defaultFuseaction = "app.welcome";
	FUSEBOX_PARAMETERS.fuseactionVariable = "do";
	// you may want to change this to "development-full-load" mode or "developement-circuit-load" or "production"
	FUSEBOX_PARAMETERS.mode = "development-full-load";
	FUSEBOX_PARAMETERS.conditionalParse = true;
	// change this to something more secure:
	FUSEBOX_PARAMETERS.password = "skeleton";
	FUSEBOX_PARAMETERS.debug = false;
	// we use the core file error templates:
	FUSEBOX_PARAMETERS.errortemplatesPath = "/fusebox5/errortemplates/";

	// These are all default values that can be overridden:
	// FUSEBOX_PARAMETERS.precedenceFormOrUrl = "form";
	// FUSEBOX_PARAMETERS.scriptFileDelimiter = "cfm";
	// FUSEBOX_PARAMETERS.maskedFileDelimiters = "htm,html,cfm,cfml,php,php4,asp,aspx";
	// FUSEBOX_PARAMETERS.characterEncoding = "utf-8";
	// FUSEBOX_PARAMETERS.strictMode = false;

	// force the directory in which we start to ensure CFC initialization works:
	FUSEBOX_CALLER_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	//FUSEBOX_APPLICATION_KEY = "HSC New App";
	</cfscript>

	<cffunction name="onApplicationStart" 
		returntype="boolean" 
		output="false" 
		access="public" 
		hint="I am executed when the application starts">

		<cfreturn true />
	</cffunction>

	<cffunction name="onFuseboxApplicationStart">
		<cfset super.onFuseboxApplicationStart() />
	</cffunction>

	<cffunction name="onRequestStart" 
		returntype="boolean" 
		output="false" 
		access="public" 
		hint="I am executed at the start of each request">
		<cfargument name="targetPage" type="string" required="true" />

		<cfset super.onRequestStart(arguments.targetPage) />

		<!--- Paths --->
		<cfset self = myFusebox.getSelf() />
		<cfset myself = myFusebox.getMyself() />

		<!--- layout template content variables --->
		<cfparam name="pageTitle" default="HSC App in Development">
		<cfparam name="jplugins" default="">
		<cfparam name="readycode" default="">
		<cfparam name="scripts" default="">
        <cfparam name="side" default="">
		<cfparam name="body" default="">

		<!--- global xfas --->
		<cfparam name="xfa.home" default="app.welcome">
        <cfparam name="xfa.admin" default="admin.start">

		<!--- cfc, udfs and other objects --->

		<!--- trap non-index.cfm requests --->
        <cfif right(cgi.script_name, len("index.cfm")) neq "index.cfm" and right(cgi.script_name, 3) neq "cfc">
            <cflocation url="#self#" addtoken="false" />
        </cfif>

		<cfreturn true />	
	</cffunction>

	<cffunction name="onRequestEnd" 
		returntype="void" 
		output="true" 
		access="public" 
		hint="I am executed when all pages in the request have finished processing">
		<cfargument name="targetPage" type="string" required="true" />

		<!--- pass request to Fusebox. --->
		<cfset super.onRequestEnd(arguments.targetPage) />
	</cffunction>

    <cffunction name="onError"
    	returnType="void"
        output="true">
        <cfargument name="exception" required="true">
        <cfargument name="eventname" type="string" required="true">
        
        <cfset var errortext = "">

		<!--- Sends to an error log with an application's name rather than lumped into application.log --->
        <cflog file="HSC_App_Errorlog" text="#arguments.exception.rootcause.message# #arguments.exception.rootcause.detail#">
        
        <!--- Create full error message --->
        <cfsavecontent variable="errortext">
        <cfoutput>
        <p>An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br />
        Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#</p>
        <p>#arguments.exception.rootcause.message#<br>#arguments.exception.rootcause.detail#</p>
        
        <cfif IsDefined('arguments.exception.rootcause.sql')>
        <p>#arguments.exception.rootcause.sql#</p>
        </cfif>
        
        <cfdump var="#arguments.exception#" label="Error">
        <cfdump var="#form#" label="Form">
        <cfdump var="#url#" label="URL">
        
        </cfoutput>
        </cfsavecontent>
        
        <!--- Optional dump error to the screen while in the dev process --->
        <cfoutput>#errortext#</cfoutput>
        
        <!--- Optional email to the developer alerting them to the error
		<cfmail to="dev_email@salud.unm.edu" from="dev_email@salud.unm.edu" subject="HSC App Error: #arguments.exception.rootcause.message#" type="html">#errortext#</cfmail> --->
        
        <!--- Optional redirect to a nicer error message for the user
        <cflocation url="index.cfm?do=app.error" addtoken="no"> --->
    </cffunction>

</cfcomponent>