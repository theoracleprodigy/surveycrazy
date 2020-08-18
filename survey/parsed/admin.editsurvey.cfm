<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<cftry>
<!--- admin.editSurvey: <fusebox:plugin name="SimpleSecurity">                    --->
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
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="editSurvey"> --->
<cfset myFusebox.thisFuseaction = "editSurvey">
<!--- admin.editSurvey: <fusebox:set overwrite="false" name="attributes.survey_id" value="0"> --->
<cfif NOT IsDefined("attributes.survey_id")>
	<cfset attributes.survey_id = "0">
</cfif>
<!--- admin.editSurvey: <fusebox:invoke methodcall="getSurveyCSS()" returnVariable="getCSS" object="application.styleManager"> --->
<cfset getCSS = application.styleManager.getSurveyCSS() />
<!--- admin.editSurvey: <fusebox:invoke methodcall="getSurveys(attributes.survey_id)" returnVariable="getSurvey" object="application.surveyManager"> --->
<cfset getSurvey = application.surveyManager.getSurveys(attributes.survey_id) />
<!--- admin.editSurvey: <fusebox:invoke methodcall="getText(survey_id=attributes.survey_id,text='survey_begining_text')" returnVariable="begining_text" object="application.surveymanager"> --->
<cfset begining_text = application.surveymanager.getText(survey_id=attributes.survey_id,text='survey_begining_text') />
<!--- admin.editSurvey: <fusebox:invoke methodcall="getText(survey_id=attributes.survey_id,text='survey_end_text')" returnVariable="end_text" object="application.surveymanager"> --->
<cfset end_text = application.surveymanager.getText(survey_id=attributes.survey_id,text='survey_end_text') />
<!--- v_admin.editSurvey: <fusebox:set name="myFusebox.thisCircuit" value="v_admin"> --->
<cfset myFusebox.thisCircuit = "v_admin">
<!--- v_admin.editSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="editSurvey"> --->
<cfset myFusebox.thisFuseaction = "editSurvey">
<!--- v_admin.editSurvey: <fusebox:xfa name="editSurvey" value="admin.editSurvey"> --->
<cfset xfa.editSurvey = "admin.editSurvey">
<!--- v_admin.editSurvey: <fusebox:xfa name="showQuestions" value="admin.showQuestions"> --->
<cfset xfa.showQuestions = "admin.showQuestions">
<!--- v_admin.editSurvey: <fusebox:xfa name="deleteSurvey" value="admin.deleteSurvey"> --->
<cfset xfa.deleteSurvey = "admin.deleteSurvey">
<!--- v_admin.editSurvey: <fusebox:xfa name="showSurveys" value="admin.showSurveys"> --->
<cfset xfa.showSurveys = "admin.showSurveys">
<!--- v_admin.editSurvey: <fusebox:xfa name="saveSurvey" value="admin.saveSurvey"> --->
<cfset xfa.saveSurvey = "admin.saveSurvey">
<!--- v_admin.editSurvey: <fusebox:xfa name="editQuestion" value="admin.editQuestion"> --->
<cfset xfa.editQuestion = "admin.editQuestion">
<!--- v_admin.editSurvey: <fusebox:include template="editSurvey.cfm">             --->
<cftry>
	<cfoutput><cfinclude template="..\view/admin/editSurvey.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/admin/editSurvey.cfm") ) EQ "view/admin/editSurvey.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse editSurvey.cfm in circuit v_admin which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="editSurvey"> --->
<cfset myFusebox.thisFuseaction = "editSurvey">
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="editSurvey"> --->
<cfset myFusebox.thisFuseaction = "editSurvey">
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
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
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisCircuit" value="admin">  --->
<cfset myFusebox.thisCircuit = "admin">
<!--- admin.editSurvey: <fusebox:set name="myFusebox.thisFuseaction" value="editSurvey"> --->
<cfset myFusebox.thisFuseaction = "editSurvey">
<!--- admin.editSurvey: <fusebox:errorhandler name="exceptionHandler">            --->

<!--- FB40 plugin: ExceptionHandler --->
<!--- copyright: (c) 2003, by John Quarto-vonTivadar. You are free to use this FB40 plugin and to modify it as long as you leave my copyright notice intact. --->
<!--- use: during Phase "fuseactionException" --->
<!--- overview: if an exception occurs during execution of a fuseaction, this plugin will execute
 an exception handler template for it, in the following order:--->
<!---           1) fuseaction-specific exception handler, a template in the fuseaction's circuit named "exception.{fuseaction-name}.cfm" --->
<!---           2) circuit-wide exception handler, a template in the fuseaction's circuit named "exception.circuit.cfm" --->
<!---           3) application-wide exception handler, a template in the app root named "exception.fusebox.cfm --->
<!---           4) if none of the above is found, just rethrow the exception --->

<cfset plugin = myFusebox.plugins[myFusebox.thisPlugin]>	
<cfcatch type="any">
	<cfset plugin.fuseactionExceptionFile = "#application.fusebox.parseRootPath##application.fusebox.circuits[myFusebox.thisCircuit].path#exception.#myFusebox.thisFuseaction#.cfm">
	<cfset plugin.circuitExceptionFile = "#application.fusebox.parseRootPath##application.fusebox.circuits[myFusebox.thisCircuit].path#exception.circuit.cfm">
	<cfset plugin.fuseboxExceptionFile = "#application.fusebox.parseRootPath#exception.fusebox.cfm">
	
	<cfset plugin.myException = duplicate(cfcatch)>
	<cftry>
		<!--- first try looking for a fuseaction-specific exception handler --->
		<cfinclude template="#plugin.fuseactionExceptionFile#">
	
		<cfcatch type="missingInclude">
			<cftry>
				<!--- next try looking for a circuit-wide exception handler --->
				<cfinclude template="#plugin.circuitExceptionFile#">
				<cfcatch type="missingInclude">
					<cftry>
						<!--- finally try looking for a fusebox application-wide exception handler --->
						<cfinclude template="#plugin.fuseboxExceptionFile#">
						<cfset cfcatch = plugin.myException>
						<cfcatch type="any">
							<!--- hmm, well if it still isn't caught then just rethrow it --->
							<!--- this includes the case where any exception other than including the application-wide exception handler occurs --->
							<cfset cfcatch = plugin.myException>
							<cfrethrow>
						</cfcatch>
					</cftry>
				</cfcatch>
				<!--- if some error other than that the circuit-wide exception handler doesn't exist occurs then just rethrow it --->
				<cfcatch type="any">
					<cfset cfcatch = plugin.myException>
					<cfrethrow>
				</cfcatch>
			</cftry>
		</cfcatch>
	
		<!--- if some error other than that the fuseaction exception handler doesn't exist occurs then just rethrow it --->
		<cfcatch type="any">
			<cfset cfcatch = plugin.myException>
			<cfrethrow>
		</cfcatch>
		
	</cftry>

</cfcatch>



<!--- admin.editSurvey: <fusebox:errorhandler name="SecurityException">           --->

<cfcatch type="SecurityException">

<cfoutput><strong>Ooooopppsss!  Ich don't think so!</strong></cfoutput>
</cfcatch>
</cftry>
<cfsetting enablecfoutputonly="No">

