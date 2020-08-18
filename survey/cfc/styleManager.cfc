<cfcomponent displayname="styleManager">
	<cfset variables.dsn = createObject("component","datasource").dsn()>
	
	<cffunction name="init" access="public" returntype="styleManager" output="false">
		<cfreturn this />
	</cffunction>
	

	<!--- allow a change of css at any time by passing a survey id in --->
	<cffunction name="getSurveyCSS" returntype="query" access="public">
		<cfargument name="survey_look_id" required="no" default=""/>
		
		<cfquery name="getCSS" datasource="#variables.dsn#">
			SELECT survey_look_id, survey_css, survey_title
			FROM survey_look
			<cfif trim(arguments.survey_look_id) neq ''>
			WHERE survey_look_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.survey_look_id#">
			</cfif>
		</cfquery>
		
		<cfreturn getCSS>
	</cffunction>
	
	
</cfcomponent>