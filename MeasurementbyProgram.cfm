<html>
   <head>
       <title>Measurements</title>
    	<cfinclude template = "general.css">
   </head>
   <body>
    	<cfinclude template = "header.cfm">
        <cfparam name="Form.programNo" default="999" type="numeric">
       	<cfquery name="selectProgramMeasurements" datasource="#Request.DSN#"
         	username="#Request.username#"
          	password="#Request.password#">       
       		SELECT W.workdate, M.weight, M.armSize, M.legSize, M.chestSize, M.waistSize
             	FROM tbMeasurement M, tbWorkout W
             	WHERE M.workoutNo = W.workoutNo AND M.programNo = # Form.programNo#
             	ORDER BY  1
        </cfquery> 
		<cfif Form.programNo EQ "999">
			<cflocation url="index.cfm" addtoken="no">
		</cfif>
 		<cfif selectProgramMeasurements.RecordCount is 0>
    		<p>  You have not used this program yet.  Would you like to see <a href="ShowMeasurements.cfm"> all your measurements </a> or return to <a href="index.cfm"> the homepage </a> </p>
       <cfelse>
       		<cfif selectProgramMeasurements.RecordCount IS 1>
     			<h2> Your Measurement</h2>
     		<cfelse>    
				<h2> Your Measurements</h2>
         	</cfif>
        	<table>
              <tr> 
              	<th>Weighed in</th>
              	<th> Weight</th>
              	<th> Arm Size</th>
              	<th> Leg Size </th>
              	<th> Chest Size</th>
              	<th> Waist Size</th>
              </tr>
             <cfoutput query="selectProgramMeasurements">
             	<tr>
              		<td>#selectProgramMeasurements.workdate#</td>
                	<td>#selectProgramMeasurements.weight#</td>
              		<td>#selectProgramMeasurements.armSize#</td>
              		<td>#selectProgramMeasurements.legSize#</td>
              		<td>#selectProgramMeasurements.chestSize#</td>
              		<td>#selectProgramMeasurements.waistSize#</td>
             	</tr>
             </cfoutput>
		</table>
        	<cfif selectProgramMeasurements.RecordCount gt 1>
       			<cfchart format="html"
               		chartwidth="700"
               		chartheight="400"
               		xaxistitle="Date"
               		yaxistitle="Weight"
               		title="Weight over Time"
               		fontsize="18">

         				<cfchartseries type="line"
                        	query="selectProgramMeasurements"
                        	valuecolumn="weight"
                        	itemcolumn="workDate">
      			</cfchart>   
            	<cfinclude template = "footer.cfm">
           </cfif>
    	</cfif>
    </body>
</html>

     