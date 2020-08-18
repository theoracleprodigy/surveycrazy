<cfcomponent displayname="surveyManager">
	<cfset variables.dsn = createObject("component","datasource").dsn()>
	
	<cffunction name="init" access="public" returntype="surveymanager" output="false">
		<cfreturn this />
	</cffunction>
	
	
	<cffunction name="getSurveys" access="public" returntype="query">
		<cfargument name="survey_id" required="no" default="">
		
		<cfquery name="qry_getSurveys" datasource="#variables.dsn#">
			SELECT survey_id, survey_title, survey_active, survey_date, survey_end_date, survey_description
			FROM survey
			<cfif trim(arguments.survey_id) neq ''>
			WHERE survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
			</cfif>
		</cfquery>
	
		<cfreturn qry_getSurveys>
	</cffunction>
	
	<cffunction name="saveSurvey" access="public" returntype="numeric">
		<cfargument name="survey_title" required="yes">
		<cfargument name="survey_date" required="yes">
		<cfargument name="survey_end_date" required="yes">
		<cfargument name="survey_active" required="yes">
		<cfargument name="survey_id" required="no" default="">
		<cfargument name="survey_description" required="no" default="">
		
		<cfif arguments.survey_id neq ''>
			<cfquery name="qry_updateSurveys" datasource="#variables.dsn#">
				UPDATE survey
				SET survey_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_title#">,
					survey_date = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.survey_date#">,
					survey_end_date = <cfqueryparam cfsqltype="cf_sql_date" value="#arguments.survey_end_date#">,
					survey_active = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.survey_active#">,
					survey_description = <cfif trim(arguments.survey_description) neq ''><cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_description#"><cfelse>NULL</cfif>				
				WHERE survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">			
			</cfquery>
			
			<cfset variables.survey_id = arguments.survey_id>
		<cfelse>
			<cfquery name="qry_addSurvey" datasource="#variables.dsn#">
				INSERT INTO Survey (survey_title, survey_date, survey_end_date, survey_active, survey_description)
				VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_title#">,
						<cfqueryparam cfsqltype="cf_sql_date" value="#arguments.survey_date#">,
						<cfqueryparam cfsqltype="cf_sql_date" value="#arguments.survey_end_date#">,
						<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.survey_active#">,
						<cfif trim(arguments.survey_description) neq ''><cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_description#"><cfelse>NULL</cfif>)
				SELECT @@IDENTITY as survey_id
			</cfquery>
			
			<cfset variables.survey_id = qry_addSurvey.survey_id>
		</cfif>
			
		<cfreturn variables.survey_id>
	</cffunction>
	
	<!--- this will remove the survey, the questions, and all responses through the constraints --->
	<cffunction name="deleteSurvey" access="public" returntype="boolean">
		<cfargument name="survey_id" required="yes">
		
		<cfquery name="qry_deleteSurvey" datasource="#variables.dsn#">
			DELETE FROM survey
			WHERE survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
		</cfquery>
		
		<cfreturn true>
	</cffunction>
	
	
	<!--- this will get the text for either the begining text or ending text. --->
	<cffunction name="getText" access="public" returntype="string">
		<cfargument name="survey_id" required="yes">
		<cfargument name="text" required="yes" hint="this value sould be survey_begining_text or survey_end_text">
		
		<cfquery name="qry_getText" datasource="#variables.dsn#">
			SELECT #arguments.text#
			FROM survey
			WHERE survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
		</cfquery>
		
		<cfreturn evaluate("qry_getText.#arguments.text#")>
	</cffunction>
	
	<cffunction name="saveText" access="public" returntype="boolean">
		<cfargument name="survey_id" required="yes">
		<cfargument name="text" required="yes">
		<cfargument name="text_value" required="yes">
		
		<cfquery name="qry_saveText" datasource="#variables.dsn#">
			UPDATE survey
			<cfif arguments.text_value neq ''>
			SET #arguments.text# = <cfqueryparam cfsqltype="cf_sql_longvarchar" value="#arguments.text_value#">
			<cfelse>
			SET #arguments.text# = NULL
			</cfif>
			WHERE survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
		</cfquery>
	
		<cfreturn true>
	</cffunction>
	
	<cffunction name="getQuestions" access="public" returntype="query">
		<cfargument name="survey_id" required="yes">
		<cfargument name="survey_question_id" required="no" default="">
		
		<cfquery name="qry_getQuestions" datasource="#variables.dsn#">
			SELECT survey_questions.survey_id, survey_questions.survey_question_order, survey_questions.survey_question_id, 
			survey_questions.survey_type_id, survey_questions.survey_allow_text, survey_question, 
			survey_text_question, survey_question_type.survey_type
			FROM survey_questions, survey_question_type
			WHERE survey_questions.survey_type_id = survey_question_type.survey_type_id
			<cfif arguments.survey_question_id neq "">
			AND survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">
			</cfif>
			AND survey_questions.survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
			ORDER BY survey_question_order, survey_question
		</cfquery>
	
		<cfreturn qry_getQuestions>
	</cffunction>
	
	<cffunction name="saveQuestion" access="public" returntype="string">
		<cfargument name="survey_id" required="yes">
		<cfargument name="survey_question_id" required="yes">
		<cfargument name="survey_question_order" required="yes">
		<cfargument name="survey_type_id" required="yes">
		<cfargument name="survey_allow_text" required="yes">
		<cfargument name="survey_question" required="yes">
		<cfargument name="survey_text_question" required="yes">

		
		<cfif arguments.survey_question_id neq ''>
			<!--- if the question id was passed then update --->
			<cfquery name="qry_updateQuestion" datasource="#variables.dsn#">
				UPDATE survey_questions
				SET survey_question_order = <cfif arguments.survey_question_order neq ''><cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_order#"><cfelse>NULL</cfif>,
					survey_type_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_type_id#">,
					survey_allow_text = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.survey_allow_text#">,
					survey_question = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_question#">,
					survey_text_question = <cfif arguments.survey_text_question neq ''><cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_text_question#"><cfelse>NULL</cfif>
				WHERE survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">
				AND survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
			</cfquery>
		
			<cfset variables.survey_question_id = arguments.survey_question_id>
		<cfelse>
			<!--- if the question id was not passed then insert the question / also check if it has default values --->
			<cfquery name="qry_insertQuestion" datasource="#variables.dsn#">
				INSERT INTO survey_questions (survey_id, survey_type_id, survey_allow_text, survey_question_order, survey_question, survey_text_question)
				VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_type_id#">,
						<cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.survey_allow_text#">,
						<cfif arguments.survey_question_order neq ''><cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_order#"><cfelse>NULL</cfif>,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_question#">,
						<cfif arguments.survey_text_question neq ''><cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_text_question#"><cfelse>NULL</cfif>)
				SELECT @@IDENTITY as survey_question_id
			</cfquery>
		
			<cfset variables.survey_question_id = qry_insertQuestion.survey_question_id>
			
			<!--- setup the automatic default values for these question types. --->
			<cfif survey_type_id eq "1">
				<cfset survey_values_disp = "True,False">
				<cfset survey_values_value = "True,False">
				
				<cfloop from="1" to="#listLen(survey_values_disp)#" index="count">
					<cfquery name="qry_insertValues_#count#" datasource="#variables.dsn#">
						INSERT INTO survey_option_values (survey_question_id, survey_values_disp, survey_values_value, survey_option_order)
						VALUES(<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.survey_question_id#">,
								<cfqueryparam cfsqltype="cf_sql_varchar" value="#listGetAt(variables.survey_values_disp,'#count#')#">,
								<cfqueryparam cfsqltype="cf_sql_varchar" value="#listGetAt(variables.survey_values_value,'#count#')#">,
								<cfqueryparam cfsqltype="cf_sql_integer" value="#count#">)
					</cfquery>
				</cfloop>
	
			<cfelseif survey_type_id eq "5">
				<cfset survey_values_disp = "Not Applicable,Strongly Disagree,Disagree,Agree,Strongly Agree">
				<cfset survey_values_value = "Not Applicable,Strongly Disagree,Disagree,Agree,Strongly Agree">
				
				<cfloop from="1" to="#listLen(survey_values_disp)#" index="count">
					<cfquery name="qry_insertValues_#count#" datasource="#variables.dsn#">
						INSERT INTO survey_option_values (survey_question_id, survey_values_disp, survey_values_value, survey_option_order)
						VALUES(<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.survey_question_id#">,
								<cfqueryparam cfsqltype="cf_sql_varchar" value="#listGetAt(variables.survey_values_disp,'#count#')#">,
								<cfqueryparam cfsqltype="cf_sql_varchar" value="#listGetAt(variables.survey_values_value,'#count#')#">,
								<cfqueryparam cfsqltype="cf_sql_integer" value="#count#">)
					</cfquery>
				</cfloop>
			
			</cfif>
		</cfif>
	
		<cfreturn variables.survey_question_id>
	</cffunction>
	
	<!--- this will delete the questions and also the results from the question --->
	<cffunction name="deleteQuestion" returntype="boolean" access="public">
		<cfargument name="survey_question_id" required="yes" type="numeric">
		
		<cfquery name="qry_deleteQuestion" datasource="#variables.dsn#">
			DELETE FROM survey_questions
			WHERE survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">
		</cfquery>
	
		<cfreturn true>
	</cffunction>
	
	<!--- this will return all the question types. --->
	<cffunction name="getQuestionTypes" access="public" returntype="query">
		<cfargument name="survey_type_id" required="no" default="">
		
		<cfquery name="qry_getQuestionTypes" datasource="#variables.dsn#">
			SELECT survey_type_id, survey_type, survey_desc
			FROM survey_question_type
			<cfif arguments.survey_type_id neq ''>
			WHERE survey_type_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_type_id#">
			</cfif>
		</cfquery>
	
		<cfreturn qry_getQuestionTypes>
	</cffunction>
	
	<!--- this will pull back all the question values. --->
	<cffunction name="getQuestionValues" access="public" returntype="query">
		<cfargument name="survey_question_id" required="yes">
		<cfargument name="survey_option_values_id" required="no" default="">
		
		<cfquery name="qry_surveyValues" datasource="#variables.dsn#">
			SELECT survey_option_values.survey_option_order, survey_option_values.survey_question_id, 
			survey_option_values.survey_option_values_id, survey_option_values.survey_values_disp, 
			survey_option_values.survey_values_value, survey_questions.survey_type_id, survey_questions.survey_id
			FROM survey_option_values, survey_questions
			WHERE survey_option_values.survey_question_id = survey_questions.survey_question_id
			AND survey_option_values.survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">
			<cfif arguments.survey_option_values_id neq ''>
			AND survey_option_values.survey_option_values_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_option_values_id#">
			</cfif>
			ORDER BY survey_option_values.survey_option_order, survey_option_values.survey_values_disp
		</cfquery>
			
		<cfreturn qry_surveyValues>
	</cffunction>
	
	<!--- this will save/update the question values --->
	<cffunction name="saveQuestionValue" access="public" returntype="boolean">
		<cfargument name="survey_option_values_id" required="no" default="">
		<cfargument name="survey_option_order" required="yes">
		<cfargument name="survey_question_id" required="yes">
		<cfargument name="suvery_values_disp" required="yes">
		<cfargument name="survey_values_value" required="yes">
		
		<cfif survey_option_values_id neq ''>
			<!--- this is an update of the values --->
			<cfquery name="qry_updateValues" datasource="#variables.dsn#">
				UPDATE survey_option_values
				SET survey_values_disp = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.suvery_values_disp#">,
				survey_values_value = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_values_value#">,
				survey_option_order = <cfif arguments.survey_option_order neq ''><cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_option_order#"><cfelse>NULL</cfif>
				WHERE survey_option_values_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_option_values_id#">
			</cfquery>
			
		<cfelse>
			<!--- this will save the new values --->
			<cfquery name="qry_insertValues" datasource="#variables.dsn#">
				INSERT INTO survey_option_values (survey_question_id, survey_values_disp, survey_values_value, survey_option_order)
				VALUES (<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.suvery_values_disp#">,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_values_value#">,
					<cfif arguments.survey_option_order neq ''><cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_option_order#"><cfelse>NULL</cfif>
					)
			</cfquery>
		</cfif>
		
		<cfreturn true>
	</cffunction>
	
	<!--- this will remove a question value --->
	<cffunction name="deleteQuestionValue" access="public" returntype="boolean">
		<cfargument name="survey_option_values_id" required="yes">
		
		<cfquery name="qry_deleteValue" datasource="#variables.dsn#">
			DELETE FROM survey_option_values
			WHERE survey_option_values_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_option_values_id#">
		</cfquery>
		
		<cfreturn true>
	</cffunction>
	
</cfcomponent>