<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- admin.saveSurvey: <fusebox:plugin name="SimpleSecurity">                    --->
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
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="saveSurvey"> --->
<cfset myFusebox.thisFuseaction = "saveSurvey">
<!--- admin.saveSurvey: <fusebox:invoke methodcall="saveSurvey(   survey_id=attributes.survey_id,   survey_title=attributes.survey_title,   survey_description=attributes.survey_description,   survey_end_date=attributes.survey_end_date,   survey_active=attributes.survey_active,   survey_date=attributes.survey_date)" returnvariable="survey_id" object="application.surveymanager"> --->
<cfset survey_id = application.surveymanager.saveSurvey(   survey_id=attributes.survey_id,   survey_title=attributes.survey_title,   survey_description=attributes.survey_description,   survey_end_date=attributes.survey_end_date,   survey_active=attributes.survey_active,   survey_date=attributes.survey_date) />
<!--- admin.saveSurvey: <fusebox:invoke methodcall="saveText(survey_id=variables.survey_id,text='survey_begining_text',text_value=attributes.begining_text)" object="application.surveymanager"> --->
<cfset application.surveymanager.saveText(survey_id=variables.survey_id,text='survey_begining_text',text_value=attributes.begining_text) />
<!--- admin.saveSurvey: <fusebox:invoke methodcall="saveText(survey_id=variables.survey_id,text='survey_end_text',text_value=attributes.end_text)" object="application.surveymanager"> --->
<cfset application.surveymanager.saveText(survey_id=variables.survey_id,text='survey_end_text',text_value=attributes.end_text) />
<!--- admin.showSurveys: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.showSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="showSurveys"> --->
<cfset myFusebox.thisFuseaction = "showSurveys">
<!--- admin.showSurveys: <fusebox:invoke methodcall="getSurveys()" returnVariable="getSurveys" object="application.surveyManager"> --->
<cfset getSurveys = application.surveyManager.getSurveys() />
<!--- v_admin.showSurveys: <fusebox:set name="myFusebox.thisCircuit" value="v_admin"> --->
<cfset myFusebox.thisCircuit = "v_admin">
<!--- v_admin.showSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="showSurveys"> --->
<cfset myFusebox.thisFuseaction = "showSurveys">
<!--- v_admin.showSurveys: <fusebox:xfa name="editSurvey" value="admin.editSurvey"> --->
<cfset xfa.editSurvey = "admin.editSurvey">
<!--- v_admin.showSurveys: <fusebox:xfa name="showQuestions" value="admin.showQuestions"> --->
<cfset xfa.showQuestions = "admin.showQuestions">
<!--- v_admin.showSurveys: <fusebox:xfa name="deleteSurvey" value="admin.deleteSurvey"> --->
<cfset xfa.deleteSurvey = "admin.deleteSurvey">
<!--- v_admin.showSurveys: <fusebox:xfa name="showSurveys" value="admin.showSurveys"> --->
<cfset xfa.showSurveys = "admin.showSurveys">
<!--- v_admin.showSurveys: <fusebox:xfa name="saveSurvey" value="admin.saveSurvey"> --->
<cfset xfa.saveSurvey = "admin.saveSurvey">
<!--- v_admin.showSurveys: <fusebox:xfa name="editQuestion" value="admin.editQuestion"> --->
<cfset xfa.editQuestion = "admin.editQuestion">
<!--- v_admin.showSurveys: <fusebox:xfa name="newSurvey" value="admin.editSurvey"> --->
<cfset xfa.newSurvey = "admin.editSurvey">
<!--- v_admin.showSurveys: <fusebox:xfa name="generateLink" value="admin.generateLink"> --->
<cfset xfa.generateLink = "admin.generateLink">
<!--- v_admin.showSurveys: <fusebox:xfa name="surveyResults" value="admin.surveyResults"> --->
<cfset xfa.surveyResults = "admin.surveyResults">
<!--- v_admin.showSurveys: <fusebox:include template="showSurveys.cfm">           --->
<cftry>
	<cfoutput><cfinclude template="..\view/admin/showSurveys.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/admin/showSurveys.cfm") ) EQ "view/admin/showSurveys.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse showSurveys.cfm in circuit v_admin which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- admin.showSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="showSurveys"> --->
<cfset myFusebox.thisFuseaction = "showSurveys">
<!--- admin.showSurveys: <fusebox:set name="myFusebox.thisCircuit" value="admin"> --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="saveSurvey"> --->
<cfset myFusebox.thisFuseaction = "saveSurvey">
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="saveSurvey"> --->
<cfset myFusebox.thisFuseaction = "saveSurvey">
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
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
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.saveSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="saveSurvey"> --->
<cfset myFusebox.thisFuseaction = "saveSurvey">
<cfsetting enablecfoutputonly="No">

