<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- user.endSurvey: <fusebox:plugin name="SimpleSecurity">                      --->
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
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">     --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="endSurvey"> --->
<cfset myFusebox.thisFuseaction = "endSurvey">
<!--- m_user.globals: <fusebox:set name="myFusebox.thisCircuit" value="m_user">   --->
<cfset myFusebox.thisCircuit = "m_user">
<!--- m_user.globals: <fusebox:set name="myFusebox.thisFuseaction" value="globals"> --->
<cfset myFusebox.thisFuseaction = "globals">
<!--- m_user.globals: <fusebox:include template="globalUserFunctions.cfm">        --->
<cftry>
	<cfoutput><cfinclude template="..\model/user/globalUserFunctions.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("model/user/globalUserFunctions.cfm") ) EQ "model/user/globalUserFunctions.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse globalUserFunctions.cfm in circuit m_user which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="endSurvey"> --->
<cfset myFusebox.thisFuseaction = "endSurvey">
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">     --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.endSurvey: <fusebox:invoke methodcall="getText(survey_id=attributes.survey_id,text='survey_end_text')" returnVariable="surveyEndText" object="application.surveyManager"> --->
<cfset surveyEndText = application.surveyManager.getText(survey_id=attributes.survey_id,text='survey_end_text') />
<!--- m_user.saveQuestion: <fusebox:set name="myFusebox.thisCircuit" value="m_user"> --->
<cfset myFusebox.thisCircuit = "m_user">
<!--- m_user.saveQuestion: <fusebox:set name="myFusebox.thisFuseaction" value="saveQuestion"> --->
<cfset myFusebox.thisFuseaction = "saveQuestion">
<!--- m_user.saveQuestion: <fusebox:include template="saveQuestion.cfm">          --->
<cftry>
	<cfoutput><cfinclude template="..\model/user/saveQuestion.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("model/user/saveQuestion.cfm") ) EQ "model/user/saveQuestion.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse saveQuestion.cfm in circuit m_user which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="endSurvey"> --->
<cfset myFusebox.thisFuseaction = "endSurvey">
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">     --->
<cfset myFusebox.thisCircuit = "user">
<!--- v_user.endSurvey: <fusebox:set name="myFusebox.thisCircuit" value="v_user"> --->
<cfset myFusebox.thisCircuit = "v_user">
<!--- v_user.endSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="endSurvey"> --->
<cfset myFusebox.thisFuseaction = "endSurvey">
<!--- v_user.endSurvey: <fusebox:include template="endSurvey.cfm">                --->
<cftry>
	<cfoutput><cfinclude template="..\view/user/endSurvey.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/user/endSurvey.cfm") ) EQ "view/user/endSurvey.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse endSurvey.cfm in circuit v_user which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="endSurvey"> --->
<cfset myFusebox.thisFuseaction = "endSurvey">
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">     --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="endSurvey"> --->
<cfset myFusebox.thisFuseaction = "endSurvey">
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">     --->
<cfset myFusebox.thisCircuit = "user">
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
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">     --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.endSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="endSurvey"> --->
<cfset myFusebox.thisFuseaction = "endSurvey">
<cfsetting enablecfoutputonly="No">

