<!---
<fusedoc
	fuse="showsurveys.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This is the view that will display the surveys that are out there, active or not.
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
			<recordset name="getSurveys" scope="variables">
				<date name="survey_date" />
				<string name="survey_title" />
				<boolean name="survey_active" />
				<number name="survey_id" precision="integer" />
			</recordset>
		</in>
		<out/>
	</io>
</fusedoc>
--->


<div id="error"><cfoutput>#error#</cfoutput></div>
<div id="main">
<h2>Current Surveys <a href="<cfoutput>#myself##xfa.newSurvey#</cfoutput>" alt="New Survey"><img src="<cfoutput>#imagesdir#</cfoutput>new.gif" alt="New Survey" border="0"></a></h2>
<table cellpadding="1" cellspacing="1" width="100%">
	<tr nowrap>
		<td class="tableHead">&nbsp; Created</td>
		<td class="tableHead" width="40%">&nbsp; Survey Title</td>
		<td class="tableHead">&nbsp; Active</td>
		<td class="tableHead">&nbsp; Action</td>
	</tr>
	<cfoutput query="getSurveys">
	<tr <CFIF getSurveys.currentRow mod 2 EQ '0'>  bgcolor="##FFFFFF" <CFELSE>bgcolor="##e0e0e0" </CFIF> id="table_#getSurveys.currentRow#" onMouseOver="changeColor(this.id)" onMouseOut="changeBack(this.id)">
		<td>#formatDate(getSurveys.survey_date)#</td>
		<td>#getSurveys.survey_title#</td>
		<td><cfif getSurveys.survey_active eq '1'>Yes &nbsp; #formatDate(getSurveys.survey_date)#<cfelse>No</cfif></td>
		<td>
			<a href="#myself##xfa.surveyResults#&survey_id=#getSurveys.survey_id#&noHeading=1" alt="Survey Results"><img src="#imagesdir#pie3.gif" alt="Survey Results" border="0"></a>
			<a href="#myself##xfa.generateLink#&survey_id=#getSurveys.survey_id#" alt="Generate URL Link"><img src="#imagesdir#url.gif" alt="Generate URL Link" border="0"></a>
			<a href="#myself##xfa.showQuestions#&survey_id=#getSurveys.survey_id#" alt="Show Questions"><img src="#imagesdir#layout.gif" alt="Show Question" border="0"></a>
			<a href="#myself##xfa.editSurvey#&survey_id=#getSurveys.survey_id#" alt="Edit Survey"><img src="#imagesdir#edit.gif" alt="Edit Survey" border="0"></a>
			<a href="#myself##xfa.deleteSurvey#&survey_id=#getSurveys.survey_id#" alt="Delete Survey" onClick="return makeSure()"><img src="#imagesdir#delete.gif" alt="Delete Survey" border="0"></a>
		</td>
	</tr>
	</cfoutput>
</table>
</div>
