<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: v_admin --->
<!--- fuseaction: dsp_adminmenu --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "v_admin">
<cfset myFusebox.thisFuseaction = "dsp_adminmenu">
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_admin/prefuseaction.cfm")><cfoutput><cfinclude template="../view/v_admin/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_admin/dsp_adminmenu.cfm")><cfoutput><cfinclude template="../view/v_admin/dsp_adminmenu.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of dsp_adminmenu which is not defined in Circuit v_admin."></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_admin/postfuseaction.cfm")><cfoutput><cfinclude template="../view/v_admin/postfuseaction.cfm" /></cfoutput></cfif>

