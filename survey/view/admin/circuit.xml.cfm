<circuit access="internal">
	
	<!-- set the default fuseactions in the prefuse -->
	<prefuseaction name="Globalxfa">
		<xfa name="editSurvey" value="admin.editSurvey"/>
		<xfa name="showQuestions" value="admin.showQuestions"/>
		<xfa name="deleteSurvey" value="admin.deleteSurvey"/>
		<xfa name="showSurveys" value="admin.showSurveys"/>
		<xfa name="saveSurvey" value="admin.saveSurvey"/>
		<xfa name="editQuestion" value="admin.editQuestion"/>
	</prefuseaction>
		
	<!-- this shows the login screen -->
	<fuseaction name="showLogin">
		<xfa name="login" value="admin.login"/>
		<include template="showLogin.cfm"/>
	</fuseaction>
	
	<!-- this is the list of surveys -->
	<fuseaction name="showSurveys">
		<xfa name="newSurvey" value="admin.editSurvey"/>
		<xfa name="generateLink" value="admin.generateLink"/>
		<xfa name="surveyResults" value="admin.surveyResults"/>
		
		<include template="showSurveys.cfm"/>
	</fuseaction>
	
	<fuseaction name="generateLink">
		<!-- this is the initialize survey link from the user area -->
		<xfa name="initSurvey" value="user.initSurvey"/>
		
		<include template="generateLink.cfm"/>
	</fuseaction>
	
	<fuseaction name="surveyResults">
		<include template="surveyResults.cfm"/>
	</fuseaction>
	
	<!-- this is the page that does the add/edit of a survey -->
	<fuseaction name="editSurvey">	
		<include template="editSurvey.cfm"/>
	</fuseaction>
	
	<!-- this is the questions for the survey -->
	<fuseaction name="showQuestions">
		<xfa name="addQuestion" value="admin.editQuestion"/>
		<xfa name="showQuestionValues" value="admin.showQuestionValues"/>
		<xfa name="deleteQuestion" value="admin.deleteQuestion"/>
		
		<include template="showQuestions.cfm"/>
	</fuseaction>
	
	<!-- this is the new / edit question page -->
	<fuseaction name="editQuestion">
		<xfa name="saveQuestion" value="admin.saveQuestion"/>
	
		<include template="editQuestion.cfm"/>
	</fuseaction>
	
	<!-- this will show the question values -->
	<fuseaction name="showQuestionValues">
		<xfa name="saveQuestion" value="admin.saveQuestion"/>
		<xfa name="editQuestionValues" value="admin.editQuestionValues"/>
		<xfa name="deleteQuestionValues" value="admin.deleteQuestionValues"/>
		
		<include template="showQuestionValues.cfm"/>
	</fuseaction>


	<!-- this is the new / edit question value -->
	<fuseaction name="editQuestionValues">
		<xfa name="saveQuestionValue" value="admin.saveQuestionValue"/>
		
		<include template="editQuestionValues.cfm"/>
	</fuseaction>
	
</circuit>