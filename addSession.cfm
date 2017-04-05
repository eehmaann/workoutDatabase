<html>
   <head>
       <title>Workouts</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
    
    <cfparam name="Form.coachNo" default="99999" type="numeric">
    <cfparam name="Form.locNo" default ="9999" type="numeric">
    <cfparam name="Form.conNo" default ="9999" type="numeric">
    <cfparam name="Form.workoutNo" default ="9999" type="numeric">
    <cfparam name="Form.attendance" default ="9999" type="numeric">
    <cfparam name="Form.temperature" default ="999" type="numeric">

	<cfif #Form.temperature# EQ "999">
    	<cflocation
url="http://cscie60.dce.harvard.edu/~eehmann/ShowSession.cfm"> 
	<cfelse>
        <cfquery name="addSession"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          insert into tbSession (coachNo, locNo, conNo, workoutNo, attendance, temperature) values (#Form.coachNo#, #Form.locNo#,#Form.conNo#, #Form.workoutNo#, #Form.attendance#, #Form.temperature#)
        </cfquery>


 <cflocation
url="http://cscie60.dce.harvard.edu/~eehmann/ShowSession.cfm"> 
            <cfinclude template = "footer.cfm">
    </cfif>
    </body>
</html>

        
     