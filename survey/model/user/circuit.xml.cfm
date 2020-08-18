<!-- this is the user model -->
<circuit access="internal">

	<fuseaction name="globals">
		<include template="globalUserFunctions.cfm"/>
	</fuseaction>
	
	<fuseaction name="initSurvey">
		<include template="initSurvey.cfm"/>
	</fuseaction>
	
	<fuseaction name="nextQuestion">
		<include template="nextQuestion.cfm"/>
		<include template="saveQuestion.cfm"/>
	</fuseaction>

	<fuseaction name="saveQuestion">
		<include template="saveQuestion.cfm"/>
	</fuseaction>
</circuit>