<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
 		<cflayout type="accordion" height="400"> 
    		<cflayoutarea title="Display">
  				<cfif showWorkout.RecordCount is 0>
  					<p>You need to add a workout before you can do anything 
                    else on the site.</p>
    			<cfelse>
     				<cfif showWorkout.RecordCount IS 1>
     					<h2> Your Workout</h2>
     				<cfelse>    
						<h2> Your Workouts</h2>
         		</cfif>
         		<p> To completely add a new entry.  Provide the information 
                about your workout on this page, then build 
                <a href="ShowSession.cfm"> a session</a> to connect to it and record
                 <a href="ShowMeasurements.cfm">your measurement</a>.  
                 If you don't do those steps, the table will be missing fields, 
                 but it still works.  The date, will be the date you entered, so
                  make sure to enter every day. </p>  <br>
        		<table>
              		<tr> 
              			<th>Perfomed on</th>
              			<th><a href="ShowCoaches.cfm">Worked with</a></th>
              			<th> Miles you ran</th>
              			<th> Speed (mph)</th>
              			<th> Lift you did </th>
              			<th> How much lifted</th>
              			<th> <a href="ShowMeasurements.cfm">
                        	Reported weight on the day was</a></th>
              		</tr>
               		<cfoutput query="showWorkout">
             		<tr>
              			<td>#showWorkout.workdate#</td>
                        <td>#showWorkout.firstName#</td>
                        <td>#showWorkout.miles#</td>
                        <td>#showWorkout.pace#</td>
                        <td>#showWorkout.liftType#</td>
                        <td>#showWorkout.load#</td>
                        <td>#showWorkout.weight#</td>
                     </tr>
             		</cfoutput>
				</table>
        	</cfif>
        </cflayoutarea>
        <cflayoutarea title="Add Workout">
 			<div class="aform">
 				<p> Add a workout.</p>
 					<cfform action="addWorkout.cfm" method="post" 
                    scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/"
                     perservedata ="Yes">
              
              			Miles: 
                        <cfinput type="text" size="5" name="miles" validate="range"
                         range="0,300" required="yes" message="Write the number of
                          miles you ran, if none write 0"> <br>
    					Lift type: 
                        <cfinput type="text" size="80" name="liftType" 
                        required="yes" message="You must type the kind of lift 
                        you practiced, or type none"><br>
                        
                        How much did you lift: 
                        <cfinput type="text" size="5" name="load" validate="integer"
                         range="0,9999" required="yes" message="You must type how
                          much you lifted, if none, type 0"><br>
     
     					What was your pace in miles per hours: 
                        <cfinput type="text" size="5" name="pace" validate="range"
                         range="0,300" required="yes" message="You must type the 
                         number of miles you ran, if you didn't run type 0" ><br>
                         
         				<input type="submit" value="Add Workout" />
      				</cfform>
 				</div>
 			</cflayoutarea>
    		<cfif showWorkout.RecordCount gt 0>
            	<cflayoutarea title="Edit Workout">
        			<p> <a href="editingWorkout.cfm"> 
                    	Does a workout need to be edited?</a></p>
        
        			<p> Examine based upon coach
                	 	<cfform action="WorkoutbyCoach.cfm" method="post" 
                        scriptSr=
                        "http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/"
                         perservedata ="Yes">
                    
                    	Who did you work with? 
                        <select name ="coachNo">
    	   					<cfoutput query="showCoaches"> 
                            	<option value="#showCoaches.coachNo#">
                                		#showCoaches.firstName#
                                        #showCoaches.lastName#
                                 </option>
                			</cfoutput>
              			</select>
 						<input type="submit" value="Select" />
                	</cfform></p>
                
                	<p> Examine based on condition.
                		<cfform action="WorkoutbyCondition.cfm" method="post"
                         	scriptSrc=
                            "http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/"
                             perservedata ="Yes">
                    
                    	How were you doing?     
                        <select name="conNo">
                			<cfoutput query="showCondition"> 
                            	<option value="#showCondition.conNo#">
                                	#showCondition.conName#
                                </option>
                			</cfoutput>
                         </select>
 						
                        <input type="submit" value="Select" />
                		</cfform></p>
            
            		<cfinclude template = "footer.cfm">
            	</cflayoutarea>
            </cfif>
          </cflayout>
      <cfinclude template = "footer.cfm">
    </body>
</html>

        
     