<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
		<div class="aform">
	 		<cfform action="editMeasurement.cfm" method="post" preservedata="Yes" >
				
                Which measurement are you updating? 
			 	<select name="measureNo">
                	<cfoutput query="showMeasurements">
                  		<option value="#showMeasurements.measureNo#">Weight 			#showMeasurements.weight# Date #showMeasurements.workdate# </option>
                	</cfoutput>
                 </select><br>
 				
                Correct program used   
 				<select name="programNo">
                	<cfoutput query="showPrograms">
                  		<option value="#showPrograms.programNo#">#showPrograms.programName#</option>
                	</cfoutput>
              	</select><br>
              	
                Enter your correct weight 
              	<cfinput type="text" size="3" name="weight" validate="integer"
        required="yes" message="Your weight must be typed as an integer">
        
				Enter the correct circumference of your arm at the bicep 
            	<cfinput type="text" size="3" name="armSize" validate="integer"
        required="yes" message="Your arm size must be typed as a integer">

				Enter the correct circumference of your leg around the thigh 
            	<cfinput type="text" size="3" name="legSize" validate="integer"
        required="yes" message="Your leg size must be type as an integer"><br>

				Enter the correct circumference around the chest 
            	<cfinput type="text" size="3" name="chestSize" validate= "integer"
        required="yes" message="Your chest size is a required integer">
        
				Enter the correct circumference around your waist 
            	<cfinput type="text" size="3" name="waistSize" validate= "integer"
        required="yes" message="Your waist size is a required integer">
 			<br>
    			<cfinput type="submit" name="editMeasurement" value="Edit Measurement"> 
			</cfform>
    	</div>
      	<cfinclude template = "footer.cfm">
    </body>
</html>

        
     