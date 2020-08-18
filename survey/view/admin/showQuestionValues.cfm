<!---
<fusedoc
	fuse="showQuestionValues.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file is the view of the question values.  It displays the values and has links
	to edit, add new and delete if possible.
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
			<number name="survey_id" precision="integer" scope="attributes"/>
			
			<recordset name="getOptionValues" scope="variables">
				<number name="survey_id" precision="integer" />
				<number name="survey_question_id" precision="integer" />
				<number name="survey_option_values_id" precision="integer" />
				<string name="survey_values_disp" />
				<string name="survey_value_value" />
			</recordset>
			
		</in>
		<out/>
	</io>
</fusedoc>
--->
<cfset isReadOnly = getReadOnly(getOptionValues.survey_type_id)>

<div id="breadCrumbs">
	<a href="<cfoutput>#myself##xfa.showsurveys#</cfoutput>" alt="Show Surveys">Show Surveys</a> > 
	<a href="<cfoutput>#myself##xfa.editsurvey#&survey_id=#attributes.survey_id#</cfoutput>" alt="Edit Survey">Edit Survey</a> >
	<a href="<cfoutput>#myself##xfa.showQuestions#&survey_id=#getOptionValues.survey_id#</cfoutput>" alt="Show Questions">Show Questions</a> >
	New/Edit Question
</div>
<div id="main">
<h2><cfif getOptionValues.survey_option_values_id neq ''>Edit<cfelse>New</cfif> Survey Question Values
<cfif not isReadOnly>
<a href="<cfoutput>#myself##xfa.editQuestionValues#&survey_question_id=#attributes.survey_question_id#&survey_option_values_id=0</cfoutput>" alt="New Question Value"><img src="<cfoutput>#imagesdir#</cfoutput>new.gif" alt="New Question Value" border="0"></a>
</cfif>
</h2>

<table cellpadding="1" cellspacing="1" width="100%">
	<tr>
		<td class="tableHead">&nbsp; Display Value</td>
		<td class="tableHead">&nbsp; Saved Value</td>
		<td class="tableHead">&nbsp; Action</td>
	</tr>
	<cfoutput query="getOptionValues">
	<tr>
		<td>#getOptionValues.survey_values_disp#</td>
		<td>#getOptionValues.survey_values_value#</td>
		<td>
			<a href="#myself##xfa.editQuestionValues#&survey_question_id=#getOptionValues.survey_question_id#&survey_option_values_id=#getOptionValues.survey_option_values_id#" alt="Edit Question"><img src="#imagesdir#edit.gif" alt="Edit Question Values" border="0"></a>
			<cfif not isReadOnly>
			<a href="#myself##xfa.deleteQuestionValues#&survey_question_id=#getOptionValues.survey_question_id#&survey_option_values_id=#getOptionValues.survey_option_values_id#" alt="Delete Question" onClick="return makeSure()"><img src="#imagesdir#delete.gif" alt="Delete Question" border="0"></a>
			</cfif>
		</td>
	</tr>
	</cfoutput>
</table>
</div>