<cfcomponent>
	<cfscript>

	function prefuseaction(myFusebox, event){
		myFusebox.do( action="m_security.act_checksignin");
		event.xfa( "signout", "admin.signout" );
		event.xfa( "settings", "admin.settings" );
		event.xfa( "errortest", "admin.errortest" );
	}

	function postfuseaction(myFusebox, event){
		myFusebox.do( action="layouts.dsp_deptheader", contentvariable="depthead" );
		myFusebox.do( action="layouts.dsp_adminside", contentvariable="side" );
		myFusebox.do( action="layouts.lay_bodyandnav");
	}

	function start(myFusebox, event){
		event.setValue( "pageTitle", "Adminstrative Home" );
		myFusebox.do( action="v_admin.dsp_adminmenu", contentvariable="body", append="true" );
	}

	function signout(myFusebox, event){
		event.setValue( "pageTitle", "Adminstrative Sign Out" );
		myFusebox.do( action="m_security.act_signout" );
		myFusebox.do( action="v_security.dsp_signout", contentvariable="body", append="true" );
	}

    // hide these circuit when in production
	function errortest(myFusebox, event){
		event.setValue( "pageTitle", "Adminstrative Error" );
		myFusebox.do( action="v_admin.dsp_errortest", contentvariable="body", append="true" );
	}

	function settings(myFusebox, event){
		event.setValue( "pageTitle", "Adminstrative Information" );
		myFusebox.do( action="v_admin.dsp_settings", contentvariable="body", append="true" );
	}

	</cfscript>
</cfcomponent>