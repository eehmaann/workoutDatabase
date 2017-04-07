<html>
   <head>
       <title>Conditions</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
      	<cfif showSession.RecordCount is 0>
    		You will need to have at least one <a href="ShowCoaches.cfm"> 
            Coach</a>, one <a href="ShowLocations.cfm"> Location </a>, one 
            <a href="ShowCondition.cfm"> Condition </a>  and one <a href=
            "ShowWorkout.cfm"> Workout</a> recorded before you can record a session
      	</cfif>
      	<cflayout type="accordion" height="300">
      		<cflayoutarea title="Condition List">
      			<cfif showCondition.RecordCount is 0>
      				<p>You need to add a Condition</p>
       			<cfelse>
       				<cfif showCondition.RecordCount is 1>
       					<h2> Your Condition</h2>
       				<cfelse>
    					<h2> Your Conditions</h2>
        			</cfif>
   
        			<table>
              			<tr> 
              				<th>How you felt</th>
              				<th>Hours slept</th>
              				<th>Any sickness</th>
              				<th>Most troubling area</th>
              			</tr>
               		<cfoutput query="showCondition">
             			<tr>
              				<td>#showCondition.conName#</td>
              				<td>#showCondition.sleep#</td>
              				<td>#showCondition.sickness#</td>
              				<td>#showCondition.mainInjury#</td>
             			</tr>
             		</cfoutput>
					</table>
        		</cfif>
        	</cflayoutarea>
        	<cflayoutarea title="Add a condition">
        		<div class="aform">
        			<p>  Add another condition </p>
        			<cfform action="addCondition.cfm" method="post" 
                    scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/"
                    perservedata ="Yes">
                    
        				Name the condition
                        <cfinput type="text" size="100" name="conName" 
                        required="yes" message="Include a description for further
                        use, under 100 characters">

						Hours Slept: 
                        <cfinput type="text" size="2" name="sleep" 
                        validate="range" range="0,24" required="Yes" 
                        message="You must list how many full hours of sleep are you
                        getting under this condition."><br>
                        
						Are you experiencing any sickness or feeling healthy
                        <cfinput type="text" size="50" name=" sickness " 
                        required="yes" message="State any sickness or type feeling
                        well.  Use up to 50 characters"><br>
                        
						Describe most pertinent injury, or type no injuries?
                        <cfinput type="text" size="50" name="mainInjury" 
                        required="yes" message="This is required.  Use up to 50
                        characters"><br>
 						
                        <input type="submit" name="addCon" value="Add Condition" />
      				</cfform>
      			</div>
      		</cflayoutarea>
      	</cflayout>
        <cfinclude template = "footer.cfm">
    </body>
</html>

        
     