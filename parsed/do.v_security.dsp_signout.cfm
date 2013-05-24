<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: v_security --->
<!--- fuseaction: dsp_signout --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "v_security">
<cfset myFusebox.thisFuseaction = "dsp_signout">
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_security/prefuseaction.cfm")><cfoutput><cfinclude template="../view/v_security/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_security/dsp_signout.cfm")><cfoutput><cfinclude template="../view/v_security/dsp_signout.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of dsp_signout which is not defined in Circuit v_security."></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_security/postfuseaction.cfm")><cfoutput><cfinclude template="../view/v_security/postfuseaction.cfm" /></cfoutput></cfif>

