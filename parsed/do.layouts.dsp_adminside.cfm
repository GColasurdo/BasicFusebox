<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: layouts --->
<!--- fuseaction: dsp_adminside --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "layouts">
<cfset myFusebox.thisFuseaction = "dsp_adminside">
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/prefuseaction.cfm")><cfoutput><cfinclude template="../layouts/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/dsp_adminside.cfm")><cfoutput><cfinclude template="../layouts/dsp_adminside.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of dsp_adminside which is not defined in Circuit layouts."></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../layouts/postfuseaction.cfm")><cfoutput><cfinclude template="../layouts/postfuseaction.cfm" /></cfoutput></cfif>

