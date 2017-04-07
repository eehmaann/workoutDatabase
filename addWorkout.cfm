<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">    
    	<cfparam name="Form.miles" default="400" type="numeric">
    	<cfparam name="Form.liftType" default ="AA" type="string">
    	<cfparam name="Form.load" default ="9999" type="numeric">
    	<cfparam name="Form.pace" default ="99" type="numeric">

	<cfif #Form.liftType# EQ "AA">
    	<cflocation
url="http://cscie60.dce.harvard.edu/~eehmann/ShowWorkout.cfm"> 
	<cfelse>
        <cfquery name="addWorkout"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          insert into tbWorkout (miles, liftType, load, pace) values (#Form.miles#, '#Form.liftType#',#Form.load#, #Form.pace#)
        </cfquery>


 		<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowWorkout.cfm"> 
        <cfinclude template = "footer.cfm">
    </cfif>
    </body>
</html>