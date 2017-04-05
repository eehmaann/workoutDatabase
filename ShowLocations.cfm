<html>
   <head>
       <title>Locations</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
     <cfif showSession.RecordCount is 0>
    	You will need to have at least one <a href="ShowCoaches.cfm"> Coach</a>, one <a href="ShowLocations.cfm"> Location </a>, one <a href="ShowCondition.cfm"> Condition </a>  and one <a href="ShowWorkout.cfm"> Workout</a> recorded before you can record a session
      </cfif>
<cflayout type="accordion" height="400">
<cflayoutarea title="List of Locations">
      <cfif showLoc.RecordCount is 0>
      	<p>You need to add a location</p>
       <cfelse>
       <cfif showLoc.RecordCount is 1>
       <h2> Your Location</h2>
       <cfelse>
    		<h2> Your Locations</h2>
        </cfif>
     
        	<table>
              <tr> 
              <th>Location name</th>
              <th>What is the ground made of?</th>
              <th> What is the terrain like?</th>
              </tr>
               <cfoutput query="showLoc">
             <tr>
              <td>#showLoc.locName#</td
              ><td>#showLoc.ground#</td>
              <td>#showLoc.terrain#</td>
             </tr>
             </cfoutput>
		</table>
        </cfif>
       
</cflayoutarea>
<cflayoutarea title="Add Location">
 <div class="aform">
        <p> Add a new Location </p>
        
          <cfform action="addLocation.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes"> 
Location Name: <cfinput type="text" size="100" name="locName" 
        required="yes" message="What are you calling the location? Only use 100 characters"><br>
What is the ground made of: <cfinput type="text" size="50" name="ground" 
        required="yes" message="What material is the ground made of? Required use up to 50 characters"><br>
Describe Topology of the ground: <cfinput type="text" size="50" name="terrain" 
        required="yes" message="You must describe the topology of the ground under 50 characters."><br>
        <input type="submit" name="addLocation" value="Add Location" />
</cfform>
</div>
</cflayoutarea>
<cflayoutarea title="Relative Frequency per location">
	<cfchart format="html"
               chartwidth="700"
               chartheight="400"
               xaxistitle="Place"
               yaxistitle="Frequency"
               dataBackgroundColor="##acb3b6"
               foregroundColor="##33395a"
               title = "Percentage at each location"
               fontsize="18"
               show3D="yes"
               tipBGColor="##ccff99">

         <cfchartseries type="pie"
                        query="countLoc"
                        valuecolumn="loc"
                        itemcolumn="locName"
                        colorlist="##ff00cc,##0033cc,##ffcc00,##9900cc">
                        </cfchartseries>
      </cfchart>
     </cflayoutarea>
     </cflayout>
            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     