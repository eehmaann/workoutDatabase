<!--- ########## Oracle Variables ########## --->

<cfparam name="Request.DSN" default="cscie60">
<cfparam name="Request.username" default="eehmann">
<cfparam name="Request.password" default="0851">


<!-- Display information for Measurement view -->
<cfquery name="showMeasurements" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
    SELECT M.weight, M.armSize, M.legSize, M.chestSize, M.waistSize, P.programName, W.workDate, M.measureNo
      FROM tbMeasurement M, tbProgram P, tbWorkout W
      WHERE M.programNo = P.programNo
      AND W.workoutNo = M.workoutNo
      ORDER By 7
</cfquery>

<!-- Display average measurement per program being used-->
<cfquery name="avgMeasurement" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
    SELECT Avg(M.weight) AS AvgByWeight, P.programName, M.programNo
    	FROM tbMeasurement M, tbProgram P
        WHERE M.programNo = P.programNo
        Group BY P.programName, M.programNo
</cfquery>

<!-- Show all information for programs view -->    
<cfquery name="showPrograms" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
    	SELECT *
        FROM tbProgram
</cfquery>

<!-- Show information on workout view -->
<cfquery name="showWorkout" datasource="#Request.DSN#"
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
       ORDER By 2
</cfquery>

<!-- Show the average weight lifted per coach used -->
<cfquery name="avgLoad" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
		SELECT C.firstName, AVG(W.load) AS carry
     		FROM tbCoach C, tbSession S, tbWorkout W
            WHERE  S.coachNo = C.coachNo AND S.workoutNo = W.workoutNo
            GROUP BY C.firstName
</cfquery>
  
<!-- Show information for session view -->
<cfquery name="showSession" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
    	SELECT C.firstName, C.lastName, L.locName, S.attendance, S.temperature, W.miles, W.liftType, W.load, W.pace, Co.conName, W.workdate, S.sessionNo
        	FROM tbLoc L, tbCoach C, tbSession S, tbWorkout W, tbCondition Co
            WHERE  S.coachNo = C.coachNo AND S.locNo= L.locNo AND S.conNo = Co.conNo 			AND S.workoutNo = W.workoutNo
            Order BY  10, 11, 2, 1
</cfquery>
  
<!-- Show information for condition view  -->
<cfquery name="showCondition" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
          	SELECT * 
            	FROM tbCondition
</cfquery>

<!-- Show information for location view -->
<cfquery name="showLoc" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
    	SELECT *
        	FROM tbLoc
</cfquery>
        
<!-- Show information for coaches view -->
<cfquery name="showCoaches" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
    	SELECT *
          FROM tbCoach
</cfquery> 
        
        
<!--Create list of of workouts that have not been linked to a measurement yet -->
<cfquery name="emptyMeasurement" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#"> 
		SELECT W.workoutNo, W.workdate, M.weight, M.workoutNo
        	FROM tbWorkout W
         	LEFT tbMeasurement M
            	ON W.workoutNo = M.workoutNo
            WHERE M.weight is NULL
</cfquery>
        
<!--Create list of workouts that have not been linked to a session yet -->
<cfquery name="emptySession" datasource="#Request.DSN#"
	username="#Request.username#"
    password="#Request.password#">       
    	SELECT W.workoutNo, W.workdate, W.miles, W.liftType, W.load, S.coachNo
        FROM tbWorkout W
          LEFT JOIN tbSession S
            ON S.workoutNo= W.workoutNo
        WHERE S.coachNo is NULL
 </cfquery>
 
 <!-- Determine frequency of sessions occuring at a locations -->
<cfquery name="countLoc" datasource="#Request.DSN#"
 	username="#Request.username#"
    password="#Request.password#"> 
    	SELECT l.locName, COUNT(S.sessionNo) AS loc
        	FROM tbSession S, tbloc L
            WHERE  S.locNo = L.locNo
            GROUP BY  L.locName
</cfquery>