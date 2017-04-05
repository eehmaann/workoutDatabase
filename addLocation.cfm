<html>
   <head>
       <title>Workouts</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
    
    <cfparam name="Form.locName" default="AAA" type="string">
    <cfparam name="Form.ground" default ="AAA" type="string">
    <cfparam name="Form.terrain" default ="AAA" type="string">

	<cfif #Form.ground# EQ "AAA">
    	<cflocation
url="http://cscie60.dce.harvard.edu/~eehmann/ShowLocations.cfm"> 
	<cfelse>
        <cfquery name="addLocation"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          insert into tbLoc (locName, ground, terrain) values ('#Form.locName#', '#Form.ground#','#Form.terrain#')
        </cfquery>


 <cflocation
url="http://cscie60.dce.harvard.edu/~eehmann/ShowLocations.cfm"> 
            <cfinclude template = "footer.cfm">
    </cfif>
    </body>
</html>

        
     