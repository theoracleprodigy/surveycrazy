<!-- this is the user views -->
<circuit access="internal">

	<fuseaction name="activeSurveys">
		<xfa name="initSurvey" value="user.initSurvey"/>
		
		<include template="activeSurveys.cfm"/>
	</fuseaction>	
	
	<fuseaction name="startSurvey">
		<xfa name="nextQuestion" value="user.nextQuestion"/>
		
		<include template="startSurvey.cfm"/>
	</fuseaction>

	<fuseaction name="nextQuestion">
		<xfa name="nextQuestion" value="user.nextQuestion"/>
		<xfa name="endSurvey" value="user.endSurvey"/>
		
		<include template="nextQuestion.cfm"/>
	</fuseaction>
	
	<fuseaction name="endSurvey">
	
		<include template="endSurvey.cfm"/>
	</fuseaction>
	
</circuit>

