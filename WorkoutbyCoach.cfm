<html>
   <head>
       <title>Workouts</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">   
    	<cfparam name="Form.coachNo" default="99999" type="numeric">
    
       <cfquery name="selectCoachWorkout" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#">       
          SELECT W.workoutNo, W.workdate, W.miles, W.liftType, W.load, W.pace, M.weight, S.coachNo, C.firstName
             FROM tbWorkout W
            	LEFT JOIN tbMeasurement M
            	ON W.workoutNo = M.workoutNo
              	LEFT JOIN tbSession S
             	ON S.workoutNo= M.workoutNo
            		LEFT JOIN tbCoach C
             		ON S.coachNo = C.coachNo
             WHERE S.coachNo= #Form.coachNo#
             ORDER BY 2
        </cfquery> 
		<cfif Form.coachNo EQ "99999">
			<cflocation url="index.cfm" addtoken="no">
		</cfif>
 		<cfif selectCoachWorkout.RecordCount is 0>
    		<p>  You have yet to work with this coach.  Would you like to see 
            	<a href="ShowWorkout.cfm"> all your workouts </a> 
            or return to 
            	<a href="index.cfm"> the homepage </a> </p>
       <cfelse>
       		<cfif selectCoachWorkout.RecordCount EQ "1">
     			<h2> Your Workout</h2>
     		<cfelse>    
				<h2> Your Workouts</h2>
         	</cfif>
        	<table>
            	<tr> 
              		<th>Perfomed on</th>
              		<th> Miles you ran</th>
              		<th> Speed (mph)</th>
              		<th> Lift you did </th>
              		<th> How much lifted</th>
              		<th> Reported weight on the day was</th>
              	</tr>
               <cfoutput query="selectCoachWorkout">
             	<tr>
              		<td>#selectCoachWorkout.workdate#</td>
                    <td>#selectCoachWorkout.miles#</td>
              		<td>#selectCoachWorkout.pace#</td>
              		<td>#selectCoachWorkout.liftType#</td>
              		<td>#selectCoachWorkout.load#</td>
              		<td>#selectCoachWorkout.weight#</td>
             	</tr>
             	</cfoutput>
			</table>
            <cfinclude template = "footer.cfm">
    	</cfif>
    </body>
</html>