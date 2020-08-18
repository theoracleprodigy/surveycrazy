<!---
<fusedoc
	fuse="nextQuestion.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will display the question and the values.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 13, 2005"
		email="jonathan.powell@auguste.com"
		role="architect">
	</properties>
	<io>
		<in>
			<number name="currentQuestion" scope="attributes" precision="integer"/>
		</in>
		<out>
			<recordset name="getCurrentQuestion" scope="variables">
				<number name="survey_id" precision="integer" />
				<number name="survey_question_id" precision="integer" />
				<string name="survey_question" />
				<string name="survey_text_question" />
				<string name="survey_allow_text" />
				<string name="survey_disp" />
				<string name="survey_type_id" />
				<string name="survey_disp_size" />
			</recordset>

			<recordset name="getOptionValues" scope="variables">
				<string name="survey_values_disp"/>
				<string name="survey_values_value"/>
				<number name="survey_option_values_id" precision="integer" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->
<cfset nextQuestion = attributes.currentQuestion + 1>
<cfif variables.nextQuestion gt listLen(getOrderList())>
	<cfset pageAction = xfa.endSurvey>
<cfelse>
	<cfset pageAction = xfa.nextQuestion>
</cfif>
<!---
<script language="javascript">

// this function was writen to validate the user input for the text / least to most.
function validateText(){
<cfif getCurrentQuestion.survey_disp eq 'text'>
var thisList = '';
	for(x=0;x<document.postQuestion.survey_value.length;x++){
		var currentValue = document.postQuestion.survey_value[x].value;
		
		// if there is a value in the field
		if(currentValue != ''){
			// set the array list = to the thisList as an array.
			var arrayList = thisList.split(",");
			
			// loop through the array list and see if the value is in the array list already.
			for(y=0;y<arrayList.length;y++){
				// if the value is already in the list it fails the test.
				if(arrayList[y] == currentValue){
					alert("Please do not put duplicate values in the list!");
					return false;
				}
			}
		}else{
			alert("Please fill in all values!");
			return false;
		}
		// if there is nothing in the list add the first value.
		thisList = thisList +','+ currentValue;
	}
</cfif>
	return _CF_checkpostQuestion(document.postQuestion)
 }
</script>
--->

<div id="main">
<cfform name="postQuestion" action="#myself##variables.pageAction#&currentQuestion=#nextQuestion#" method="post">
<input type="hidden" name="survey_id" value="<cfoutput>#getCurrentQuestion.survey_id#</cfoutput>" />
<input type="hidden" name="survey_allow_text" value="<cfoutput>#getCurrentQuestion.survey_allow_text#</cfoutput>" />
<input type="hidden" name="survey_question_id" value="<cfoutput>#getCurrentQuestion.survey_question_id#</cfoutput>" />

<h2><cfoutput>#getSurveyTitle()#</cfoutput></h2>

	<span id="survey_question"><cfoutput>#attributes.currentQuestion#</cfoutput>.<cfoutput>#getCurrentQuestion.survey_question#</cfoutput></span>
	
	<ul id="optionValues">
	<cfoutput query="getOptionValues">
		<li>
		<cfswitch expression="#getCurrentQuestion.survey_disp#">
			<cfcase value="radio">
				<cfinput type="radio" name="survey_value" value="#getOptionValues.survey_values_value#^#getOptionValues.survey_option_values_id#" alt="#getOptionValues.survey_values_disp#" required="yes" message="Please choose at least one value!" />
			</cfcase>
			<cfcase value="checkbox">
				<cfinput type="checkbox" name="survey_value" value="#getOptionValues.survey_values_value#^#getOptionValues.survey_option_values_id#" alt="#getOptionValues.survey_values_disp#" required="yes" message="Please choose at least one value!" />
			</cfcase>
			<cfcase value="text">
				<input type="text" name="survey_value" alt="#getOptionValues.survey_values_disp#" size="#getCurrentQuestion.survey_disp_size#" />
				<input type="hidden" name="survey_option_values_id" value="#getOptionValues.survey_option_values_id#">
			</cfcase>
		</cfswitch>
		<label for="survey_value">#getOptionValues.survey_values_disp#</label></li>
	</cfoutput>
	</ul>
	
	<cfif getCurrentQuestion.survey_allow_text eq 1>
	<span id="survey_question_text"><cfoutput>#getCurrentQuestion.survey_text_question#</cfoutput></span><br/>
	
	<span id="survey_question_textarea">
		<textarea name="survey_textarea" cols="70" rows="5" onKeyUp="maxLength(this,'1000');"></textarea>
	</span>
	</cfif>
	
	<div id="button"><input type="submit" name="submit" value="Next >>" /></div>
  </cfform>
</div>
