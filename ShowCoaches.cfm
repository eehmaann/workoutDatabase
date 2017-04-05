<html>
   <head>
       <title>Coaches</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
    <cfif showSession.RecordCount is 0>
    	You will need to have at least one <a href="ShowCoaches.cfm"> Coach</a>, one <a href="ShowLocations.cfm"> Location </a>, one <a href="ShowCondition.cfm"> Condition </a>  and one <a href="ShowWorkout.cfm"> Workout</a> recorded before you can record a session
      </cfif>
        <cflayout type="accordion" height="300">
     <cflayoutarea title="List of Coaches">
     <cfif showCoaches.RecordCount is 0>
     	You need to add a coach!
      <cfelse>
      	<cfif showCoaches.RecordCount is 1>
        	  <h1> Your Coach</h1>
         <cfelse>
          <h1> Your Coaches</h1>
        </cfif>
        	<table>
              <tr> 
              <th>First Name</th>
              <th>Last Name</th>
              <th> Favorite Sport</th>
              <th> Philosophy About Workouts</th>
              </tr>
               <cfoutput query="showCoaches">
             <tr>
              <td>#showCoaches.firstName#</td
              ><td>#showCoaches.lastname#</td>
              <td>#showCoaches.mainSport#</td>
              <td>#showCoaches.philosophy#</td>
             </tr>
             </cfoutput>
		</table>
        </cfif>
       </cflayoutarea>
<cflayoutarea title="Add Coach">
<div class="aform">
<p>Add a coach</p>
   <cfform action="addCoach.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
First Name: <cfinput type="text" size="30" name="firstName" 
        required="yes" message="What is the coach's first name?"><br>
 Last Name: <cfinput type="text" size="50" name="lastName" 
        required="yes" message="What is the coach's last name?"><br>
 Main sport: <cfinput type="text" size="25" name="mainSport" 
        required="yes" message="What sport does your coach most often do?"><br> 
 Philosophy: <cfinput type="text" size="200" name="philosophy" 
        required="yes" message="Breifly explain your coach's philosophy"><br> 
         <cfinput type="submit" value="Add the coach" name="submitCoach">
        </cfform>
</div>
</cflayoutarea>
<cflayoutarea title="Update Coach">
<div class="aform">
	 <cfform action="editCoach.cfm" method="post" preservedata="Yes" >
     <p> Edit a coach</p>
Which coach are you updating? 
			<select name="coachNo">
                <cfoutput query="showCoaches">
                  <option value="#showCoaches.coachNo#">#showCoaches.firstName# #showCoaches.lastName#</option>
                </cfoutput>
                </select><br>
Current First Name: <cfinput type="text" size="30" name="firstName" 
        required="yes" message="What is the coach's first name?"><br>
Current Last Name: <cfinput type="text" size="50" name="lastName" 
        required="yes" message="What is the coach's last name?"><br>
Current Main sport: <cfinput type="text" size="25" name="mainSport" 
        required="yes" message="What sport does your coach most often do?"><br> 
Current Philosophy: <cfinput type="text" size="200" name="philosophy" 
        required="yes" message="Breifly explain your coach's philosophy"><br>
         <cfinput type="submit" value="Edit the Coach" name="submit"> 
</cfform>
</div>
</cflayoutarea>
</cflayout>
            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     