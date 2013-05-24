<cfcomponent output="no">
	<cfscript>

	function prefuseaction(myFusebox, event){}

	function postfuseaction(myFusebox, event){
		myFusebox.do( action="layouts.dsp_deptheader", contentvariable="depthead" );
		myFusebox.do( action="layouts.lay_singlebody");
	}
	
	function welcome(myFusebox, event){
		event.setValue( "variable.pageTitle", "Welcome" );
		myFusebox.do( action="v_general.dsp_hello", contentvariable="body", append="true" );
	}
	
	function error(myFusebox, event){
		event.setValue( "pageTitle", "Error Page" );
		event.xfa( "admin", "admin.start" ); // redundant- set in the Application.cfc, but is included as an xfa example
		myFusebox.do( action="v_general.dsp_error", contentvariable="body", append="true" );
	}

	</cfscript>
</cfcomponent>
