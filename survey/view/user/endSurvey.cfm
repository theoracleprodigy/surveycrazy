<!---
<fusedoc
	fuse="endSurvey.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This page is the end page to the surveys.
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
			<string name="survey_title" scope="variables" />
		</in>
		<out/>
	</io>
</fusedoc>

--->
<div id="main">
<h2><cfoutput>#getSurveyTitle()#</cfoutput></h2>

	<cfoutput>#variables.surveyEndText#</cfoutput>
	
</div>