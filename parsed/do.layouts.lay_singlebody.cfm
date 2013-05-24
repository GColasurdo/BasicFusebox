<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: layouts --->
<!--- fuseaction: lay_singlebody --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "layouts">
<cfset myFusebox.thisFuseaction = "lay_singlebody">
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/prefuseaction.cfm")><cfoutput><cfinclude template="../layouts/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/lay_singlebody.cfm")><cfoutput><cfinclude template="../layouts/lay_singlebody.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of lay_singlebody which is not defined in Circuit layouts."></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/postfuseaction.cfm")><cfoutput><cfinclude template="../layouts/postfuseaction.cfm" /></cfoutput></cfif>

