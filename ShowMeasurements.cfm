<html>
   <head>
       <title>Workouts</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
      <cfif showWorkout.RecordCount is 0>
		<cflocation url="ShowWorkout.cfm" addtoken="no">
    <cfelseif showPrograms.RecordCount is 0>
    	<cflocation url="ShowPrograms.cfm" addtoken="no">
    <cfelse>
    <cflayout type="accordion" height="400">
    <cflayoutarea title="Display Results">
    	<cfif showMeasurements.RecordCount is 0>
  			You need to add a measurement!
    <cfelse>
     	<cfif showMeasurements.RecordCount is 1>
     		<h2> Your First Recorded measurement</h2>
     	<cfelse>    
			<h2> Your Measurements</h2>
         </cfif> <!--End measurement not 1 or more count-->
        	<table>
              <tr> 
              <th>On</th>
              <th>Weighed</th>
              <th> Arm Size</th>
              <th> Leg Size</th>
              <th> Chest Size</th>
              <th> Waist Size</th>
              <th><a href="ShowPrograms.cfm"> Using</a></th>
              </tr>
               <cfoutput query="showMeasurements">
             <tr>
              <td>#showMeasurements.workdate#</td
              ><td>#showMeasurements.weight#</td>
              <td>#showMeasurements.armSize#</td>
              <td>#showMeasurements.legSize#</td>
              <td>#showMeasurements.chestSize#</td>
              <td>#showMeasurements.waistSize#</td>
              <td>#showMeasurements.programName#</td>
             </tr>
             </cfoutput>
		</table>
        </cfif> <!--end zero or more count-->
          <cfif showMeasurements.RecordCount gt 1>
        <cfchart format="html"
               chartwidth="700"
               chartheight="400"
               xaxistitle="Date"
               yaxistitle="Weight"
               title="Weight over Time"
               fontsize="18">

         <cfchartseries type="line"
                        query="showMeasurements"
                        valuecolumn="weight"
                        itemcolumn="workDate">
      </cfchart>
      </cfif>
        </cflayoutarea>
    <cfif emptyMeasurement.RecordCount gt 0>
    <cflayoutarea title="Add Measurement">
    <div class="aform">
    <p> Add Measurement</p>
    <cfform action="addMeasurement.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
 What day did you measure    <select name="workoutNo">
                <cfoutput query="emptyMeasurement">
                  <option value="#emptyMeasurement.workoutNo#">#emptyMeasurement.workdate#</option>
                </cfoutput>
              </select><br>
 What program was used   <select name="programNo">
                <cfoutput query="showPrograms">
                  <option value="#showPrograms.programNo#">#showPrograms.programName#</option>
                </cfoutput>
              </select><br>
              Enter your weight <cfinput type="text" size="3" name="weight" validate="integer"
        required="yes" message="Your weight must be typed as an integer">
Enter the circumference of your arm at the bicep <cfinput type="text" size="3" name="armSize" validate="integer"
        required="yes" message="Your arm size must be typed as a integer">
Enter the circumference of your leg around the thigh <cfinput type="text" size="3" name="legSize" validate="integer"
        required="yes" message="Your leg size must be type as an integer"><br>
Enter the circumference around the chest <cfinput type="text" size="3" name="chestSize" validate= "integer"
        required="yes" message="Your chest size is a required integer">
Enter the circumference around your waist <cfinput type="text" size="3" name="waistSize" validate= "integer"
        required="yes" message="Your waist size is a required integer"><br>
 
    <cfinput type="submit" name="addMeasurement" value="Add Measurement"> 
</cfform>
</div>
</cflayoutarea>
</cfif> <!-- end count for empty measurements-->
        <cfif showMeasurements.RecordCount gt 1>
        <cflayoutarea title="More Options">        
       <p> <a href="editingMeasurement.cfm">Edit a measurement</a> </p>
       <p>  <a href="ShowPrograms.cfm"> View all programs/ Create a new one</a></p>
      <p> Look at a specific program
                 <cfform action="MeasurementbyProgram.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
                                </select>
 What program was used   <select name="programNo">
                <cfoutput query="showPrograms">
                  <option value="#showPrograms.programNo#">#showPrograms.programName#</option>
                </cfoutput>
              </select>
 				<input type="submit" value="Select" />
                </cfform></p>
                </cflayoutarea>
                </cfif>     <!--End gt 1 tag-->           
</cflayout>
</cfif>
	
            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     