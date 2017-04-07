<html>
   <head>
       <title>Sessions</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
    	<cfif showWorkout.RecordCount is 0>
  			<cflocation url="ShowWorkout.cfm" addtoken="no">
    	<cfelseif showCoaches.RecordCount is 0>
    		<cflocation url="ShowCoaches.cfm" addtoken="no">
    	<cfelseif showLoc.RecordCount is 0>
    		<cflocation url="ShowLocations.cfm" addtoken="no">
    	<cfelseif showCondition.RecordCount is 0>
    		<cflocation url="ShowCondition.cfm" addtoken="no">
    	<cfelse>
    		<cflayout type="accordion" height="400">
    			<cfif emptySession.RecordCount gt 0>
    				<cflayoutarea title="Add Session">
    					<div class="aform">
   							<p> Add a session</p>
        					<cfform action="addSession.cfm" method="post" 
                            scriptSrc=
                            "http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/"
                            perservedata ="Yes">

							Which workout was this? 
                            <select name="workoutNo"
								<cfoutput query="emptySession">
                            		<option value="#emptySession.workoutNo#">
                                		Date #emptySession.workdate# 
                                		Lift #emptySession.liftType# 
                                		#emptySession.load# 
                                        Mile #emptySession.miles#
                                	</option>
                				</cfoutput> 
              				</select><br>
                            
						Who did you work with? 
                        <select name ="coachNo">
							<cfoutput query="showCoaches">
                            	<option value="#showCoaches.coachNo#">
                                	#showCoaches.firstName# 
                                	#showCoaches.lastName#
                                </option>
                			</cfoutput>
              			</select><br>
                        
                        Where was the workout?    
                        <select name="locNo">
                			<cfoutput query="showLoc">
                  				<option value="#showLoc.locNo#">
                                	#showLoc.locName#
                                </option>
                			</cfoutput>
              			</select><br>
                        
						How were you doing?     
                        <select name="conNo">
							<cfoutput query="showCondition">
                  				<option value="#showCondition.conNo#">
                                	#showCondition.conName#
                                </option>
                			</cfoutput>
              			</select><br>
              	
                		Number in attendance: 
                        <cfinput type="text" size="6" name="attendance"
                        validate="integer" required="Yes" 
                        message=
                        "A number for attendance is required, up to 999999.">
                        
						Temperature: 
                        <cfinput type="text" size="3" name="temperature" 
                        validate="integer" required="Yes" message=
                        "Temperature must be an integer and at least an estimate is
                         required"><br>
                             
    					<input type="submit" name"addSession" value="Add Session" />
    				</cfform>          
    			</div>
     		</cflayoutarea>
    	</cfif> <!--End add-->
    	<cflayoutarea title="Session Display">
			<cfif showSession.RecordCount is 0>
        		You need to add a session!
         	<cfelse>
        		<cfif showSession.RecordCount is 1>
    				<h2> Your Session</h2>
            	<cfelse>
            		<h2> Your Sessions</h2>
            	</cfif>        
        		<table>
              		<tr> 
              			<th><a href="ShowCoaches.cfm">Led By</a></th>
              			<th><a href="ShowLocations.cfm">Location</a></th>
              			<th>Number in Attendnce</th>
              			<th>Temperature</th>
              			<th> Miles Ran </th>
              			<th> Pace</th>
              			<th> You Performed </th>
              			<th> Weight Lifted </th>
              			<th><a href="ShowCondition.cfm"> Condition</a></th>
              		</tr>
               		<cfoutput query="showSession">
             		<tr>
              			<td>#showSession.firstName# #showSession.lastName#</td>
                        <td>#showSession.locName#</td>
                        <td>#showSession.attendance#</td>
                        <td>#showSession.temperature#</td>
                        <td>#showSession.miles#</td>
              			<td>#showSession.pace#</td>
              			<td>#showSession.liftType#</td>
              			<td>#showSession.load#</td>
              			<td>#showSession.conName#</td>
             		</tr>
             		</cfoutput>
				</table>
        	</cfif>
        </cflayoutarea>
        <cflayoutarea title="More Options">
        	<p> Related Searches</p>
 			<p> <a href="ShowCoaches.cfm"> See all coaches/ add one</a></p>
            <p><a href="ShowLocations.cfm"> See all locations/ add one</a></p>
            <p> <a href="ShowCondition.cfm"> See all conditions/ add one</a></p>
            
			<cfif showSession.RecordCount gt 1>
   				<cfchart format="html"
               		chartwidth="700"
               		chartheight="400"
               		xaxistitle="First Name"
               		yaxistitle="Lift Weight"
               		title="Best coaches for lifting"
               		fontsize="18">
                    
				   <cfchartseries type="bar"
                        query="avgLoad"
                        valuecolumn="carry"
                        itemcolumn="firstName">
                   </cfchartseries>
   				</cfchart>
   			</cfif>
   		</cflayoutarea>
    </cflayout>
   </cfif>
   <cfinclude template = "footer.cfm">
 </body>
</html>

        
     