<html>
   <head>
       <title>Program</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
 <cflayout type="accordion">
     <cflayoutarea title="Programs Listed">
    <cfif showPrograms.RecordCount is 0>
  		<p>You must add a Program</p>
    <cfelse>
     	<cfif showPrograms.RecordCount IS 1>
     		<h2> Your Program</h2>
     	<cfelse>    
			<h2> Your Programs</h2>
         </cfif>
        	<table>
              <tr> 
              <th>Program Name</th>
              <th>Are you restricting Carbs?</th>
              <th> Is it vegetarian</th>
              <th> How important is Cardio (1-10)</th>
              <th> How important is weight lifting (1-10)</th>
              <th> Number of hours working out</th>
              <th> How many calories are allowed?</th>
              </tr>
               <cfoutput query="showPrograms">
             <tr>
              <td>#showPrograms.programName#</td
              ><td>#showPrograms.restrictcarbs#</td>
              <td>#showPrograms.vegetarian#</td>
              <td>#showPrograms.cardioimp#</td>
              <td>#showPrograms.weightimp#</td>
              <td>#showPrograms.workWeek#</td>
              <td>#showPrograms.dailycal#</td>
             </tr>
             </cfoutput>
		</table>

<cfchart format="html"
               chartwidth="700"
               chartheight="400"
               xaxistitle="Program"
               yaxistitle="Weight"
               dataBackgroundColor="##acb3b6"
               foregroundColor="##33395a"
               title = "Average Weight per Program.  Smaller slice identifies lower weight."
               fontsize="18"
               show3D="yes"
               tipBGColor="##ccff99">

         <cfchartseries type="pie"
                        query="avgMeasurement"
                        valuecolumn="AvgByWeight"
                        itemcolumn="programName"
                        colorlist="##ff00cc,##0033cc,##ffcc00,##9900cc">
      </cfchart>
</cfif>
</cflayoutarea>
 	<cflayoutarea title ="Add program">
    <div class="aform">
<cfform action="addProgram.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/" perservedata ="Yes">
Describe the program in 200 characters?<cfinput type="text" size="200" name="programName" 
        required="yes" message="Describing the program is required.  Use up to 200 characters"><br>
Extent of restricting cards?<cfinput type="text" size="100" name="restrictcarbs" 
        required="yes" message="Explaining restriction of carbs is required.  Use up to 100 characters"><br>
Extent that diet is vegetarian? <cfinput type="text" size="200" name="vegetarian" 
        required="yes" message="Explaining the extent that you are a vegetarian is required.  Use up to 200 characters"><br>
(1 being less 10 being highest) What is the importance of cardio<cfinput type="text" size="2" name="cardioimp" validate="integer" range="1,10"
        required="yes" message="Rating importance of cardio required, rate on scale 1 through 10"><br>
 (1 being less 10 being highest) What is the importance of weight lifting<cfinput type="text" size="2" name="weightimp" validate="integer" range="1,10"
        required="yes" message="Rating the importance of weight lifting is required, rate on scale 1 through 10"><br>
Schedule number of hours working out <cfinput type="text" size="2" name="workWeek" validate="integer" range="1,21"
        required="yes" message="Entering the regular sleeping pattern is required, integer between 1 and 21"><br>
Target number of calories in diet (2000 is normal) <cfinput type="text" size="5" name="dailycal" validate="integer" range="1,99999"
        required="yes" message="Total number of calories is required">
 	 <input type="submit" name"addProgram" value="Add Program" />
</cfform>
</div>
	</cflayoutarea>
</cflayout>>
            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     