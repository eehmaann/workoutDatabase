<html>
   <head>
       <title>Workouts</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
    
    <cfparam name="Form.conNo" default="99999" type="numeric">
    
       <cfquery name="selectConditionWorkout" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#">       
       select W.miles, W.liftType, W.load, W.pace, W.workdate, S.conNO
             from tbSession S, tbWorkout W
             where S.workoutNo = W.workoutNo and S.conNo = # Form.conNo#
             Order BY  4
        </cfquery> 
<cfif Form.conNo EQ "99999">
<cflocation url="index.cfm" addtoken="no">
</cfif>
 <cfif selectConditionWorkout.RecordCount is 0>
    	<p>  You have yet to work with under this condition.  Would you like to see <a href="ShowWorkout.cfm"> all your workouts </a> or return to <a href="index.cfm"> the homepage </a> </p>
       <cfelse>
       <cfif selectConditionWorkout.RecordCount IS 1>
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
              </tr>
               <cfoutput query="selectConditionWorkout">
             <tr>
              <td>#selectConditionWorkout.workdate#</td
              ><td>#selectConditionWorkout.miles#</td>
              <td>#selectConditionWorkout.pace#</td>
              <td>#selectConditionWorkout.liftType#</td>
              <td>#selectConditionWorkout.load#</td>
             </tr>
             </cfoutput>
		</table>
  <cfif selectConditionWorkout.RecordCount gt 1>
       <cfchart format="html"
               chartwidth="700"
               chartheight="400"
               xaxistitle="Date"
               yaxistitle="Lift Weight"
               title="Weight over Time"
               fontsize="18">

         <cfchartseries type="line"
                        query="selectConditionWorkout"
                        valuecolumn="load"
                        itemcolumn="workDate">
      </cfchart>   
       <cfchart format="html"
               chartwidth="700"
               chartheight="400"
               xaxistitle="Date"
               yaxistitle="Pace"
               title="Pace over Time"
               fontsize="18">

         <cfchartseries type="line"
                        query="selectConditionWorkout"
                        valuecolumn="pace"
                        itemcolumn="workDate">
      </cfchart>             
       </cfif> 
            <cfinclude template = "footer.cfm">
    </cfif>
    </body>
</html>

        
     