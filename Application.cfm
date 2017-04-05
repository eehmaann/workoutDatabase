<!--- ########## Oracle Variables ########## --->

<cfparam name="Request.DSN" default="cscie60">
<cfparam name="Request.username" default="eehmann">
<cfparam name="Request.password" default="0851">

<cfquery name="GetPartDesc" datasource="cscie60"
          username="eehmann"
          password="0851"> 
SELECT partNo, partDesc
FROM tbPart 
</cfquery>


<cfquery name="getproductDesc" datasource="cscie60"
          username="eehmann"
          password="0851"> 
SELECT prodNo, productDesc
FROM tbProduct
</cfquery>

 <cfquery name="showMeasurements" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select M.weight, M.armSize, M.legSize, M.chestSize, M.waistSize, P.programName, W.workDate, M.measureNo
             from tbMeasurement M, tbProgram P, tbWorkout W
             where M.programNo = P.programNo
             and W.workoutNo = M.workoutNo
             Order By 7
        </cfquery>
  <cfquery name="avgMeasurement" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select Avg(M.weight) as AvgByWeight, P.programName, M.programNo
             from tbMeasurement M, tbProgram P
             where M.programNo = P.programNo
             Group by P.programName, M.programNo
        </cfquery>
    <cfquery name="showPrograms" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select *
             from tbProgram
        </cfquery>
<!-- Workout out query -->
<cfquery name="showWorkout" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#">       
          select W.workoutNo, W.workdate, W.miles, W.liftType, W.load, W.pace, M.weight, S.coachNo, C.firstName
             from tbWorkout W
            left join tbMeasurement M
             on W.workoutNo = M.workoutNo
              left join tbSession S
             on S.workoutNo= M.workoutNo
            left join tbCoach C
             on S.coachNo = C.coachNo
             Order By 2
        </cfquery>

<cfquery name="avgLoad" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select C.firstName, AVG(W.load) as carry
         from tbCoach C, tbSession S, tbWorkout W
             where  S.coachNo = C.coachNo and S.workoutNo = W.workoutNo
             Group by C.firstName
        </cfquery>
  
     <cfquery name="showSession" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select C.firstName, C.lastName, L.locName, S.attendance, S.temperature, W.miles, W.liftType, W.load, W.pace, Co.conName, W.workdate, S.sessionNo
             from tbLoc L, tbCoach C, tbSession S, tbWorkout W, tbCondition Co
             where  S.coachNo = C.coachNo and S.locNo= L.locNo and S.conNo = Co.conNo and S.workoutNo = W.workoutNo
             Order BY  10, 11, 2, 1
        </cfquery>
  
  <cfquery name="showCondition" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select * from tbCondition
        </cfquery>
        
        <cfquery name="showLoc" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select *
             from tbLoc
        </cfquery>
        
        <!-- Get all information about coaches -->
        <cfquery name="showCoaches" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select *
             from tbCoach
        </cfquery> 
        
        
       <!--Find what workouts have not been asssigned to a measuement yet -->
  <cfquery name="emptyMeasurement" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
select W.workoutNo, W.workdate, M.weight, M.workoutNo
             from tbWorkout W
            left join tbMeasurement M
             on W.workoutNo = M.workoutNo
             where M.weight is Null
             </cfquery>
           <!--Findout what Workouts have not been assigned to a session yet -->
 <cfquery name="emptySession" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#">       
          select W.workoutNo, W.workdate, W.miles, W.liftType, W.load, S.coachNo
             from tbWorkout W
              left join tbSession S
             on S.workoutNo= W.workoutNo
            where S.coachNo is null
        </cfquery>
 <!-- Track frequency at locations -->
 <cfquery name="countLoc" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select l.locName, COUNT(S.sessionNo) as loc
         from tbSession S, tbloc L
             where  S.locNo = L.locNo
             Group by  L.locName
        </cfquery>