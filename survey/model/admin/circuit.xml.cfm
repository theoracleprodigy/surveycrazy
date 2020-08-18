<circuit access="internal">

	<fuseaction name="login">
		<include template="login.cfm"/>
	</fuseaction>
	
	<!-- this is the logout logic -->
	<fuseaction name="logout">
		<include template="logout.cfm"/>
	</fuseaction>
	
	<fuseaction name="showQuestionValues">
		<include template="showQuestionValues.cfm"/>
	</fuseaction>
	
	<fuseaction name="getResults">
		<include template="getResults.cfm"/>
	</fuseaction>
	
</circuit>