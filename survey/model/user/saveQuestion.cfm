<!---
<fusedoc
	fuse="saveQuestion.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will determine if the save method need to be invoked, and what information needs to be saved.
	If the submit field is found it will save / update the information.
	
	The survey_option_values_id is saved in the survey_value for radio and checkboxes. It is a hidden field for text 
	because it has to be there for all text values and only the selected options on other items.
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
			<string name="Next >>" scope="form" optional="true" />
			<string name="survey_value" scope="form" />
			<string name="survey_allow_text" scope="form" />
			<string name="survey_textarea" scope="form" optional="true" />
			<string name="survey_customer_id" scope="session" />
			<number name="survey_question_id" precision="integer" scope="form" />
			<string name="survey_ip" scope="cgi" />
		</in>
		<out/>
	</io>
</fusedoc>
--->
<cfparam name="attributes.survey_textarea" default="" />

<cfif isDefined("form.submit")>
	<!--- get the customers ip address. --->
	<cfset customer_ip = cgi.remote_addr>
	<cfset variables.survey_customer_id = getCustomerId()>
	
	<!--- remove the values for this question just in case the customer already answered this question --->
	<cfset removeResult = application.customerSurveyManager.removeQuestionValues(survey_customer_id=variables.survey_customer_id,survey_question_id=attributes.survey_question_id)>
	
	<!--- this is to allow for multi select values / this does not save the text area... --->
	<cfloop from="1" to="#listLen(survey_value)#" index="count">
		<!--- save the textarea value in the first question value but not others. --->
		<cfif count eq '1'><cfset textarea = attributes.survey_textarea><cfelse><cfset textarea = ''></cfif>
		
		<!--- this was a quick way to get around survey_option_values_id for text not ideal but it works...
			The survey_option_values_id is saved in the survey_value for radio and checkboxes//
			It is a hidden field for text because it has to be there for all text values and only the selected
			options on other items.
		 --->
		<cfif isDefined("form.survey_option_values_id")>
			<cfset survey_option_values_id = listGetAt(form.survey_option_values_id,'#count#')>
		<cfelse>
			<cfset survey_option_values_id = getToken(listGetAt(survey_value,'#count#'),2,'^')>
		</cfif>

		<cfset thisQuestion = application.customerSurveyManager.saveQuestion(survey_ip=variables.customer_ip,survey_textarea=variables.textarea,survey_value=getToken(listGetAt(survey_value,'#count#'),'1','^'),survey_option_values_id=variables.survey_option_values_id,survey_customer_id=variables.survey_customer_id,survey_question_id=attributes.survey_question_id)>
	</cfloop>
	
</cfif>