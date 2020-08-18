<!---
<fusedoc
	fuse="showQuestionValues.cfm"
	version="1.0"
	language = "ColdFusion">
	<responsibilities>
	This file will return a boolean value that will allow a question to
	be editied.
	</responsibilities>
	<properties>
	<history
		type="create"
		date="May 10, 2005"
		email="jonathan.powell@auguste.com"
		role="architect">
	</properties>
	<io>
		<in>
			<number name="survey_type_id" precision="integer"/>
		</in>
		<out>
			<boolean default="false"/>
		</out>
	</io>
</fusedoc>
--->

<cffunction name="getReadOnly" access="public" returntype="boolean">
	<cfargument name="survey_type_id" required="yes">
	
	<cfif listFind("1,5",survey_type_id)>
		<!--- question type 1 is true false, and 5 is applicable 1-5 --->
		<cfreturn true>
	<cfelse>
		<cfreturn false>
	</cfif>
	
	<!--- send back the fail safe just in case --->
	<cfreturn true>
</cffunction>