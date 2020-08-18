<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- user.startSurvey: <fusebox:plugin name="SimpleSecurity">                    --->
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
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">   --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="startSurvey"> --->
<cfset myFusebox.thisFuseaction = "startSurvey">
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
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="startSurvey"> --->
<cfset myFusebox.thisFuseaction = "startSurvey">
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">   --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.startSurvey: <fusebox:set overwrite="True" name="instantiated" value="#setupSurvey(attributes.survey_id)#"> --->
<cfset instantiated = "#setupSurvey(attributes.survey_id)#">
<!--- user.startSurvey: <fusebox:invoke methodcall="getText(survey_id=attributes.survey_id,text='survey_begining_text')" returnVariable="surveyBeginingText" object="application.surveyManager"> --->
<cfset surveyBeginingText = application.surveyManager.getText(survey_id=attributes.survey_id,text='survey_begining_text') />
<!--- v_user.startSurvey: <fusebox:set name="myFusebox.thisCircuit" value="v_user"> --->
<cfset myFusebox.thisCircuit = "v_user">
<!--- v_user.startSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="startSurvey"> --->
<cfset myFusebox.thisFuseaction = "startSurvey">
<!--- v_user.startSurvey: <fusebox:xfa name="nextQuestion" value="user.nextQuestion"> --->
<cfset xfa.nextQuestion = "user.nextQuestion">
<!--- v_user.startSurvey: <fusebox:include template="startSurvey.cfm">            --->
<cftry>
	<cfoutput><cfinclude template="..\view/user/startSurvey.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/user/startSurvey.cfm") ) EQ "view/user/startSurvey.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse startSurvey.cfm in circuit v_user which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="startSurvey"> --->
<cfset myFusebox.thisFuseaction = "startSurvey">
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">   --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="startSurvey"> --->
<cfset myFusebox.thisFuseaction = "startSurvey">
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">   --->
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
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">   --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.startSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="startSurvey"> --->
<cfset myFusebox.thisFuseaction = "startSurvey">
<cfsetting enablecfoutputonly="No">

