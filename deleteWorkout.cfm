<html>
   <head>
       <title>Workouts</title>
    <cfinclude template = "general.css">
   </head>
   <body>
   		<cfinclude template = "header.cfm">
        <cfparam name="Form.workoutNo" default="99999" type="numeric">     
		<cfquery name="deleteWorkout"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          		DELETE FROM tbWorkout
               WHERE workoutNo = <cfqueryparam cfsqltype="cf_sql_integer" value="#Form.workoutNo#">
        </cfquery> 

<cflocation url="ShowWorkout.cfm" addtoken="no">
    </body>
</html>

        
     