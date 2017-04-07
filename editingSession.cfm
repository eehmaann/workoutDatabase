<html>
   <head>
       <title>Edit Session</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    
    	<cfinclude template = "header.cfm">
		<div class="aform">
	 		<cfform action="editSession.cfm" method="post" preservedata="Yes" >
				Which session are you updating? 
			 	<select name="sessionNo">
                	<cfoutput query="showSession">
                  		<option value="#showSession.sessionNo#"> Date #showSession.workdate# Coached By #showSession.firstName#, #showSession.lastName#,
                  		</option>
                	</cfoutput>
             	</select></br>
	
				Who did you work with? 
				<select name ="coachNo">
    	   <cfoutput query="showCoaches">
                  <option value="#showCoaches.coachNo#">#showCoaches.firstName# #showCoaches.lastName#</option>
                </cfoutput>
              	</select><br>

				Where was the workout?    <select name="locNo">
                <cfoutput query="showLoc">
                  <option value="#showLoc.locNo#">#showLoc.locName#</option>
                </cfoutput>
              </select><br>
              
				How were you really doing?     
                <select name="conNo">
                	<cfoutput query="showCondition">
                  		<option value="#showCondition.conNo#">#showCondition.conName#</option>
                	</cfoutput>
              	</select><br>

				Correct Number in attendance: 
                <cfinput type="text" size="6" name="attendance"
        validate="integer" required="Yes" 
        message="A number for attendance is required, up to 999999.">

				Correct Temperature: <cfinput type="text" size="3" name="temperature" 
        validate="integer" required="Yes" 
        message="Temperature must be an integer and at least an estimate is required">
        <br>    
    			<input type="submit" name"addSession" value="Edit Session" />
    		</cfform>          
    	</div>
        <cfinclude template = "footer.cfm">
    </body>
</html>