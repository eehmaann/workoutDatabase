<html>
   <head>
       <title>Workouts</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
    <cfif showWorkout.RecordCount is 0>
		<cflocation url="ShowWorkout.cfm" addtoken="no">
    </cfif>
    <div class="aform">
    <h2> Areas of your development </h2>
    	<div class="mapping">
        <cflayout type="accordion" height="250">
        	<cflayoutarea title="Workout"> 
        	<ul> 
            	<li>Workouts </li>
                <li> <a href="ShowWorkout.cfm"> See all Workouts/ Add a Workout </a></li>
                <li> Search by Coach </li>
                	<li> <cfform action="WorkoutbyCoach.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
                    Who did you work with? <select name ="coachNo">
    	   <cfoutput query="showCoaches">
                  <option value="#showCoaches.coachNo#">#showCoaches.firstName# #showCoaches.lastName#</option>
                </cfoutput>
              </select>
 				<input type="submit" value="Select" />
                </cfform></li>
                <li> Search by Condition</li>
                <li> <cfform action="WorkoutbyCondition.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
                    How were you doing?     <select name="conNo">
                <cfoutput query="showCondition">
                  <option value="#showCondition.conNo#">#showCondition.conName#</option>
                </cfoutput>
              </select>
 				<input type="submit" value="Select" />
                </cfform></li>
                <li> Delete a workout</li>
                <li>        <cfform action="deleteWorkout.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
       Which workout was this? <select name="workoutNo">
                <cfoutput query="showWorkout">
                  <option value="#showWorkout.workoutNo#">Date #showWorkout.workdate# Lift #showWorkout.liftType# #showWorkout.load# Mile #showWorkout.miles#</option>
                </cfoutput>
                 </select>
 				<input type="submit" value="Select" />
                 </cfform></li>
                 <li> <a href="editingWorkout.cfm">Edit a workout</a> </li>
                </ul>
                </cflayoutarea>
              
               <cflayoutarea title="Measurements" style="height:200;"> 
                <ul>
                <li> Measurements</li>
                <li> <a href="ShowMeasurements.cfm"> See all measurements/ Add a new one </a> </li>
                <li> Measurements by Program </li>
                <li> <cfform action="MeasurementbyProgram.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
                                </select>
 What program was used   <select name="programNo">
                <cfoutput query="showPrograms">
                  <option value="#showPrograms.programNo#">#showPrograms.programName#</option>
                </cfoutput>
              </select>
 				<input type="submit" value="Select" />
                </cfform></li>
                
                  <li> <a href="editingMeasurement.cfm">Edit a measurement</a> </li>
                  <li> <a href="ShowPrograms.cfm"> Show all Programs / add</a></li>
                </ul>
                </cflayoutarea>
              
                
                <cflayoutarea title="Details" style="height:200;">     
                <ul>
                	<li> Details</li>
                    <li> <a href="ShowCoaches.cfm"> See all coaches/ add one</a></li>
                    <li> <a href="ShowLocations.cfm"> See all locations/ add one</a></li>
                    <li> <a href="ShowCondition.cfm"> See all conditions/ add one</a></li>
                    <li> <a href="ShowSession.cfm"> See your sessions/ add one</a></li>
                </ul>
                </cflayoutarea>
                  </cflayout>
                </div>
            
</div>
            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     