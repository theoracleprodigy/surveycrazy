<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="UTF-8">
<cftry>
<!--- user.activeSurveys: <fusebox:plugin name="SimpleSecurity">                  --->
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
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisCircuit" value="user"> --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="activeSurveys"> --->
<cfset myFusebox.thisFuseaction = "activeSurveys">
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
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="activeSurveys"> --->
<cfset myFusebox.thisFuseaction = "activeSurveys">
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisCircuit" value="user"> --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.activeSurveys: <fusebox:invoke methodcall="getActiveSurveys()" returnVariable="activeSurveys" object="application.customerSurveyManager"> --->
<cfset activeSurveys = application.customerSurveyManager.getActiveSurveys() />
<!--- v_user.activeSurveys: <fusebox:set name="myFusebox.thisCircuit" value="v_user"> --->
<cfset myFusebox.thisCircuit = "v_user">
<!--- v_user.activeSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="activeSurveys"> --->
<cfset myFusebox.thisFuseaction = "activeSurveys">
<!--- v_user.activeSurveys: <fusebox:xfa name="initSurvey" value="user.initSurvey"> --->
<cfset xfa.initSurvey = "user.initSurvey">
<!--- v_user.activeSurveys: <fusebox:include template="activeSurveys.cfm">        --->
<cftry>
	<cfoutput><cfinclude template="..\view/user/activeSurveys.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("view/user/activeSurveys.cfm") ) EQ "view/user/activeSurveys.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse activeSurveys.cfm in circuit v_user which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="activeSurveys"> --->
<cfset myFusebox.thisFuseaction = "activeSurveys">
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisCircuit" value="user"> --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="activeSurveys"> --->
<cfset myFusebox.thisFuseaction = "activeSurveys">
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisCircuit" value="user"> --->
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
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisCircuit" value="user"> --->
<cfset myFusebox.thisCircuit = "user">
<!--- user.activeSurveys: <fusebox:set name="myFusebox.thisFuseaction" value="activeSurveys"> --->
<cfset myFusebox.thisFuseaction = "activeSurveys">
<!--- user.activeSurveys: <fusebox:errorhandler name="exceptionHandler">          --->

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



<!--- user.activeSurveys: <fusebox:errorhandler name="SecurityException">         --->

<cfcatch type="SecurityException">

<cfoutput><strong>Ooooopppsss!  Ich don't think so!</strong></cfoutput>
</cfcatch>
</cftry>
<cfsetting enablecfoutputonly="No">

