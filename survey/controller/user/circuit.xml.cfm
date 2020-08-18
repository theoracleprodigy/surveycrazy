<!-- this is the user public controller -->
<circuit access="public">

	<!-- this is the global user fuse actions -->
	<prefuseaction name="globals">
		<do action="m_user.globals"/>		
	</prefuseaction>
	
	<!-- get all the active surveys and then display them for the user -->
	<fuseaction name="activeSurveys">
		<invoke object="application.customerSurveyManager" methodcall="getActiveSurveys()" returnVariable="activeSurveys"/>
	
		<do action="v_user.activeSurveys"/>
	</fuseaction>	
	
	<!-- start the survey / relocates to the next question fuse to keep the session variables from asigning a new customer_id -->
	<fuseaction name="initSurvey">
		<set name="error" value="" overwrite="False"/>
		<do action="m_user.initSurvey"/>
		
		<if condition="variables.initSurvey EQ TRUE">
		<true>
			<relocate url="#myself#user.startSurvey&amp;survey_id=#attributes.survey_id#" type="client" addtoken="false" />
		</true>
		<false>
			<relocate url="#myself#user.activeSurveys&amp;error=#error#" type="client" addtoken="false" />
		</false>
		</if>
	</fuseaction>
	
	<!-- this will bring up the first display page. -->
	<fuseaction name="startSurvey">
		<set name="instantiated" value="#setupSurvey(attributes.survey_id)#" overwrite="True"/>
		<invoke object="application.surveyManager" methodcall="getText(survey_id=attributes.survey_id,text='survey_begining_text')" returnVariable="surveyBeginingText"/>
		
		<do action="v_user.startSurvey"/>
	</fuseaction>
	
	<!-- move to the next question / the current question is reqired -->
	<fuseaction name="nextQuestion">
		<do action="m_user.nextQuestion"/>
		<do action="v_user.nextQuestion"/>
	</fuseaction>
	
	<fuseaction name="endSurvey">
		<invoke object="application.surveyManager" methodcall="getText(survey_id=attributes.survey_id,text='survey_end_text')" returnVariable="surveyEndText"/>
	
		<do action="m_user.saveQuestion"/>
		<do action="v_user.endSurvey"/>
	</fuseaction>
</circuit>