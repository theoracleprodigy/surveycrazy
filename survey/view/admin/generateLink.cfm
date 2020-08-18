<!---
<fusedoc
	fuse="generateLink.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This is the view that will generate the url link for the survey.
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
			<number name="survey_id" scope="form" />
			<number name="survey_question_id" scope="form" />
			<number name="survey_question_order" scope="form" />
			<number name="survey_type_id" scope="form" />
			<string name="survey_question" scope="form" />
			<boolean name="survey_allow_text" scope="form" />
			<string name="survey_text_question" scope="form" />		
		</out>
	</io>
</fusedoc>
--->

<body id="surveyWizard">
<div id="breadCrumbs">
	<a href="<cfoutput>#myself##xfa.showsurveys#</cfoutput>" alt="Show Surveys">Show Surveys</a>
</div>
	<div id="main">
		<h2>Customer Survey Link</h2>
		<textarea cols="70" rows="5"><cfoutput>#baseURL##myself##xfa.initSurvey#&survey_id=#attributes.survey_id#</cfoutput></textarea>
	</div>
</body>

