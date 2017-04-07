<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
   		<cfinclude template = "header.cfm">
    
		<cfparam name="Form.programNo" default="999" type="numeric">
    	<cfparam name="Form.workoutNo" default ="999999" type="numeric">
    	<cfparam name="Form.weight" default ="999" type="numeric">
    	<cfparam name="Form.armSize" default ="999" type="numeric">
    	<cfparam name="Form.legSize" default ="999" type="numeric">
    	<cfparam name="Form.chestSize" default ="999" type="numeric">
    	<cfparam name="Form.waistSize" default ="999" type="numeric">
    

		<cfif #Form.waistSize# EQ "999">
    		<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowWorkout.cfm"> 
		<cfelse>
        	<cfquery name="addMeasurement"
             	datasource="#Request.DSN#"
             	username="#Request.username#"
             	password="#Request.password#">
        INSERT INTO tbMeasurement (programNo, workoutNo, weight, armSize, legSize, chestSize, waistSize) VALUES (#Form.programNo#, #Form.workoutNo#, #Form.weight# , #Form.armSize#, #Form.legSize#, #Form.chestSize#, #Form.waistSize#)
        	</cfquery>
			<cflocation url="http://cscie60.dce.harvard.edu/~eehmann/ShowMeasurements.cfm"> 
            <cfinclude template = "footer.cfm">
    	</cfif>
    </body>
</html>