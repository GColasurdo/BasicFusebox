<h2>Hello Problem</h2>
<cftry>
    <cfquery name="something" datasource="#variable.DSN#2" dbtype="ODBC">SELECT * FROM applications2</cfquery>
    <cfcatch type="any">
		<h3>Oh No, A <cfoutput>#cfcatch.Type#</cfoutput> Error!</h3>
		<hr>
		<cfoutput><p>#cfcatch.Message#</p><p>#cfcatch.Detail#</p></cfoutput>
        <!--- 
		<hr>
        <h4>More Details from the transaction:</h4>
        <cfdump var="#form#">
		 --->
    </cfcatch>
</cftry>