<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: admin --->
<!--- fuseaction: start --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "admin">
<cfset myFusebox.thisFuseaction = "start">
<cfparam name="__fuseboxCircuitCfc_HSC_New_App_controller_admin" default="#createObject('component','HSC_New_App.controller.admin')#" />
<cfif structKeyExists(__fuseboxCircuitCfc_HSC_New_App_controller_admin,"prefuseaction") and isCustomFunction(__fuseboxCircuitCfc_HSC_New_App_controller_admin.prefuseaction)>
<cfset __fuseboxCircuitCfc_HSC_New_App_controller_admin.prefuseaction(myFusebox=myFusebox,event=event) />
</cfif>
<cfif structKeyExists(__fuseboxCircuitCfc_HSC_New_App_controller_admin,"start") and isCustomFunction(__fuseboxCircuitCfc_HSC_New_App_controller_admin.start)>
<cfset __fuseboxCircuitCfc_HSC_New_App_controller_admin.start(myFusebox=myFusebox,event=event) />
<cfelse><cfthrow type="fusebox.undefinedFuseaction" message="undefined Fuseaction" detail="You specified a Fuseaction of start which is not defined in Circuit admin.">
</cfif>
<cfif structKeyExists(__fuseboxCircuitCfc_HSC_New_App_controller_admin,"postfuseaction") and isCustomFunction(__fuseboxCircuitCfc_HSC_New_App_controller_admin.postfuseaction)>
<cfset __fuseboxCircuitCfc_HSC_New_App_controller_admin.postfuseaction(myFusebox=myFusebox,event=event) />
</cfif>
<cfcatch><cfrethrow></cfcatch>
</cftry>

