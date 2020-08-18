<circuit access="public">
	<!-- the login sets the rights for admin -->
	<fuseaction name="login">
		<do action="m_admin.login" />
		<if condition="Session.login EQ TRUE">
		<true>
			<do action="admin.showSurveys" />
		</true>
		<false>
			<set name="Error" value="The username/password is incorrect!" />
			<do action="admin.showLogin" />
		</false>
		</if>
	</fuseaction>
	
	<!-- this is the logout logic -->
	<fuseaction name="logout">
		<do action="m_admin.logout"/>
		<do action="v_admin.showLogin"/>
	</fuseaction>
	
	<!-- show login page -->
	<fuseaction name="showlogin">
		<do action="v_admin.showLogin"/>
	</fuseaction>	
	
	<fuseaction name="surveyResults">
		<do action="m_admin.getResults"/>
		<do action="v_admin.surveyResults"/>
	</fuseaction>
	
	<fuseaction name="generateLink">
		<do action="v_admin.generateLink"/>
	</fuseaction>
	
	<!-- show the survey list / session dependent on level 4 being set -->
	<fuseaction name="showsurveys" permissions="level4">
		<invoke object="application.surveyManager" methodcall="getSurveys()" returnVariable="getSurveys" />
		
		<do action="v_admin.showSurveys"/>
	</fuseaction>
	
	<!-- save of a survey -->
	<fuseaction name="saveSurvey" permissions="level4">

		<invoke object="application.surveymanager" methodcall="saveSurvey(
		survey_id=attributes.survey_id,
		survey_title=attributes.survey_title,
		survey_description=attributes.survey_description,
		survey_end_date=attributes.survey_end_date,
		survey_active=attributes.survey_active,
		survey_date=attributes.survey_date)" returnvariable="survey_id"/>
		
		<invoke object="application.surveymanager" methodcall="saveText(survey_id=variables.survey_id,text='survey_begining_text',text_value=attributes.begining_text)" />
		<invoke object="application.surveymanager" methodcall="saveText(survey_id=variables.survey_id,text='survey_end_text',text_value=attributes.end_text)" />
		
		<do action="admin.showSurveys" />
	</fuseaction>	
	
	<!-- edit a survey -->
	<fuseaction name="editSurvey" permissions="level4">
		<set name="attributes.survey_id" value="0" overwrite="false" />
		<invoke object="application.styleManager" methodcall="getSurveyCSS()" returnVariable="getCSS" />
		<invoke object="application.surveyManager" methodcall="getSurveys(attributes.survey_id)" returnVariable="getSurvey" />
		
		<invoke object="application.surveymanager" methodcall="getText(survey_id=attributes.survey_id,text='survey_begining_text')" returnVariable="begining_text"/>
		<invoke object="application.surveymanager" methodcall="getText(survey_id=attributes.survey_id,text='survey_end_text')" returnVariable="end_text"/>

		<do action="v_admin.editSurvey"/>
	</fuseaction>

	<!-- this is the fuseaction that deletes a survey -->
	<fuseaction name="deleteSurvey">
		<invoke object="application.surveymanager" methodcall="deleteSurvey(attributes.survey_id)" />
		
		<do action="admin.showSurveys" />
	</fuseaction>

	<!-- call the survey manager and get the questions -->
	<fuseaction name="showQuestions" permissions="level4">
		<invoke object="application.surveymanager" methodcall="getQuestions(survey_id=attributes.survey_id)" returnvariable="surveyQuestions"/>
		
		<do action="v_admin.showQuestions"/>
	</fuseaction>
	
	<!-- call the survey manager and get the current question. -->
	<fuseaction name="editQuestion" permissions="level4">
		<set name="attributes.survey_question_id" value="0" overwrite="false" />
		
		<invoke object="application.surveymanager" methodcall="getQuestions(survey_id=attributes.survey_id,survey_question_id=attributes.survey_question_id)" returnvariable="surveyQuestion" />
		<invoke object="application.surveymanager" methodcall="getQuestionTypes()" returnvariable="questionTypes"/>
		
		<do action="v_admin.editQuestion"/>		
	</fuseaction>
	
	<!-- this is the question save call back to show questions -->
	<fuseaction name="saveQuestion" permissions="level4">
		<set name="attributes.survey_question_id" value="" overwrite="false" />
		
		<invoke object="application.surveymanager" methodcall="saveQuestion(
		survey_id=attributes.survey_id,
		survey_question_id=attributes.survey_question_id,
		survey_question_order=attributes.survey_question_order,
		survey_type_id=attributes.survey_type_id,
		survey_allow_text=attributes.survey_allow_text,
		survey_question=attributes.survey_question,
		survey_text_question=attributes.survey_text_question)"/>
		
		<do action="admin.showQuestions"/>
	</fuseaction>
	
	<!-- this is the delete question values -->
	<fuseaction name="deleteQuestion" permissions="level4">
		<invoke object="application.surveymanager" methodcall="deleteQuestion(attributes.survey_question_id)"/>
		
		<do action="admin.showQuestions"/>
	</fuseaction>
	
		<!-- this will show the question values -->
	<fuseaction name="showQuestionValues">
		<set name="attributes.survey_option_values_id" value="" overwrite="false" />
		<invoke object="application.surveymanager" methodcall="getQuestionValues(
			survey_question_id=attributes.survey_question_id,
			survey_option_vaules_id=attributes.survey_option_values_id)" 
			returnvariable="getOptionValues"/>
		
		<do action="m_admin.showQuestionValues"/>
		<do action="v_admin.showQuestionValues"/>
	</fuseaction>
	
	<!-- this will show the one questions value and allow edit of it -->
	<fuseaction name="editQuestionValues">
		<set name="attributes.survey_option_values_id" value="" overwrite="false" />
	
		<invoke object="application.surveymanager" methodcall="getQuestionValues(
			survey_question_id=attributes.survey_question_id,
			survey_option_values_id=attributes.survey_option_values_id)" 
			returnvariable="getOptionValue"/>

		<do action="v_admin.editQuestionValues"/>
	</fuseaction>
	
	<!-- this will allow for the save of a question value -->
	<fuseaction name="saveQuestionValue">
		<set name="attributes.survey_option_values_id" value="" overwrite="false" />
		
		<invoke object="application.surveymanager" methodcall="saveQuestionValue(
			survey_option_values_id=attributes.survey_option_values_id,
			survey_question_id=attributes.survey_question_id,
			suvery_values_disp=attributes.suvery_values_disp,
			survey_values_value=attributes.survey_values_value,
			survey_option_order=attributes.survey_option_order)"/>
	
		<do action="admin.showQuestionValues"/>
	</fuseaction>
	
	<!-- this will remove the quesiton value / for one question at a time -->
	<fuseaction name="deleteQuestionValues">
		<invoke object="application.surveymanager" methodcall="deleteQuestionValue(attributes.survey_option_values_id)" />

		<do action="admin.showQuestionValues"/>
	</fuseaction>
	
</circuit>