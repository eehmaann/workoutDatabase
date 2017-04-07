<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
		<div class="aform">
	 		<cfform action="editWorkout.cfm" method="post" preservedata="Yes" >
				
                Which workout are you updating? 
			 	<select name="workoutNo">
                	<cfoutput query="showWorkout">
                  	<option value="#showWorkout.workoutNo#">Date #showWorkout.workdate# Lift #showWorkout.liftType# Mile #showWorkout.miles#</option>
                	</cfoutput>
              </select>
 
 				Update Miles: <cfinput type="text" size="5" name="miles" 
        validate="range" range="0,300" required="yes" message="Write the number of miles you ran, if none write 0"><br>
        
 				Update Lift type: <cfinput type="text" size="80" name="liftType" 
        required="yes" message="You must type the kind of lift you practiced, or type none"><br>
 
 				Update How much did you lift: <cfinput type="text" size="5" name="load" 
        validate="integer" range="0,9999" required="yes" message="You must type how much you lifted, if none, type 0"><br>
  				Update What was your pace in miles per hours: <cfinput type="text" size="5" name="pace" 
        validate="range" range="0,300" required="yes" message="You must type the number of miles you ran, if you didn't run type 0" ><br>
         		<input type="submit" value="Fix Workout" />
         	</cfform>
        </div>
    	<cfinclude template = "footer.cfm">
    </body>
</html>