<!---
<fusedoc
	fuse="editQuestionValues.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file is the new / edit for the question values.
	This allows you to setup the option orders, descriptions and values for the question
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
			<recordset name="getOptionValue" scope="variables">
				<number name="survey_id" precision="integer" />
				<number name="survey_question_id" precision="integer" />
				<number name="survey_option_values_id" precision="integer" />
				<string name="survey_values_disp" />
				<string name="survey_value_value" />
			</recordset>
		</in>
		<out>
			<number name="survey_id" precision="integer" scope="form" />
			<number name="suvery_option_values_id" precision="integer" scope="form" />
			<number name="survey_question_order" precision="integer" scope="form" />
			<string name="survey_values_disp" scope="form" />
			<string name="survey_values_value" scope="form" />
		</out>
	</io>
</fusedoc>

--->

<div id="breadCrumbs">
	<a href="<cfoutput>#myself##xfa.showsurveys#</cfoutput>" alt="Show Surveys">Show Surveys</a> > 
	<a href="<cfoutput>#myself##xfa.editsurvey#&survey_id=#getOptionValue.survey_id#</cfoutput>" alt="Edit Survey">Edit Survey</a> >
	<a href="<cfoutput>#myself##xfa.showQuestions#&survey_id=#getOptionValue.survey_id#</cfoutput>" alt="Show Questions">Show Questions</a> >
	New/Edit Question
</div>
<cfform name="editQuestion" method="post" action="#myself##variables.xfa.saveQuestionValue#">
<input type="hidden" name="survey_id" value="<cfoutput>#getOptionValue.survey_id#</cfoutput>">
<input type="hidden" name="survey_question_id" value="<cfoutput>#survey_question_id#</cfoutput>">
<input type="hidden" name="survey_option_values_id" value="<cfoutput>#getOptionValue.survey_option_values_id#</cfoutput>">


<h2><cfif getOptionValue.survey_option_values_id neq ''>Edit<cfelse>New</cfif> Survey Question Value</h2>
<table cellpadding="2" cellspacing="0" border="0" width="100%">		
	<tr>
		<td width="20%"><label for="survey_option_order">*Option Order</label></td>
		<td width="80%"><input name="survey_option_order" type="text" id="survey_option_order" size="3" maxlength="1000" value="<cfoutput>#getOptionValue.survey_option_order#</cfoutput>"> </td>
	</tr>
	<tr>
		<td width="20%"><label for="survey_values_disp">Survey Display</label></td>
		<td width="80%"><cfinput type="text" name="suvery_values_disp" id="suvery_values_disp" size="20" maxlength="100" required="yes" message="Please enter in a display value!" value="#getOptionValue.survey_values_disp#"></td>
	</tr>
	<tr>
		<td width="20%"><label for="survey_values_value">Survey Value</label></td>
		<td width="80%"><cfinput type="text" name="survey_values_value" id="survey_values_value" size="20" maxlength="100" required="yes" message="Please enter in a survey value!" value="#getOptionValue.survey_values_value#"></td>
	</tr>
	<tr>
	  <td colspan="2"><span id="xsmall">*If two field values have the same option order number then the field will be sorted alpabeticaly.</span></td>
    </tr>
	<tr>
		<td colspan="2"><input type="submit" name="Submit" value="Submit"></td>
	</tr>
</table>

</cfform>