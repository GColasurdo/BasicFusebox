<!--- Quick note: the cookie and the registered appname should not be the same as the this.name created in the Application.cfc --->
<cfif NOT IsDefined("cookie.HSCNewApp") OR Len(evaluate("cookie.HSCNewApp")) EQ 0>
	<!--- is not signed in --->
	<cflocation url="https://hscssl.unm.edu/login/index.cfm?act=app.login&appname=HSCNewApp" addtoken="no">
<cfelse>
	<!--- is signed in and optionally check/populate some local user information --->
	<cfif NOT isDefined('variable.cn') or Len(variable.cn) EQ 0>
		<!--- decrypt --->
		<cffile action="read" file="e:\keys\key.cfm" variable="thekey">
		<cfset variable.clearcookie = decrypt(evaluate("cookie.HSCNewApp"), thekey, 'AES/CBC/PKCS5Padding', 'base64')>
		
		<!--- optional: populate some variables --->
		<cfset variable.dn=ListGetAt(Evaluate("variable.clearcookie"), ListFindNoCase(Evaluate("variable.clearcookie"), 'dn',':') + 1,':')>
		<cfset variable.cn = ListLast(ListGetAt(variable.dn,ListFindNoCase(variable.dn,'cn','='),','),'=')>
		<cfparam name="variable.FirstName" default="#ListGetAt(Evaluate("variable.clearcookie"), ListFindNoCase(Evaluate("variable.clearcookie"), 'givenName',':')+ 1,':')#">
		<cfparam name="variable.LastName" default="#ListGetAt(Evaluate("variable.clearcookie"), ListFindNoCase(Evaluate("variable.clearcookie"), 'sn',':') + 1,':')#">
	</cfif>
	
	<!--- optional: check for user in your local database and populate your own cookies and session variables --->
    <!---<cfparam name="SID" default="0">
    <cfif isDefined('SID') OR SID EQ 0>
        <cfquery name="studentStatus" datasource="#dsn#" dbtype="datasource" blockfactor="100">
        SELECT	StudentID, StudentLast, StudentFirst, UNMNetID, HSCNetID, PAStudent, CreationDate,StudentEvalID,EvaluationID,StartDate,CompleteDate
        FROM	StudentEvaluationRecords
        WHERE	HSCNetID = '#cn#'
        </cfquery>

        <cfif studentStatus.recordCount EQ 1>
            <cfset SID = #studentStatus.StudentID#>
        </cfif>
    </cfif>--->
</cfif>