<!---
<fusedoc
	fuse="surveyResults.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This is the template that will output the report in a format that can be viewed in excel.
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
			<recordset name="qry_getDetails" scope="variables">
				<string name="survey_title" />
				<string name="survey_description" />
				<datetime name="survey_date" />
				<datetime name="survey_end_date" />
			</recordset>
			<recordset name="qry_getResults" scope="variables">
				<number name="survey_type_id" precision="integer" />
				<string name="survey_question" />
				<string name="survey_text_question" />
				<string name="survey_values_disp" />
				<number name="currentNumber" />
				<number name="survey_question_id" precision="integer" />
			</recordset>
			<recordset name="qry_textQuestions" scope="variables">
				<number name="survey_question_id" />
				<string name="survey_textarea"  />
			</recordset>
		</in>
		<out/>
	</io>
</fusedoc>--->

<CFHEADER NAME="Content-Disposition" VALUE="attachment; filename=surveyResults.xls">
<cfcontent type="application/msexcel">
<table cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td width="50%"><h2><cfoutput>#qry_getDetails.survey_title#</cfoutput></h2></td>
	<td width="10%">&nbsp;</td>
	<td width="40%" align="right"><strong>Report Printed:</strong><cfoutput>#formatDateTime(now())#</cfoutput></td>
</tr>
<tr>
	<td><strong>Report Active Date:</strong>
	  <cfoutput>#formatDate(qry_getDetails.survey_date)#</cfoutput></td>
	  <td>&nbsp;</td>
	<td align="right"><strong>Report End Date:</strong><cfoutput>#formatDate(qry_getDetails.survey_end_date)#</cfoutput></td>
</tr>
<tr>
	<td colspan="3"><strong>Report Description:</strong></td>
</tr>
<tr>
	<td colspan="3"><cfoutput>#qry_getDetails.survey_description#</cfoutput></td>
</tr>
</table>

<br /><br /><hr color="#999999" size="15" />

<table width="100%" cellpadding="0" cellspacing="0">
<cfset currentCount = 1>
<cfoutput query="qry_getResults" group="survey_question">
<tr>
	<td colspan="3"><strong>Question:</strong><br> #currentCount#. #qry_getResults.survey_question#</td>			
</tr>
	<cfoutput>
	<tr>
		<td width="5%">#qry_getResults.currentNumber#</td>
		<td align="left">#qry_getResults.survey_values_disp#</td>
		<td>&nbsp;</td>
	</tr>
	</cfoutput>
	<cfif qry_getResults.survey_text_question neq ''>
	<tr>
		<td colspan="3"><strong>Text Area Question:</strong><br> #qry_getResults.survey_text_question#</td>
	</tr>
	</cfif>
	<cfset theTextResult = getTextResults(qry_getResults.survey_question_id)>
	<cfloop query="theTextResult">
	<tr>
		<td colspan="3">#survey_textarea#</td>
	</tr>
	</cfloop>
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
	<cfset currentCount = currentCount + 1>
</cfoutput>
</table>	
