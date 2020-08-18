<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- admin.editQuestionValues: <fusebox:plugin name="SimpleSecurity">            --->
<cfset myFusebox.thisPlugin  = "SimpleSecurity">
<cfset myFusebox.thisPhase  = "preProcess">
<cfoutput><cfinclude template="..\plugins\SimpleSecurity.cfm"></cfoutput>
<!--- v.header: <fusebox:set name="myFusebox.thisCircuit" value="v">              --->
<cfset myFusebox.thisCircuit = "v">
<!--- v.header: <fusebox:set name="myFusebox.thisFuseaction" value="header">      --->
<cfset myFusebox.thisFuseaction = "header">
<!--- v.header: <fusebox:set name="xfa.logout" value="admin.logout">              --->
<cfset xfa.logout = "admin.logout">
<!--- v.header: <fusebox:include template="header">                               --->
<cftry>
	<cfoutput><cfinclude template="..\view/header.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/header.cfm") ) EQ "view/header.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse header in circuit v which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- v.header: <fusebox:set name="myFusebox.thisFuseaction" value="header">      --->
<cfset myFusebox.thisFuseaction = "header">
<!--- v.header: <fusebox:set name="myFusebox.thisCircuit" value="v">              --->
<cfset myFusebox.thisCircuit = "v">
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "editQuestionValues">
<!--- admin.editQuestionValues: <fusebox:set overwrite="false" name="attributes.survey_option_values_id" value=""> --->
<cfif NOT IsDefined("attributes.survey_option_values_id")>
	<cfset attributes.survey_option_values_id = "">
</cfif>
<!--- admin.editQuestionValues: <fusebox:invoke methodcall="getQuestionValues(    survey_question_id=attributes.survey_question_id,    survey_option_values_id=attributes.survey_option_values_id)" returnvariable="getOptionValue" object="application.surveymanager"> --->
<cfset getOptionValue = application.surveymanager.getQuestionValues(    survey_question_id=attributes.survey_question_id,    survey_option_values_id=attributes.survey_option_values_id) />
<!--- v_admin.editQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="v_admin"> --->
<cfset myFusebox.thisCircuit = "v_admin">
<!--- v_admin.editQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "editQuestionValues">
<!--- v_admin.editQuestionValues: <fusebox:xfa name="editSurvey" value="admin.editSurvey"> --->
<cfset xfa.editSurvey = "admin.editSurvey">
<!--- v_admin.editQuestionValues: <fusebox:xfa name="showQuestions" value="admin.showQuestions"> --->
<cfset xfa.showQuestions = "admin.showQuestions">
<!--- v_admin.editQuestionValues: <fusebox:xfa name="deleteSurvey" value="admin.deleteSurvey"> --->
<cfset xfa.deleteSurvey = "admin.deleteSurvey">
<!--- v_admin.editQuestionValues: <fusebox:xfa name="showSurveys" value="admin.showSurveys"> --->
<cfset xfa.showSurveys = "admin.showSurveys">
<!--- v_admin.editQuestionValues: <fusebox:xfa name="saveSurvey" value="admin.saveSurvey"> --->
<cfset xfa.saveSurvey = "admin.saveSurvey">
<!--- v_admin.editQuestionValues: <fusebox:xfa name="editQuestion" value="admin.editQuestion"> --->
<cfset xfa.editQuestion = "admin.editQuestion">
<!--- v_admin.editQuestionValues: <fusebox:xfa name="saveQuestionValue" value="admin.saveQuestionValue"> --->
<cfset xfa.saveQuestionValue = "admin.saveQuestionValue">
<!--- v_admin.editQuestionValues: <fusebox:include template="editQuestionValues.cfm"> --->
<cftry>
	<cfoutput><cfinclude template="..\view/admin/editQuestionValues.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/admin/editQuestionValues.cfm") ) EQ "view/admin/editQuestionValues.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse editQuestionValues.cfm in circuit v_admin which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "editQuestionValues">
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "editQuestionValues">
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- v.footer: <fusebox:set name="myFusebox.thisCircuit" value="v">              --->
<cfset myFusebox.thisCircuit = "v">
<!--- v.footer: <fusebox:set name="myFusebox.thisFuseaction" value="footer">      --->
<cfset myFusebox.thisFuseaction = "footer">
<!--- v.footer: <fusebox:include template="footer">                               --->
<cftry>
	<cfoutput><cfinclude template="..\view/footer.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/footer.cfm") ) EQ "view/footer.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse footer in circuit v which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- v.footer: <fusebox:set name="myFusebox.thisFuseaction" value="footer">      --->
<cfset myFusebox.thisFuseaction = "footer">
<!--- v.footer: <fusebox:set name="myFusebox.thisCircuit" value="v">              --->
<cfset myFusebox.thisCircuit = "v">
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "editQuestionValues">
<cfsetting enablecfoutputonly="No">

