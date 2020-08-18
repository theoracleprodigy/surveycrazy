<!---
<fusedoc
	fuse="showlogin.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will show the login page.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 10, 2005"
		email="jonathan.powell@auguste.com"
		role="architect">
	</properties>
	<io>
		<in>
			<string name="error" scope="variables" />
		</in>
		<out>
			<string name="username" scope="form" />
			<string name="password" scope="form" />
		</out>
	</io>
</fusedoc>
--->

<div id="main">
	<form name="login" method="post" action="<cfoutput>#myself##xfa.login#</cfoutput>">
		<h2>Administration Area.</h2><br>
		<div id="error"><cfoutput>#error#</cfoutput></div>
		<label for="username">Username:</label> <input type="text" size="23" name="username"><br>
		<label for="password">Password:</label> <input type="password" size="25" name="password"><br><br><br>
		<input type="Submit" name="Submit" value="Submit">
	</form>
</div>

