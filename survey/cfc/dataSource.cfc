<cfcomponent>
	<cffunction name="dsn" returntype="string" output="false" access="public">
		<cfreturn "survey123">
	</cffunction>
	<cffunction name="dbtype" returntype="string" output="false" access="public">
		<cfreturn "SQL">
	</cffunction>
	<cffunction name="getOuterJoin" returntype="string" output="false" access="public">
		<cfif listFind("mySQL,SQL Server",dbtype())>
			<cfset outerJoin = "=*">
		<cfelseif dbType() is "Oracle">
			<cfset outerJoin = "(+)=">
		</cfif>
		
		<cfreturn outerJoin>
	</cffunction>
</cfcomponent>
