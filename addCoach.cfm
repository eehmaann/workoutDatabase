<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
   			<cfinclude template = "header.cfm">
   			<cfparam name="Form.firstName" default="AAA" type="string">
    		<cfparam name="Form.lastName" default ="AAA" type="string">
    		<cfparam name="Form.mainSport" default ="AAA" type="string">
    		<cfparam name="Form.philosophy" default ="AAA" type="string">
 		<cfif #Form.lastName# EQ "AAA">
    		<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowCoaches.cfm"> 
		<cfelse> 
        	<cfquery name="addCoach"
             	datasource="#Request.DSN#"
             	username="#Request.username#"
             	password="#Request.password#">
          		insert into tbCoach (firstName, lastName, mainSport, philosophy) values ('#Form.firstName#', '#Form.lastName#','#Form.mainSport#', '#Form.philosophy#')
        	</cfquery>
    		<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowCoaches.cfm"> 
		</cfif>
    </body>
</html>