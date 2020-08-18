<!---
<fusedoc
	fuse="startSurvey.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This page is the introduction page to the surveys.
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
			<string name="surveyBeginingText" scope="variables" />
		</in>
		<out/>
	</io>
</fusedoc>

--->
<div id="main">
<h2><cfoutput>#getSurveyTitle()#</cfoutput></h2>

	<cfoutput>#variables.surveyBeginingText#</cfoutput>
	
	<div id="start"><a href="<cfoutput>#myself##xfa.nextQuestion#&currentQuestion=1</cfoutput>" title="Start Survey">Start Survey</a></div>
</div>
