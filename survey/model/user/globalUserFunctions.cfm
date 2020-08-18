
<!--- this will get the current question --->
<cffunction name="getCurrentQuestionId" access="public" returntype="numeric">
	<cfargument name="currentNumber" required="yes" hint="The current question number ie question x not the id"/>

	<cfset currentQuestionId = listGetAt(getOrderList(),arguments.currentNumber)>
	
	<cfreturn currentQuestionId>
</cffunction>


<!--- setup the survey / this is the first call to initialize the survey --->
<cffunction name="setupSurvey" access="public" returntype="boolean">
	<cfargument name="survey_id" required="yes">

		<cfif isDefined("session.survey_id") and session.survey_id eq arguments.survey_id>
			<!--- couln't think of the opposite of this and make it work.  do nothing here --->
		<cfelse>

			<!--- go get the current order and set them up in session vars. --->
			<cfset surveyOrder = application.customerSurveyManager.getOrder(survey_id)>
			
			<cflock name="sessionLock" type="exclusive" timeout="10">
				<cfset session.surveyOrder = valueList(surveyOrder.survey_question_id)>
				<cfset session.surveyTitle = surveyOrder.survey_title>
				<cfset session.survey_customer_id = application.customerSurveyManager.getUUID()>
				<cfset session.survey_id = arguments.survey_id>
			</cflock>
		</cfif>
	
	<cfreturn true>
</cffunction>

<!--- now use a get method to get the survey list --->
<cffunction name="getOrderList" access="public">
	<cfif isDefined("session.survey_customer_id")>
		<cfreturn session.surveyOrder>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<!--- now use a method to get the title --->
<cffunction name="getSurveyTitle" access="public">
	<cfif isDefined("session.survey_customer_id")>
		<cfreturn session.surveyTitle>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<!--- now use a method to get the customer id --->
<cffunction name="getCustomerId" access="public">
	<cfif isDefined("session.survey_customer_id")>
		<cfreturn session.survey_customer_id>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>

<!--- now use a method to get teh survey_id --->
<cffunction name="getSurveyId" access="public">
	<cfif isDefined("session.survey_id")>
		<cfreturn session.surveyOrder>
	<cfelse>
		<cfreturn false>
	</cfif>
</cffunction>