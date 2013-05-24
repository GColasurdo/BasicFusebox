<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: v_general --->
<!--- fuseaction: dsp_hello --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "v_general">
<cfset myFusebox.thisFuseaction = "dsp_hello">
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_general/prefuseaction.cfm")><cfoutput><cfinclude template="../view/v_general/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_general/dsp_hello.cfm")><cfoutput><cfinclude template="../view/v_general/dsp_hello.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of dsp_hello which is not defined in Circuit v_general."></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../view/v_general/postfuseaction.cfm")><cfoutput><cfinclude template="../view/v_general/postfuseaction.cfm" /></cfoutput></cfif>

