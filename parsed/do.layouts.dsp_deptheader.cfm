<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: layouts --->
<!--- fuseaction: dsp_deptheader --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "layouts">
<cfset myFusebox.thisFuseaction = "dsp_deptheader">
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/prefuseaction.cfm")><cfoutput><cfinclude template="../layouts/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/dsp_deptheader.cfm")><cfoutput><cfinclude template="../layouts/dsp_deptheader.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of dsp_deptheader which is not defined in Circuit layouts."></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/postfuseaction.cfm")><cfoutput><cfinclude template="../layouts/postfuseaction.cfm" /></cfoutput></cfif>

