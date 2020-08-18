<!---
<fusedoc
	fuse="activeSurvey.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This page shows the available surveys that a customer can take.
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
			<recordset name="activeSurveys" scope="variables">
				<number name="survey_id" scope="variables" precision="integer" />
				<string name="survey_title" scope="variables" />
				<string name="survey_description" scope="variables" />
			</recordset>
		</in>
		<out/>
	</io>
</fusedoc>

--->
<div id="error"><cfoutput>#error#</cfoutput></div>
<div id="main">
<h2>Surveys</h2>
<h3>Please select a survey and click start survey to answer the questions.</h3>
<table cellpadding="1" cellspacing="1" width="100%">
	<tr>
		<td class="tableHead">&nbsp; Title</td>
		<td class="tableHead">&nbsp; Description</td>
		<td class="tableHead">&nbsp; Start Survey</td>
	</tr>
	<cfoutput query="activeSurveys">
	<tr <CFIF activeSurveys.currentRow mod 2 EQ '0'>  bgcolor="##FFFFFF" <CFELSE>bgcolor="##e0e0e0" </CFIF> id="table_#activeSurveys.currentRow#" onMouseOver="changeColor(this.id)" onMouseOut="changeBack(this.id)">
		<td>#activeSurveys.survey_title#</td>
		<td><cfif len(activeSurveys.survey_description) gt 75>#left(activeSurveys.survey_description,75)#...<cfelse>#activeSurveys.survey_description#</cfif></td>
		<td><a href="#myself##xfa.initSurvey#&survey_id=#activeSurveys.survey_id#" title="Start Survey" id="startSurvey">Start Survey</a></td>
	</tr>
	</cfoutput>
</table>
</div>