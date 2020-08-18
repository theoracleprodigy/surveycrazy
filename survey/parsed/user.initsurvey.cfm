<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<!--- user.initSurvey: <fusebox:plugin name="SimpleSecurity">                     --->
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
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">    --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="initSurvey"> --->
<cfset myFusebox.thisFuseaction = "initSurvey">
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
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="initSurvey"> --->
<cfset myFusebox.thisFuseaction = "initSurvey">
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">    --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.initSurvey: <fusebox:set overwrite="False" name="error" value="">      --->
<cfif NOT IsDefined("error")>
	<cfset error = "">
</cfif>
<!--- m_user.initSurvey: <fusebox:set name="myFusebox.thisCircuit" value="m_user"> --->
<cfset myFusebox.thisCircuit = "m_user">
<!--- m_user.initSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="initSurvey"> --->
<cfset myFusebox.thisFuseaction = "initSurvey">
<!--- m_user.initSurvey: <fusebox:include template="initSurvey.cfm">              --->
<cftry>
	<cfoutput><cfinclude template="..\model/user/initSurvey.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("model/user/initSurvey.cfm") ) EQ "model/user/initSurvey.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse initSurvey.cfm in circuit m_user which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="initSurvey"> --->
<cfset myFusebox.thisFuseaction = "initSurvey">
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">    --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.initSurvey: <fusebox:conditional condition="variables.initSurvey EQ TRUE" mode="begin"> --->
<cfif variables.initSurvey EQ TRUE>
	<!--- user.initSurvey: <fusebox:relocate type="client" url="#myself#user.startSurvey&survey_id=#attributes.survey_id#" addtoken="false"> --->
	<cflocation url="#myself#user.startSurvey&survey_id=#attributes.survey_id#" addtoken="no">
	<cfabort>
	<!--- user.initSurvey: <fusebox:conditional mode="else">                          --->
<cfelse>
	<!--- user.initSurvey: <fusebox:relocate type="client" url="#myself#user.activeSurveys&error=#error#" addtoken="false"> --->
	<cflocation url="#myself#user.activeSurveys&error=#error#" addtoken="no">
	<cfabort>
	<!--- user.initSurvey: <fusebox:conditional mode="end">                           --->
</cfif>
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="initSurvey"> --->
<cfset myFusebox.thisFuseaction = "initSurvey">
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">    --->
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
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisCircuit" value="user">    --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.initSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="initSurvey"> --->
<cfset myFusebox.thisFuseaction = "initSurvey">
<cfsetting enablecfoutputonly="No">

