<!---
<fusedoc
	fuse="login.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will set the session variables and permissions level.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 10, 2005"
		email="theoracleprodigy@yahoo.com"
		role="architect">
	</properties>
	<io>
		<in>
			<number name="survey_type_id" precision="integer"/>
			<string name="username" scope="attributes" />
			<string name="password" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif attributes.username eq "administrator" and attributes.password eq "changeme">

	<cflock type="exclusive" scope="session" timeout="10">
		<cfset session.login = "true">
		<cfset session.permissions = "level4">
	</cflock>
</cfif>
