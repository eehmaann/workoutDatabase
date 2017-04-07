<html>
   <head>
       <title>Workout</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
    
    	<cfparam name="Form.programNo" default="999" type="numeric">
    	<cfparam name="Form.weight" default ="999" type="numeric">
    	<cfparam name="Form.armSize" default ="999" type="numeric">
    	<cfparam name="Form.legSize" default ="999" type="numeric">
     	<cfparam name="Form.chestSize" default ="999" type="numeric">
      	<cfparam name="Form.waistSize" default ="999" type="numeric">


        <cfquery name="edittheMeasurement"
             datasource="#Request.DSN#"
             username="#Request.username#"
             password="#Request.password#">
          	UPDATE tbMeasurement
             	SET
              		programNo =#Form.programNo#,
              		weight =#Form.weight#,
              		armSize =#Form.armSize#,
              		legSize =#Form.legSize#,
              		chestSize =#Form.chestSize#,
              		waistSize = #Form.waistSize#
              		WHERE measureNo =#Form.measureNo#
        </cfquery>
        
		<cfif Form.waistSize EQ "999">
			<cflocation url="index.cfm" addtoken="no">
		<cfelse>
			<cflocation url="ShowMeasurements.cfm" addtoken="no">
		</cfif>
        <cfinclude template = "footer.cfm">
    </body>
</html>

        
     