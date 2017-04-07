<html>
   <head>
       <title>Workout</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
    
    	<cfparam name="Form.miles" default="999" type="numeric">
    	<cfparam name="Form.liftType" default ="AAA" type="string">
    	<cfparam name="Form.load" default ="9999" type="numeric">
    	<cfparam name="Form.pace" default ="999.99" type="numeric">


		<!-- updates workout information based upon previously given information -->
        <cfquery name="edittheWorkout"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          	UPDATE tbWorkout
            	SET 		
              		miles =#Form.miles#,
              		liftType ='#Form.liftType#',
              		load=#Form.load#,
              		pace=#Form.pace#
              WHERE workoutNo =#Form.workoutNo#
        </cfquery>
		<cfif Form.load EQ "99999">
			<cflocation url="index.cfm" addtoken="no">
		<cfelse>
			<cflocation url="ShowWorkout.cfm" addtoken="no">
		</cfif>
            <cfinclude template = "footer.cfm">
    </body>
</html>