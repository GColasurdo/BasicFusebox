<div class="well sidebar-nav">
	<p><cfoutput>Welcome #variable.FirstName# #variable.LastName#<br>(#variable.cn#)</cfoutput></p>
    <ul class="nav nav-list">
    <cfoutput>
        <li <cfif MyFusebox.OriginalFuseAction EQ "start">class="active"</cfif>><a href="index.cfm?do=#xfa.admin#">Admin Home</a></li>
        <li <cfif MyFusebox.OriginalFuseAction EQ "settings">class="active"</cfif>><a href="index.cfm?do=#xfa.settings#">Application Settings</a></li>
        <li <cfif MyFusebox.OriginalFuseAction EQ "errortest">class="active"</cfif>><a href="index.cfm?do=#xfa.errortest#">Application Error</a></li>
        <br>
        <cfif MyFusebox.OriginalFuseAction NEQ "signout"><li><a href="index.cfm?do=#xfa.signout#">Sign Out</a></li></cfif>
        <li><a href="index.cfm?do=#xfa.home#">App Home</a></li>
    </cfoutput>
    </ul>
</div>