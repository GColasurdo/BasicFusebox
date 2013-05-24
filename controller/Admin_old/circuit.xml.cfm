<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE circuit>
	<!--
	Only the controller circuit has public access - the controller circuit
	contains all of the fuseactions that are used in links and form posts
	within your application.
	-->
<circuit access="public" xmlns:cf="cf/">

	<prefuseaction>
		<do action="m_security.act_checksignin" />
		<xfa name="signout" value="admin.signout" />
		<xfa name="settings" value="admin.settings" />
		<xfa name="errortest" value="admin.errortest" />
	</prefuseaction>

	<postfuseaction>
		<do action="layouts.dsp_deptheader" contentvariable="depthead" />
		<do action="layouts.dsp_adminside" contentvariable="side" />
		<do action="layouts.lay_bodyandnav" />
	</postfuseaction>

	<fuseaction name="start">
		<set name="pagetitle" value="Adminstrative Home" />
		<do action="v_admin.dsp_adminmenu" contentvariable="body" append="true" />
	</fuseaction>

	<fuseaction name="signout">
		<set name="pagetitle" value="Adminstrative Sign Out" />
		<do action="m_security.act_signout" />
		<do action="v_security.dsp_signout" contentvariable="body" append="true" />
	</fuseaction>

	<!-- hide these circuit when in production -->
	<fuseaction name="errortest">
		<set name="pagetitle" value="Adminstrative Error" />
		<do action="v_admin.dsp_errortest" contentvariable="body" append="true" />
	</fuseaction>

	<fuseaction name="settings">
		<set name="pagetitle" value="Application Information" />
		<do action="v_admin.dsp_settings" contentvariable="body" append="true" />
	</fuseaction>

</circuit>