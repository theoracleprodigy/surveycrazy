<!---
<fusedoc
	fuse="nextQuestion.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will get the current question id from the current question order via a function, 
	then call two methods in a cfc and return two record sets.  This also sets up the next location.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 13, 2005"
		email="jonathan.powell@auguste.com"
		role="architect">
	</properties>
	<io>
		<in>
			<number name="currentQuestion" scope="attributes" precision="integer"/>
		</in>
		<out>
			<recordset name="getCurrentQuestion" scope="variables">
				<number name="survey_id" precision="integer" />
				<number name="survey_question_id" precision="integer" />
				<string name="survey_question" />
				<string name="survey_text_question" />
				<string name="survey_allow_text" />
				<string name="survey_disp" />
				<string name="survey_type_id" />
				<string name="survey_disp_size" />
			</recordset>

			<recordset name="getOptionValues" scope="variables">
				<string name="survey_values_disp"/>
				<string name="survey_values_value"/>			
			</recordset>
		</out>
	</io>
</fusedoc>
--->


<cfset survey_question_id = getCurrentQuestionId(attributes.currentQuestion)/>

<cfset getCurrentQuestion = application.customerSurveyManager.getCurrentQuestion(variables.survey_question_id)>
<cfset getOptionValues = application.customerSurveyManager.getOptionValues(variables.survey_question_id)>

