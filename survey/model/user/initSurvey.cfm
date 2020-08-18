<!---
<fusedoc
	fuse="activeSurvey.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This page checks to see if the survey is active first then calls the setupSurvey function.
	If the survey is not active it returns a false and sets a message.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 11, 2005"
		email="jonathan.powell@auguste.com"
		role="architect">
	</properties>
	<io>
		<in>
			<number name="survey_id" scope="variables" precision="integer" />
		</in>
		<out>
			<boolean name="initSurvey" scope="variables" />
		</out>
	</io>
</fusedoc>

--->
<cfset isActiveSurvey = application.customerSurveyManager.getActiveSurveys(attributes.survey_id)>
<cfif isActiveSurvey.recordCount gt 0>
		<cfset initSurvey = setupSurvey(attributes.survey_id)>
		<cfif initSurvey eq 'false'>
			<cfset error = "There was a problem starting this survey please try again later.">
		</cfif>
<cfelse>
	<cfset error = "This survey is no longer active">
	<cfset initSurvey = 'false'>
</cfif>