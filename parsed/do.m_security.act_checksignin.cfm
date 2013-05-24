<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: m_security --->
<!--- fuseaction: act_checksignin --->
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "m_security">
<cfset myFusebox.thisFuseaction = "act_checksignin">
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../model/m_security/prefuseaction.cfm")><cfoutput><cfinclude template="../model/m_security/prefuseaction.cfm" /></cfoutput></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../model/m_security/act_checksignin.cfm")><cfoutput><cfinclude template="../model/m_security/act_checksignin.cfm" /></cfoutput><cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of act_checksignin which is not defined in Circuit m_security."></cfif>
<cfif fileExists("E:/appdev/HSC_New_App/parsed/../model/m_security/postfuseaction.cfm")><cfoutput><cfinclude template="../model/m_security/postfuseaction.cfm" /></cfoutput></cfif>

