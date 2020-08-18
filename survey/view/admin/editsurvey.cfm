<!---
<fusedoc
	fuse="editsurvey.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This is the view for the new/edit surveys, form values are returned that are then saved.
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
			<recordset name="getSurvey" scope="variables">
				<number name="survey_id" />
				<number name="survey_active" />
				<datetime name="survey_date" />
				<datetime name="survey_end_date" />
				<string name="survey_title" />
				<string name="begining_text" />
				<string name="end_text" />
			</recordset>
			<recordset name="getCSS" scope="variables">
				<number name="survey_look_id" />
				<string name="survey_title" />
			</recordset>
		</in>
		<out>
			<number name="survey_id" scope="form" />
			<number name="survey_css" scope="form" />
			<number name="survey_active" scope="form" />
			<datetime name="survey_date" scope="form" />
			<datetime name="survey_end_date" scope="form" />
			<string name="survey_title" scope="form" />
			<string name="begining_text" scope="form" />
			<string name="end_text" scope="form" />
		</out>
	</io>
</fusedoc>
--->

<script language="Javascript1.2"><!-- // load htmlarea
_editor_url = "<cfoutput>#javascript#</cfoutput>";                     // URL to htmlarea files
var win_ie_ver = parseFloat(navigator.appVersion.split("MSIE")[1]);
if (navigator.userAgent.indexOf('Mac')        >= 0) { win_ie_ver = 0; }
if (navigator.userAgent.indexOf('Windows CE') >= 0) { win_ie_ver = 0; }
if (navigator.userAgent.indexOf('Opera')      >= 0) { win_ie_ver = 0; }
if (win_ie_ver >= 5.5) {
  document.write('<scr' + 'ipt src="' +_editor_url+ 'editor.js"');
  document.write(' language="Javascript1.2"></scr' + 'ipt>');  
} else { document.write('<scr'+'ipt>function editor_generate() { return false; }</scr'+'ipt>'); }
// -->
</script>

<script language="JavaScript1.2" defer>
window.onload = function() {editor_generate('begining_text');editor_generate('end_text')};
</script>

<cfform name="editSurvey" method="post" action="#myself##xfa.saveSurvey#">
<input type="hidden" name="survey_id" value="<cfoutput>#getSurvey.survey_id#</cfoutput>">

<div id="breadCrumbs">
	<a href="<cfoutput>#myself##xfa.showsurveys#</cfoutput>" alt="Show Surveys">Show Surveys</a> > New/Edit Survey
</div>
<div id="main">

	<h2><cfif attributes.survey_id neq ''>Edit<cfelse>New</cfif> Survey</h2>
	<br>
	<table cellpadding="2" cellspacing="0" border="0" width="100%">		
	<tr>
		<td colspan="2"><label for="survey_active">Active:</label>
			<cfif getSurvey.survey_active eq 1 or getSurvey.survey_active eq ''>
				<input type="radio" name="survey_active" value="1" checked="yes">
				&nbsp; <label for="survey_active">Inactive:</label><input type="radio" name="survey_active" value="0">
			<cfelse>
				<input type="radio" name="survey_active" value="1">
				&nbsp; <label for="survey_active">Inactive:</label> <input type="radio" name="survey_active" value="0" checked="yes">
			</cfif>
		</td>
	</tr>	
	<tr>
		<td><label for="getCSS">Survey CSS</label></td>
		<td>
			<select name="survey_css">
				<cfoutput query="getCSS">
				<option value="#getCSS.survey_look_id#">#survey_title#</option>
				</cfoutput>
			</select>
		</td>
	</tr>
	<tr>
		<td><label for="survey_date">Active Date</label></td>
		<td>
			<cfinput type="text" name="survey_date" required="yes" validate="date" value="#dateFormat(getSurvey.survey_date,'mm/dd/yyyy')#" message="Please enter in a date!">
		</td>
	</tr>
	<tr>
		<td><label for="survey_end_date">End Date</label></td>
		<td>
			<cfinput type="text" name="survey_end_date" required="yes" validate="date" value="#dateFormat(getSurvey.survey_end_date,'mm/dd/yyyy')#" message="Please enter in an ending date!">
		</td>
	</tr>
	<tr>
		<td><label for="survey_title">Title:</label></td>
		<td>
			<cfinput type="text" required="yes" name="survey_title" maxlength="255" size="60"  value="#getSurvey.survey_title#" message="Please enter in a title!">
		</td>
	</tr>
	<tr>
		<td colspan="2"><label for="survey_description">Description:</label></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea cols="70" rows="8" name="survey_description" onKeyUp="maxLength(this,'1000');"><cfoutput>#getSurvey.survey_description#</cfoutput></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2"><label for="begining_text">Begining Page Text</label></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea cols="70" rows="8" name="begining_text"><cfoutput>#variables.begining_text#</cfoutput></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2"><label for="end_text">Ending Page Text</label></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea cols="70" rows="8" name="end_text"><cfoutput>#variables.end_text#</cfoutput></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" name="submit" value="Submit"></td>
	</tr>
	</table>
</div>


</cfform>