<!---
<fusedoc
	fuse="getResults.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will return the results for a survey.  Also it will have a function for use on the view for a query of queries.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 18, 2005"
		email="jonathan.powell@auguste.com"
		role="architect">
	</properties>
	<io>
		<in>
			<number name="survey_id" />
		</in>
		<out>
			<recordset name="qry_getDetails" scope="variables">
				<string name="survey_title" />
				<string name="survey_description" />
				<datetime name="survey_date" />
				<datetime name="survey_end_date" />
			</recordset>
			<recordset name="qry_getResults" scope="variables">
				<string name="survey_question" />
				<string name="survey_text_question" />
				<string name="survey_values_disp" />
				<number name="currentNumber" />
				<number name="survey_question_id" precision="integer" />
			</recordset>
			<recordset name="qry_textQuestions" scope="variables">
				<number name="survey_question_id" />
				<string name="survey_textarea"  />
			</recordset>
				
			<recordset name="getTextResults" scope="variables">
				<string name="survey_textarea" scope="variables" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->
<cfquery name="qry_getDetails" datasource="#dsn()#">
	SELECT survey_title, survey_description, survey_date, survey_end_date
	FROM survey
	WHERE survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.survey_id#">
</cfquery>
<!--- 
<cfquery name="qry_getResults" datasource="#dsn()#">
	SELECT survey_questions.survey_question, survey_option_values.survey_values_disp, 
	survey_results.survey_value AS currentNumber, survey_questions.survey_text_question,
	survey_questions.survey_question_id, survey_question_type.survey_type_id
	FROM survey_questions, survey_option_values, survey_results, survey_question_type
	WHERE survey_questions.survey_question_id = survey_option_values.survey_question_id
	AND survey_questions.survey_type_id = survey_question_type.survey_type_id
	AND survey_option_values.survey_option_values_id = survey_results.survey_option_values_id
	AND survey_questions.survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.survey_id#" />
	ORDER BY survey_questions.survey_question_order, survey_questions.survey_question, survey_option_values.survey_values_disp
</cfquery>
 --->
<cfquery name="qry_getResults" datasource="#dsn()#">
	SELECT survey_questions.survey_question, survey_option_values.survey_values_disp, 
	count(survey_results.survey_value) AS currentNumber, 
	(count(survey_results.survey_value)*100 / totalCount.currentCount) as percentage, 
	totalCount.currentCount,
	survey_questions.survey_text_question,
	survey_questions.survey_question_id
	FROM survey_questions, survey_option_values, survey_results, survey_question_type, 
		(SELECT count(survey_question_id) as currentCount, survey_question_id 
		FROM survey_results 
		GROUP BY survey_question_id) as totalCount
	WHERE survey_questions.survey_question_id = survey_option_values.survey_question_id
	AND survey_questions.survey_type_id = survey_question_type.survey_type_id
	AND survey_option_values.survey_option_values_id = survey_results.survey_option_values_id
	AND totalCount.survey_question_id = survey_questions.survey_question_id
	AND survey_questions.survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.survey_id#" />
	GROUP BY survey_questions.survey_question_order, survey_questions.survey_question, survey_option_values.survey_values_disp, survey_questions.survey_text_question, survey_questions.survey_question_id,
	totalCount.currentCount
</cfquery>

<cfquery name="qry_textQuestions" datasource="#dsn()#">
	SELECT survey_results.survey_question_id, survey_results.survey_textarea
	FROM survey_results, survey_questions
	WHERE survey_questions.survey_question_id = survey_results.survey_question_id
	AND survey_questions.survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.survey_id#" />
</cfquery>

<cffunction name="getTextResults" access="public" returntype="query">
	<cfargument name="survey_question_id" required="yes" />
	
	<cfquery name="qry_getText" dbtype="query">
		SELECT survey_textarea
		FROM qry_textQuestions
		WHERE survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#" />
	</cfquery>

	<cfreturn qry_getText />
</cffunction>
