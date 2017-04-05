<html>
   <head>
       <title>Workout</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
    
    <cfparam name="Form.coachNo" default="9999" type="numeric">
    <cfparam name="Form.locNo" default ="9999" type="numeric">
    <cfparam name="Form.conNo" default ="9999" type="numeric">
    <cfparam name="Form.attendance" default ="999999" type="numeric">
    <cfparam name="Form.temperature" default="999" type="numeric">

        <cfquery name="edittheWorkout"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          update tbSession
             set
              coachNo =#Form.coachNo#,
              locNo =#Form.locNo#,
              conNo=#Form.conNo#,
              attendance=#Form.attendance#,
              temperature=#Form.temperature#
              where sessionNo = #Form.sessionNo#
        </cfquery>
<cfif Form.temperature EQ "999">
<cflocation url="index.cfm" addtoken="no">
<cfelse>
<cflocation url="ShowSession.cfm" addtoken="no">
</cfif>
            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     