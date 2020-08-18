<cfif not isDefined("noHeading")>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
<head>
	<cfset thisCSS = trim(getSurveyCSS())>
	<style title="currentStyle" media="screen" type="text/css">
		@import "/survey/view/css/<cfoutput>#thisCSS#</cfoutput>";
	</style>
	<script language="JavaScript">
	function makeSure(){
		if(confirm("Are you sure you want to delete this item?"))
			return true;
		return false;
	}
	
	function maxLength(which, len){
		if(which.value.length > len){
			which.value = which.value.substring(0,len);
			alert("This field has a " + len + " character limit!");
		}
	}
	
	function changeColor(which){
		// get the current color first
		currentBackground = document.getElementById(which).style.backgroundColor;
		currentBorder = document.getElementById(which).style.borderColor;
	
		document.getElementById(which).style.backgroundColor = 'CCCCCC';
		document.getElementById(which).style.color = '000000';
	}
	function changeBack(which){
		document.getElementById(which).style.backgroundColor = currentBackground;
		document.getElementById(which).style.color = currentBorder;
	}
	
	function swapImage(which, imgName){
		which.src = "../images/"+ imgName;
		
		return true;
	}
	
	// if the document has a form field first that can set the focus then set it.
	function setFocus(){
		try{
			document.forms(0).elements(0).focus();
		}
		catch(e){};
	}
</script>
	
</head>

<body id="surveyWizard" onLoad="setFocus()">

<div id="container">
	<div id="headingSection">
		
	</div>
	<div id="topLinks">
	<cfif session.login eq "true"><a href="<cfoutput>#myself##xfa.logout#</cfoutput>" title="Logout">Logout</a></cfif>
	<!--- <cfif application.fusebox.mode is 'development'> --->
		<!--- <a href="index.cfm?appreload=1" title="reload">Reload Application</a> --->
		<a href="index.cfm?method=admin.showlogin" title="admin Login">Login</a>
	<!--- </cfif> --->

	</div>
		<div id="pageHeader">
			<!--<h1><span>Survey</span></h1>-->
		</div>
</cfif>