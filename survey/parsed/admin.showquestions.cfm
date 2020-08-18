<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- admin.showQuestions: <fusebox:plugin name="SimpleSecurity">                 --->
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
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestions"> --->
<cfset myFusebox.thisFuseaction = "showQuestions">
<!--- admin.showQuestions: <fusebox:invoke methodcall="getQuestions(survey_id=attributes.survey_id)" returnvariable="surveyQuestions" object="application.surveymanager"> --->
<cfset surveyQuestions = application.surveymanager.getQuestions(survey_id=attributes.survey_id) />
<!--- v_admin.showQuestions: <fusebox:set name="myFusebox.thisCircuit" value="v_admin"> --->
<cfset myFusebox.thisCircuit = "v_admin">
<!--- v_admin.showQuestions: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestions"> --->
<cfset myFusebox.thisFuseaction = "showQuestions">
<!--- v_admin.showQuestions: <fusebox:xfa name="editSurvey" value="admin.editSurvey"> --->
<cfset xfa.editSurvey = "admin.editSurvey">
<!--- v_admin.showQuestions: <fusebox:xfa name="showQuestions" value="admin.showQuestions"> --->
<cfset xfa.showQuestions = "admin.showQuestions">
<!--- v_admin.showQuestions: <fusebox:xfa name="deleteSurvey" value="admin.deleteSurvey"> --->
<cfset xfa.deleteSurvey = "admin.deleteSurvey">
<!--- v_admin.showQuestions: <fusebox:xfa name="showSurveys" value="admin.showSurveys"> --->
<cfset xfa.showSurveys = "admin.showSurveys">
<!--- v_admin.showQuestions: <fusebox:xfa name="saveSurvey" value="admin.saveSurvey"> --->
<cfset xfa.saveSurvey = "admin.saveSurvey">
<!--- v_admin.showQuestions: <fusebox:xfa name="editQuestion" value="admin.editQuestion"> --->
<cfset xfa.editQuestion = "admin.editQuestion">
<!--- v_admin.showQuestions: <fusebox:xfa name="addQuestion" value="admin.editQuestion"> --->
<cfset xfa.addQuestion = "admin.editQuestion">
<!--- v_admin.showQuestions: <fusebox:xfa name="showQuestionValues" value="admin.showQuestionValues"> --->
<cfset xfa.showQuestionValues = "admin.showQuestionValues">
<!--- v_admin.showQuestions: <fusebox:xfa name="deleteQuestion" value="admin.deleteQuestion"> --->
<cfset xfa.deleteQuestion = "admin.deleteQuestion">
<!--- v_admin.showQuestions: <fusebox:include template="showQuestions.cfm">       --->
<cftry>
	<cfoutput><cfinclude template="..\view/admin/showQuestions.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/admin/showQuestions.cfm") ) EQ "view/admin/showQuestions.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse showQuestions.cfm in circuit v_admin which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestions"> --->
<cfset myFusebox.thisFuseaction = "showQuestions">
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestions"> --->
<cfset myFusebox.thisFuseaction = "showQuestions">
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
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
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.showQuestions: <fusebox:set name="myFusebox.thisFuseaction" value="showQuestions"> --->
<cfset myFusebox.thisFuseaction = "showQuestions">
<cfsetting enablecfoutputonly="No">

