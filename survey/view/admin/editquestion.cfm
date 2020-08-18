<!---
<fusedoc
	fuse="editQuestion.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This is the view for the new/edit question values.
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
			<recordset name="editQuestion" scope="variables">
				<number name="survey_question_id" />
				<number name="survey_question_order" />
				<number name="survey_type_id" />
				<string name="survey_question" />
				<boolean name="survey_allow_text" />
				<string name="survey_text_question" />				
			</recordset>
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

<div id="breadCrumbs">
	<a href="<cfoutput>#myself##xfa.showsurveys#</cfoutput>" alt="Show Surveys">Show Surveys</a> > 
	<a href="<cfoutput>#myself##xfa.editsurvey#&survey_id=#attributes.survey_id#</cfoutput>" alt="Edit Survey">Edit Survey</a> >
	<a href="<cfoutput>#myself##xfa.showQuestions#&survey_id=#attributes.survey_id#</cfoutput>" alt="Show Questions">Show Questions</a> >
	New/Edit Question
</div>
<div id="main">
<h2><cfif surveyQuestion.survey_question_id neq ''>Edit<cfelse>New</cfif> Survey Question</h2>

<cfform name="editQuestion" method="post" action="#myself##variables.xfa.saveQuestion#">
<input type="hidden" name="survey_id" value="<cfoutput>#attributes.survey_id#</cfoutput>">
<input type="hidden" name="survey_question_id" value="<cfoutput>#surveyQuestion.survey_question_id#</cfoutput>">

<table cellpadding="2" cellspacing="0" border="0" width="100%">		
	<tr>
		<td width="20%"><label for="survey_question_order">*Question Order</label></td>
		<td width="80%"><input name="survey_question_order" type="text" id="survey_question_order" size="3" maxlength="1000" value="<cfoutput>#surveyQuestion.survey_question_order#</cfoutput>"> </td>
	</tr>
	<tr>
	  <td><label for="survey_type_id">Question Type</label></td>
	  <td>	<cfselect name="survey_type_id" id="survey_type_id" required="yes" message="Please select a question type!">
	  			<cfoutput query="questionTypes">
				<option value="#questionTypes.survey_type_id#" <cfif surveyQuestion.survey_type_id eq questionTypes.survey_type_id>selected</cfif>>#questionTypes.survey_type#</option>
				</cfoutput>
      		</cfselect>
	  </td>
    </tr>
	<tr>
	  <td><label for="Question">Question</label></td>
	  <td><cfinput name="survey_question" type="text" id="survey_question" size="60" maxlength="1000" message="Please enter in a question!" value="#surveyQuestion.survey_question#"></td>
    </tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
	  	<td><label for="survey_allow_text">Allow Text Area</label></td>
	  	<td>Yes: <input name="survey_allow_text" type="radio" value="1" <cfif surveyQuestion.survey_allow_text is '1'>checked</cfif>>
	    &nbsp; No:	<input name="survey_allow_text" type="radio" value="0" <cfif surveyQuestion.survey_allow_text neq '1'>checked</cfif>>
		</td>
    </tr>
	<tr>
	  <td><label for="survey_text_question">Text Area Question</label></td>
	  <td><input name="survey_text_question" type="text" id="survey_text_question" size="60" maxlength="1000" value="<cfoutput>#surveyQuestion.survey_text_question#</cfoutput>"></td>
    </tr>
	<tr>
	  <td colspan="2"><span id="xsmall">*If two fields has the same question number the question will then be ordered alpabeticaly.</span></td>
    </tr>
	<tr>
		<td colspan="2"><input type="submit" name="Submit" value="Submit"></td>
	</tr>
</table>
</div>

</cfform>
