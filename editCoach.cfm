<html>
   <head>
       <title>Coaches</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
    
    <cfparam name="Form.firstName" default="AAA" type="string">
    <cfparam name="Form.lastName" default ="AAA" type="string">
    <cfparam name="Form.mainSport" default ="AAA" type="string">
    <cfparam name="Form.philosophy" default ="AAA" type="string">



        <cfquery name="editingCoach"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          update tbCoach
             set
              firstName ='#Form.firstName#',
              lastName ='#Form.lastName#',
              mainSport='#Form.mainSport#',
              philosophy='#Form.philosophy#'
              where coachNo =#Form.CoachNo#
        </cfquery>

<cfif Form.mainSport EQ "AAA">
<cflocation url="index.cfm" addtoken="no">
<cfelse>
<cflocation url="ShowCoaches.cfm" addtoken="no">
</cfif>

            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     