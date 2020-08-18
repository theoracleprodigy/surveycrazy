<!--- all session and application variables are set here... 
Also added all the parameters.
--->
<cfsilent>
<cfparam name="Error" default="">

<cfset self = "index.cfm">
<cfset myself = "#self#?#application.fusebox.fuseactionVariable#=">
<cfset imagesdir = "/survey/view/images/">
<cfset cfcPrefix = #cgi.SERVER_NAME# & "survey.cfc">
<cfset javaScript = "/survey/view/javascript/">
<cfset baseURL = "http://www.lanceproductions.net/survey/">

<!--- Initialize application manager components. --->
<cfparam name="url.appReload" type="string" default="false" />
<cfif not structKeyExists( application, 'appInitialized' ) or url.appReload>
	<cflock name="appInitBlock" type="exclusive" timeout="10">
		<cfif not structKeyExists( application, 'appInitialized' ) or url.appReload>
			<cfset application.customerSurveyManager = createObject('component',"survey.cfc.customerSurveyManager").init() />
			<cfset application.surveyManager = createObject( 'component', "survey.cfc.surveymanager" ).init() />
			<cfset application.styleManager = createObject("component","survey.cfc.styleManager").init() />
			<cfset application.appInitialized = true />
		</cfif>
	</cflock>
	<cfset structClear( session ) />
</cfif>

<!--- make sure that the session variables are defined first --->
<cfif not isDefined("session.login") or not isDefined("session.permissions")>
	<cflock type="exclusive" scope="session" timeout="10">
		<cfset session.login = "">
		<cfset session.permissions = "[none]">
	</cflock>
</cfif>

<!--- dsn() --->
<cffunction name="dsn" returntype="string" output="false" access="public" hint="Returns the ColdFusion datasource name for the active user.">			
	<cfif not IsDefined("application.dsn")>
		<cflock name="applicationDSN" type="exclusive" timeout="1200" throwontimeout="yes">
			<cfset application.dsn = CreateObject("component", "survey.cfc.dataSource").dsn()>	
		</cflock>
	</cfif>
	
	<cfreturn application.dsn>
</cffunction>

<!--- formatDate() --->
<cffunction name="formatDate" returntype="date" access="public">
	<cfargument name="thisDate" required="yes">
	
	<cfset tmpDate = DateFormat(thisDate, "MMM DD, YYYY")>
	<cfreturn tmpDate>
</cffunction>

<!--- formatTime() --->
<cffunction name="formatTime" returntype="date" access="public">
	<cfargument name="thisTime" required="yes">
	
	<cfset tmpTime = TimeFormat(thisTime, "h:mm tt")>
	<cfreturn tmpTime>
</cffunction>

<cffunction name="formatDateTime" returntype="date" access="public">
	<cfargument name="thisDateTime" required="yes">
	
	<cfset tmpDateTime = formatDate(thisDateTime) & ' ' & formatTime(thisDateTime)>
	<cfreturn tmpDateTime>
</cffunction>


<!--- survey css --->
<cffunction name="getSurveyCSS" returntype="string" access="public">
	<cfargument name="survey_id" required="no" default="1">

	<cfif not isDefined("session.survey_css")> 
		<cflock type="exclusive" scope="session" timeout="10">
			<cfset thisSurvey = application.styleManager.getSurveyCSS(arguments.survey_id)>
			<cfset session.survey_css = thisSurvey.survey_css>
		</cflock>
	</cfif>

	<cfreturn session.survey_css>
</cffunction>
</cfsilent>