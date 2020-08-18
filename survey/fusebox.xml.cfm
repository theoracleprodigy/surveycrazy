<?xml version="1.0" encoding="UTF-8"?>
<fusebox>	
	<circuits>
		<circuit alias="m_admin" path="model/admin/" parent=""/>
		<circuit alias="m_user" path="model/user/" parent=""/>
		<circuit alias="v" path="view/" parent=""/>
		<circuit alias="v_admin" path="view/admin/" parent="v"/>
		<circuit alias="v_user" path="view/user/" parent="v"/>
		<circuit alias="admin" path="controller/admin/" parent=""/>
		<circuit alias="user" path="controller/user/" parnet=""/>
	</circuits>
	
	<parameters>
		<parameter name="fuseactionVariable" value="method" />
		<parameter name="defaultFuseaction" value="user.activeSurveys" />
		<parameter name="precedenceFormOrUrl" value="form"/>
		<parameter name="reparse" value="true" />
		<parameter name="execute" value="true" />
		<parameter name="mode" value="development"/>
		<parameter name="parseWithComments" value="true" />
		<parameter name="scriptlanguage" value="cfmx" />
		<parameter name="scriptFileDelimiter" value="cfm"/>
		<parameter name="maskedFileDelimiters" value="htm,cfm,cfml"/>
	</parameters>
	
	<globalfuseactions>
		<preprocess>
			<do action="v.header"/>
		</preprocess>
		<postprocess>	
			<do action="v.footer"/>
		</postprocess>
	</globalfuseactions>
	
	<plugins>
		<phase name="preProcess">
			<plugin name="SimpleSecurity" template="SimpleSecurity.cfm"/>
		</phase>
		<phase name="preFuseaction">
		</phase>
		<phase name="postFuseaction">	
		</phase>
		<phase name="fuseactionException">
		</phase>		
		<phase name="postProcess">
		</phase>
		<phase name="processError">
			<plugin name="exceptionHandler" template="ExceptionHandler.cfm"/>
			<plugin name="SecurityException" template="SecurityException.cfm"/>
		</phase>
		
	</plugins>

</fusebox>