<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- admin.showQuestionValues: <fusebox:plugin name="SimpleSecurity">            --->
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
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "showQuestionValues">
<!--- admin.showQuestionValues: <fusebox:set overwrite="false" name="attributes.survey_option_values_id" value=""> --->
<cfif NOT IsDefined("attributes.survey_option_values_id")>
	<cfset attributes.survey_option_values_id = "">
</cfif>
<!--- admin.showQuestionValues: <fusebox:invoke methodcall="getQuestionValues(    survey_question_id=attributes.survey_question_id,    survey_option_vaules_id=attributes.survey_option_values_id)" returnvariable="getOptionValues" object="application.surveymanager"> --->
<cfset getOptionValues = application.surveymanager.getQuestionValues(    survey_question_id=attributes.survey_question_id,    survey_option_vaules_id=attributes.survey_option_values_id) />
<!--- m_admin.showQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="m_admin"> --->
<cfset myFusebox.thisCircuit = "m_admin">
<!--- m_admin.showQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "showQuestionValues">
<!--- m_admin.showQuestionValues: <fusebox:include template="showQuestionValues.cfm"> --->
<cftry>
	<cfoutput><cfinclude template="..\model/admin/showQuestionValues.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("model/admin/showQuestionValues.cfm") ) EQ "model/admin/showQuestionValues.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse showQuestionValues.cfm in circuit m_admin which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "showQuestionValues">
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- v_admin.showQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="v_admin"> --->
<cfset myFusebox.thisCircuit = "v_admin">
<!--- v_admin.showQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "showQuestionValues">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="editSurvey" value="admin.editSurvey"> --->
<cfset xfa.editSurvey = "admin.editSurvey">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="showQuestions" value="admin.showQuestions"> --->
<cfset xfa.showQuestions = "admin.showQuestions">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="deleteSurvey" value="admin.deleteSurvey"> --->
<cfset xfa.deleteSurvey = "admin.deleteSurvey">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="showSurveys" value="admin.showSurveys"> --->
<cfset xfa.showSurveys = "admin.showSurveys">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="saveSurvey" value="admin.saveSurvey"> --->
<cfset xfa.saveSurvey = "admin.saveSurvey">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="editQuestion" value="admin.editQuestion"> --->
<cfset xfa.editQuestion = "admin.editQuestion">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="saveQuestion" value="admin.saveQuestion"> --->
<cfset xfa.saveQuestion = "admin.saveQuestion">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="editQuestionValues" value="admin.editQuestionValues"> --->
<cfset xfa.editQuestionValues = "admin.editQuestionValues">
<!--- v_admin.showQuestionValues: <fusebox:xfa name="deleteQuestionValues" value="admin.deleteQuestionValues"> --->
<cfset xfa.deleteQuestionValues = "admin.deleteQuestionValues">
<!--- v_admin.showQuestionValues: <fusebox:include template="showQuestionValues.cfm"> --->
<cftry>
	<cfoutput><cfinclude template="..\view/admin/showQuestionValues.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/admin/showQuestionValues.cfm") ) EQ "view/admin/showQuestionValues.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse showQuestionValues.cfm in circuit v_admin which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "showQuestionValues">
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "showQuestionValues">
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
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
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.showQuestionValues: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestionValues"> --->
<cfset myFusebox.thisFuseaction = "showQuestionValues">
<cfsetting enablecfoutputonly="No">

