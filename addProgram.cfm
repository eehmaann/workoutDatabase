<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
   		<cfinclude template = "header.cfm">
    
    	<cfparam name="Form.programName" default="AAA" type="string">
    	<cfparam name="Form.restrictcarbs" default ="AA" type="string">
    	<cfparam name="Form.vegetarian" default ="AA" type="string">
    	<cfparam name="Form.cardioimp" default ="9999" type="numeric">
    	<cfparam name="Form.weightimp" default ="99" type="numeric">
    	<cfparam name="Form.workWeek" default ="21" type="numeric">
    	<cfparam name="Form.dailycal" default ="99999" type="numeric">
    

		<cfif #Form.restrictcarbs# EQ "AA">
    		<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowPrograms.cfm"> 
		<cfelse>
        	<cfquery name="addWorkout"
             	datasource="#Request.DSN#"
             	username="#Request.username#"
             	password="#Request.password#">
         INSERT INTO tbProgram(programName, restrictcarbs, vegetarian, cardioimp, weightimp, workWeek, dailycal) VALUES ('#Form.programName#', '#Form.restrictcarbs#', '#Form.vegetarian#' , #Form.cardioimp#, #Form.weightimp#, #Form.workWeek#, #Form.dailycal#)
        	</cfquery>
 			<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowPrograms.cfm"> 
            <cfinclude template = "footer.cfm">
    	</cfif>
    </body>
</html>