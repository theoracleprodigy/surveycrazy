<cflock type="exclusive" scope="session" timeout="10">
	<cfset session.login = "false">
	<cfset session.permissions = "[none]">
</cflock>