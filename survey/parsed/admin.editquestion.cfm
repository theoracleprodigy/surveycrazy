<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- admin.editQuestion: <fusebox:plugin name="SimpleSecurity">                  --->
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
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestion"> --->
<cfset myFusebox.thisFuseaction = "editQuestion">
<!--- admin.editQuestion: <fusebox:set overwrite="false" name="attributes.survey_question_id" value="0"> --->
<cfif NOT IsDefined("attributes.survey_question_id")>
	<cfset attributes.survey_question_id = "0">
</cfif>
<!--- admin.editQuestion: <fusebox:invoke methodcall="getQuestions(survey_id=attributes.survey_id,survey_question_id=attributes.survey_question_id)" returnvariable="surveyQuestion" object="application.surveymanager"> --->
<cfset surveyQuestion = application.surveymanager.getQuestions(survey_id=attributes.survey_id,survey_question_id=attributes.survey_question_id) />
<!--- admin.editQuestion: <fusebox:invoke methodcall="getQuestionTypes()" returnvariable="questionTypes" object="application.surveymanager"> --->
<cfset questionTypes = application.surveymanager.getQuestionTypes() />
<!--- v_admin.editQuestion: <fusebox:set name="myFusebox.thisCircuit" value="v_admin"> --->
<cfset myFusebox.thisCircuit = "v_admin">
<!--- v_admin.editQuestion: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestion"> --->
<cfset myFusebox.thisFuseaction = "editQuestion">
<!--- v_admin.editQuestion: <fusebox:xfa name="editSurvey" value="admin.editSurvey"> --->
<cfset xfa.editSurvey = "admin.editSurvey">
<!--- v_admin.editQuestion: <fusebox:xfa name="showQuestions" value="admin.showQuestions"> --->
<cfset xfa.showQuestions = "admin.showQuestions">
<!--- v_admin.editQuestion: <fusebox:xfa name="deleteSurvey" value="admin.deleteSurvey"> --->
<cfset xfa.deleteSurvey = "admin.deleteSurvey">
<!--- v_admin.editQuestion: <fusebox:xfa name="showSurveys" value="admin.showSurveys"> --->
<cfset xfa.showSurveys = "admin.showSurveys">
<!--- v_admin.editQuestion: <fusebox:xfa name="saveSurvey" value="admin.saveSurvey"> --->
<cfset xfa.saveSurvey = "admin.saveSurvey">
<!--- v_admin.editQuestion: <fusebox:xfa name="editQuestion" value="admin.editQuestion"> --->
<cfset xfa.editQuestion = "admin.editQuestion">
<!--- v_admin.editQuestion: <fusebox:xfa name="saveQuestion" value="admin.saveQuestion"> --->
<cfset xfa.saveQuestion = "admin.saveQuestion">
<!--- v_admin.editQuestion: <fusebox:include template="editQuestion.cfm">         --->
<cftry>
	<cfoutput><cfinclude template="..\view/admin/editQuestion.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/admin/editQuestion.cfm") ) EQ "view/admin/editQuestion.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse editQuestion.cfm in circuit v_admin which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestion"> --->
<cfset myFusebox.thisFuseaction = "editQuestion">
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestion"> --->
<cfset myFusebox.thisFuseaction = "editQuestion">
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
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
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editQuestion: <fusebox:set name="myFusebox.thisFuseaction" value="editQuestion"> --->
<cfset myFusebox.thisFuseaction = "editQuestion">
<cfsetting enablecfoutputonly="No">

