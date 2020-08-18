<cfsilent><cfapplication name="survey" 
clientmanagement="No"
sessionmanagement="Yes"
setclientcookies="Yes" 
sessiontimeout="#CreateTimeSpan(0,2,0,0)#" 
applicationtimeout="#CreateTimeSpan(1,0,0,0)#">

<cfset fusebox_application_path = "">
</cfsilent>
<cfinclude template="fusebox4.runtime.cfmx.cfm">
