<!---
<fusedoc
	fuse="showlogin.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will show the questions for a given survey.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 10, 2005"
		email="jonathan.powell@auguste.com"
		role="architect">
	</properties>
	<io>
		<in>
			<recordset name="surveyQuestions" scope="variables">
				<number name="survey_id" />
				<number name="survey_question_id" />
				<number name="survey_question_order" />
				<string name="survey_type" />
				<string name="survey_question" />
				<boolean name="survey_allow_text" />
			</recordset>
		</in>
		<out/>
	</io>
</fusedoc>

stoped here.
--->

<div id="error"><cfoutput>#error#</cfoutput></div>
<div id="breadCrumbs">
	<a href="<cfoutput>#myself##xfa.showsurveys#</cfoutput>" alt="Show Surveys">Show Surveys</a> > Questions
</div>
<div id="main">
<h2>Survey Questions <a href="<cfoutput>#myself##xfa.addQuestion#&survey_id=#attributes.survey_id#</cfoutput>" alt="New Question"><img src="<cfoutput>#imagesdir#</cfoutput>new.gif" alt="New Question" border="0"></a></h2>
<table cellpadding="1" cellspacing="1" width="100%">
	<tr>
		<td class="tableHead">&nbsp; Order</td>
		<td class="tableHead">&nbsp; Question</td>
		<td class="tableHead">&nbsp; Textarea</td>
		<td class="tableHead">&nbsp; Type</td>
		<td class="tableHead">&nbsp; Action</td>
	</tr>
	<cfoutput query="surveyQuestions">
	<tr <CFIF surveyQuestions.currentRow mod 2 EQ '0'>  bgcolor="##FFFFFF" <CFELSE>bgcolor="##e0e0e0" </CFIF> id="table_#surveyQuestions.currentRow#" onMouseOver="changeColor(this.id)" onMouseOut="changeBack(this.id)">
		<td>#surveyQuestions.survey_question_order#</td>
		<td><cfif len(surveyQuestions.survey_question) gt 40 >#left(surveyQuestions.survey_question,40)#...<cfelse>#surveyQuestions.survey_question#</cfif></td>
		<td>#surveyQuestions.survey_allow_text#</td>
		<td>#surveyQuestions.survey_type#</td>
		<td>
			<a href="#myself##xfa.showQuestionValues#&survey_id=#surveyQuestions.survey_id#&survey_question_id=#surveyQuestions.survey_question_id#" alt="Show Question Values"><img src="#imagesdir#layout.gif" alt="Show Question Values" border="0"></a>
			<a href="#myself##xfa.editQuestion#&survey_id=#surveyQuestions.survey_id#&survey_question_id=#surveyQuestions.survey_question_id#" alt="Edit Question"><img src="#imagesdir#edit.gif" alt="Edit Question" border="0"></a>
			<a href="#myself##xfa.deleteQuestion#&survey_id=#surveyQuestions.survey_id#&survey_question_id=#surveyQuestions.survey_question_id#" alt="Delete Question" onClick="return makeSure()"><img src="#imagesdir#delete.gif" alt="Delete Question" border="0"></a>
		</td>
	</tr>
	</cfoutput>
</table>
</div>