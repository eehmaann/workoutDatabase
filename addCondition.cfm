<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
   		<cfinclude template = "header.cfm">
    
    	<cfparam name="Form.conName" default="Test" type="string">
    	<cfparam name="Form.sleep" default ="18" type="numeric">
    	<cfparam name="Form.sickness" default ="AAA" type="string">
    	<cfparam name="Form.mainInjury" default ="AAA" type="string">

		<cfif #Form.sickness# EQ "AAA">
    		<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowCondition.cfm"> 
		<cfelse>
        	<cfquery name="addWorkout"
             	datasource="#Request.DSN#"
             	username="#Request.username#"
             	password="#Request.password#">
          	INSERT into tbCondition (conName, sleep, sickness, mainInjury) values ('#Form.conName#', #Form.sleep#, '#Form.sickness#', '#Form.mainInjury#')
        	</cfquery>
			<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowCondition.cfm"> 
            <cfinclude template = "footer.cfm">
    	</cfif>
    </body>
</html>

        
     