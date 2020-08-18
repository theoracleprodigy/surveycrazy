<cfcomponent displayname="customerSurveyManager">
	<cfset variables.dsn = createObject("component","datasource").dsn()>
	
	<cffunction name="init" access="public" returntype="customerSurveyManager" output="false">
		<cfreturn this />
	</cffunction>
	
	<!--- this function will return a basic uuid for any general use where a unique id is needed --->
	<cffunction name="getUUID" access="public" returntype="string">
		<cfargument name="maxLength" type="numeric" required="no" default="18" hint="I am the length of the guid" /> 
	
		<cfreturn Replace(Left(CreateUUID(),arguments.maxLength),"-","0","ALL") />
	</cffunction>
	
	<!--- this function will return all valid surveys with all questions answered --->
	<cffunction name="validSurveys" access="public" returntype="query">
		
		<cfquery name="qry_getValid" datasource="#variables.dsn#">
			SELECT a.survey_id
			FROM (SELECT count(survey_question_id) totalCount, survey_id
				FROM survey_questions	
				GROUP BY survey_id) a, (SELECT count(survey_id) validCount, survey_id
							FROM survey_questions
							WHERE exists (SELECT survey_question_id
								FROM survey_option_values
							WHERE survey_question_id = survey_questions.survey_question_id)
							GROUP BY survey_id) b
			WHERE a.totalCount = b.validCount
			AND a.survey_id = b.survey_id
		</cfquery>
		
		<cfreturn qry_getValid />
	</cffunction>
	
	<!--- get active surveys or a specific active surevey --->
	<cffunction name="getActiveSurveys" access="public" returntype="query">
		<cfargument name="survey_id" required="no" default=""/>
		
		<cfset validSurvey_ids = validSurveys()>		
		
		<cfquery name="qry_getActive" datasource="#variables.dsn#">
			SELECT survey_id, survey_title, survey_description, survey_active, 
			survey_date, survey_end_date, survey_begining_text, survey_end_text
			FROM survey
			WHERE survey_active = '1'
			<cfif trim(arguments.survey_id) neq ''>
			AND survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
			</cfif>
			AND survey_date < <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">
			AND survey_end_date > <cfqueryparam cfsqltype="cf_sql_timestamp" value="#now()#">
			<cfif validSurvey_ids.survey_id eq ''>
			AND survey_id = '0'
			<cfelse>
			AND survey_id in (<cfqueryparam cfsqltype="cf_sql_integer" value="#valueList(variables.validSurvey_ids.survey_id)#" list="yes">)
			</cfif>
		</cfquery>
	
		<cfreturn qry_getActive />
	</cffunction>	
		
	<!--- this function will return a query with the question order / title --->
	<cffunction name="getOrder" access="public" returntype="query">
		<cfargument name="survey_id" required="yes">
		
		<cfquery name="qry_getOrder" datasource="#variables.dsn#">
			SELECT survey_questions.survey_question_id, survey.survey_title
			FROM survey_questions, survey
			WHERE survey_questions.survey_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_id#">
			AND survey_questions.survey_id = survey.survey_id
			ORDER BY survey_questions.survey_question_order, survey_questions.survey_question
		</cfquery>

		<cfreturn qry_getOrder />
	</cffunction>
	
	<!--- this function will get the current question / may need to add some more logic for the session variables in case of timeout. --->
	<cffunction name="getCurrentQuestion" access="public" returntype="query">
		<cfargument name="survey_question_id" required="yes" type="numeric" hint="This is the current question not as an id">
	
		<cfquery name="qry_getQuestion" datasource="#variables.dsn#">
			SELECT survey_questions.survey_id, survey_questions.survey_question_id, survey_questions.survey_question, 
			survey_questions.survey_text_question, survey_questions.survey_allow_text, survey_question_type.survey_disp, 
			survey_question_type.survey_type_id, survey_question_type.survey_disp_size			
			FROM survey_questions, survey_question_type
			WHERE survey_questions.survey_type_id = survey_question_type.survey_type_id
			AND survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">
		</cfquery>
		
		<cfreturn qry_getQuestion />
	</cffunction>
	
	<!--- this function will get all the current question values / display --->
	<cffunction name="getOptionValues" access="public" returntype="query">
		<cfargument name="survey_question_id" required="yes"/>
		
		<cfquery name="qry_getValues" datasource="#variables.dsn#">
			SELECT survey_values_disp, survey_values_value, survey_option_values_id
			FROM survey_option_values
			WHERE survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">			
		</cfquery>
	
		<cfreturn qry_getValues />
	</cffunction>
	
	<!--- this function will remove values from the current survey_result for a customer --->
	<cffunction name="removeQuestionValues" access="public" returntype="boolean">
		<cfargument name="survey_customer_id" required="yes" type="string" />
		<cfargument name="survey_question_id" required="yes" type="numeric" />
		
		<cfquery name="qry_checkUpdate" datasource="#variables.dsn#">
			DELETE
			FROM survey_results
			WHERE survey_customer_id = <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.survey_customer_id#">
			AND survey_question_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.survey_question_id#">
		</cfquery>
	
		<cfreturn true />
	</cffunction>
	
	
	<!--- this function will add the current question. --->
	<cffunction name="saveQuestion" access="public" returntype="boolean" hint="this function will save update the question">
		<cfargument name="survey_ip" required="yes" type="string"/>
		<cfargument name="survey_textarea" required="yes" type="string"/>
		<cfargument name="survey_value" required="yes" type="string"/>
		<cfargument name="survey_customer_id" required="yes" type="string"/>
		<cfargument name="survey_question_id" required="yes" type="numeric"/>
		<cfargument name="survey_option_values_id" required="no" />

		
		<cfquery name="qry_insertResult" datasource="#variables.dsn#">
			INSERT INTO survey_results (survey_customer_id, survey_question_id, survey_value, survey_textarea, survey_ip, survey_option_values_id)
			VALUES (<cfqueryparam cfsqltype="cf_sql_char" value="#arguments.survey_customer_id#">,
					<cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.survey_question_id#">,
					<cfif arguments.survey_value neq ''><cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_value#"><cfelse>NULL</cfif>,
					<cfif arguments.survey_textarea neq ''><cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_textarea#"><cfelse>NULL</cfif>,
					<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.survey_ip#">,
					<cfif survey_option_values_id neq ''><cfqueryparam cfsqltype="cf_sql_integer" value="#survey_option_values_id#"><cfelse>NULL</cfif>)
		</cfquery>
		
		
		<cfreturn true />
	</cffunction>
	
</cfcomponent>