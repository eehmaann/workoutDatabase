--
-- Description:	This script contains the DDL to load
--              the tables of the
--              INVENTORY database
--
-- There are 7 tables on this DB
--
-- Author:  Eric Ehmann
--
--
-- Date:   October, 2016
--
-- ******************************************************

-- ******************************************************
--    SPOOL SESSION
-- ******************************************************

spool 2016final.lst


-- ******************************************************
--    DROP TABLES
-- Note:  Issue the appropiate commands to drop tables
-- ******************************************************



DROP TABLE tbMeasurement purge;
DROP TABLE tbProgram purge;
DROP TABLE tbSession purge;
DROP TABLE tbCondition purge;
DROP TABLE tbLoc purge;
DROP TABLE tbCoach purge;
DROP TABLE tbWorkout purge;

-- ******************************************************
--    DROP SEQUENCES
-- Note:  Issue the appropiate commands to drop sequences
-- ******************************************************
DROP sequence seq_work;
DROP sequence seq_session;
DROP sequence seq_measure;
DROP sequence seq_con;
DROP sequence seq_prog;
DROP sequence seq_loc;
DROP sequence seq_coach;

-- ******************************************************
--    CREATE TABLES
-- ******************************************************
CREATE table tbWorkout(
	workoutNo	number(6,0)			not null
	CONSTRAINT pk_tbWorkout primary key,
	workDate		date					not null,
	  miles			number(5,2)		default 0,
	  liftType		char(80)		default 'none',
	  load			number(5,0)		default 0,
	  pace			number (5,2)	default 0
);

CREATE table tbCoach (
        coachNo         number(5,0)                 not null
        CONSTRAINT pk_tbCoach primary key CHECK (coachNo between '01' and '99999'),
        firstName     varchar2(30)            not null,
        lastName		varchar2(50)            not null,
        mainSport		varchar2(25)			default 'unknown' not null,
        philosophy      varchar2(200)            default 'unknown' not null
);


CREATE table tbLoc (
        locNo          number(5,0)                 not null
         constraint pk_tbLoc primary key CHECK (locNo between '01' and '99999'),
        locName       varchar2(100)            not null,
        ground  	varchar2(50)             default 'unknown' not null,
        terrain		varchar2(50)			default 'unknown' not null
);

CREATE table tbCondition (
        conNo          number (5,0)                not null
        constraint pk_tbCondition primary key  check (conNo between '001' and '999'),
        conName			varchar2(100)			not null,
        sleep          number(2)                not null
        constraint rq_sleep CHECK (sleep between '0' and '24'),
        sickness     varchar2(50)           default 'feeling well' not null,
        mainInjury		varchar2(50)		default 'no injuries'  not null
);

CREATE table tbSession (
        sessionNo      number (6,0)           not null
        CONSTRAINT pk_tbSession primary key,
        coachNo         number(5,0)               not null
        CONSTRAINT fk_coachNo_tbSession references tbCoach (coachNo) on delete cascade,
         locNo          number(5,0)               not null
         CONSTRAINT fk_locNo_tbSession references tbLoc (locNo) on delete cascade,
           conNo          number (5,0)               not null
           CONSTRAINT fk_conNo_tbSession references tbCondition (conNo) on delete cascade,
           workoutNo	number(6,0)			not null
		CONSTRAINT fk_workoutNo_tbsession references tbWorkout (workoutNo) on delete cascade,
        attendance       number (6,0)           null,
        temperature		number(3,0)				null   
);

CREATE table tbProgram (
        programNo        number(5,0)                 not null
        constraint pk_tbProgram primary key CHECK (programNo between '1' and '99'),
        programName varchar2(200)	         default 'none' not null,
        restrictcarbs      varchar2(100)          default 'no' not null,
        vegetarian      varchar2(200)            default 'no' not null,
        cardioimp		number(2)				default 1 not null
        Check(cardioimp between 1 and 10),
        weightimp	number(2)				default 1 not null
        Check(weightimp between 1 and 10),
        workWeek	number (2,0)		default 0 not null
         constraint rg_workWeek CHECK (workWeek between 1 and 21),
         dailycal	number (5,0)	default 2000 not null
         constraint rg_dailycal CHECK (dailycal between 800 and 99999)       
);

CREATE table tbMeasurement (
        measureNo        number(5,0)                 not null
        constraint pk_measureNo primary key check (measureNo between '1' and '99999'),
        programNo		number(3)                 not null
        CONSTRAINT fk_programNo_tbMeasurement references tbProgram (programNo) on delete cascade,
        workoutNo	number(6,0)			not null
		CONSTRAINT fk_workoutNo_tbMeasurement references tbWorkout (workoutNo) on delete cascade,
        weight			number(3,0)				not null,
        armSize			number(3,0)				null,
        legSize			number(3,0)				null,
        chestSize		number(3,0)				null,
        waistSize       number(3,0)             null		
);
	 
	
-- ******************************************************
--    CREATE SEQUENCES
-- ******************************************************
CREATE sequence seq_work
    increment by 1
    start with 1;

CREATE sequence seq_coach
    increment by 1
    start with 1;
    
CREATE sequence seq_loc
    increment by 1
    start with 1;
    
CREATE sequence seq_con
    increment by 1
    start with 1;
    
CREATE sequence seq_session
    increment by 1
    start with 1;   
    
CREATE sequence seq_prog
    increment by 1
    start with 1;
        
CREATE sequence seq_measure
    increment by 1
    start with 1;
    


    
    
-- ******************************************************
--    POPULATE TABLES
--
-- Note:  Follow instructions and data provided on PS-3
--        to populate the tables
-- ******************************************************
/* inventory tbWorkout */
INSERT into tbWorkout values (seq_work.nextval, to_date('09-10-2016','mm-dd-yyyy'), 0, 'push press', 100, 0 );
INSERT into tbWorkout values (seq_work.nextval, to_date('09-17-2016','mm-dd-yyyy'), 0, 'push press', 102, 0);
INSERT into tbWorkout values (seq_work.nextval, to_date('10-10-2016','mm-dd-yyyy'), 0, 'back squat',  190, 0);
INSERT into tbWorkout values (seq_work.nextval, to_date('10-24-2016','mm-dd-yyyy'), 0, 'back squat',  135, 0);
INSERT into tbWorkout values (seq_work.nextval, to_date('11-12-2016','mm-dd-yyyy'), 1, 'lunges',  170, 3);
INSERT into tbWorkout values (seq_work.nextval, to_date('11-25-2016','mm-dd-yyyy'), 4, 'none', 0, 6.25 );


/* inventory tbCoach */
INSERT into tbCoach values (seq_coach.nextval, 'Nick', 'DeTar-Koch', 'swimming', 'Body awareness is essential');
INSERT into tbCoach values (seq_coach.nextval, 'Joey', 'Kyle', 'Climbing', 'Workouts should be fun');
INSERT into tbCoach values (seq_coach.nextval, 'JT', 'Scott', 'Circus', 'Workouts builds character');
INSERT into tbCoach values (seq_coach.nextval, 'Chris', 'Payne', 'Obstacles', 'Positivity wins');
INSERT into tbCoach values (seq_coach.nextval, 'Eric', 'Ehmann', 'Running', 'Turtle Power!');

/* inventory tbLoc */
INSERT into tbLoc values (seq_loc.nextval, 'CrossFit Somerville', 'rubber', 'wobbly');
INSERT into tbLoc values (seq_loc.nextval, 'Summit Avenue', 'cement', 'steep incline');
INSERT into tbLoc values (seq_loc.nextval, 'Harvard Stadium', 'cement', 'stairs');
INSERT into tbloc values (seq_loc.nextval, 'Charles River', 'pavement', 'flat');

/* inventory tbCondition */
INSERT into tbCondition values (seq_con.nextval, 'Feeling Great', 6, 'healthy', 'no injuries');
INSERT into tbCondition values (seq_con.nextval, 'Run Recovery', 6, 'health', ' sore quads');
INSERT into tbCondition values (seq_con.nextval, 'Tired', 4, 'head cold', 'whole body drained');
INSERT into tbCondition values (seq_con.nextval, 'Back Pain', 5, 'stomach pain', 'back');
INSERT into tbCondition values (seq_con.nextval, 'Sharp pain', 5, 'healthy', 'arms');

/* inventory tbSession */
INSERT into tbSession values (seq_session.nextval, 1, 1, 5, 1, 8, 68 );
INSERT into tbSession values (seq_session.nextval, 3, 1, 1,  2, 3, 68 );
INSERT into tbSession values (seq_session.nextval, 1, 1, 2, 3, 4, 68);
INSERT into tbSession values (seq_session.nextval, 3, 1, 3,  4, 8, 68);
INSERT into tbSession values (seq_session.nextval, 4, 3, 3,  5, 300, 53);
INSERT into tbSession values (seq_session.nextval, 5, 2, 5,  6, 0, 48 );

/* inventory tbProgram */
INSERT into tbProgram values (seq_prog.nextval, 'supplement free relaxed', 'No', 'No', 3, 3, 3, 2500);
INSERT into tbProgram values (seq_prog.nextval, 'beach body lifts', 'Heavily', 'Mostly',  5, 8, 7, 1800);
INSERT into tbProgram values (seq_prog.nextval, 'hobbyist', 'No', 'Not really',  5, 5, 5, 2200);
INSERT into tbProgram values (seq_prog.nextval, 'beach body cardio', 'Heavily', 'Mostly', 8, 5, 10, 1800);

/* inventory tbMeasurement */
INSERT into tbMeasurement values (seq_measure.nextval, 1, 1, 195, 11, 24, 40, 38);
INSERT into tbMeasurement values (seq_measure.nextval, 3, 2, 192, 11, 24, 40, 38);
INSERT into tbMeasurement values (seq_measure.nextval, 3, 3, 190, 11, 24, 40, 36);
INSERT into tbMeasurement values (seq_measure.nextval, 2, 4, 176, 12, 23, 39, 33);
INSERT into tbMeasurement values (seq_measure.nextval, 4, 5, 175, 12, 23, 39, 33);
INSERT into tbMeasurement values (seq_measure.nextval, 4, 6, 168, 13, 21, 38, 32);
INSERT into tbMeasurement values (seq_measure.nextval, 4, 6, 168, 13, 21, 38, 32);



-- ******************************************************
--    Create triggers
--
-- Note:  Issue the appropriate commands to show your data
-- ******************************************************
CREATE or REPLACE trigger TR_new_workout_IN
   /* trigger executes BEFORE an INSERT into the GIFT table */
   before insert on tbWorkout
   for each row
   begin

      SELECT seq_work.nextval, sysdate
           into :new.workoutNo, :new.workdate
            FROM dual;
   end TR_new_workout_IN;
.
/
CREATE or REPLACE trigger TR_new_Coach_IN
   /* trigger executes BEFORE an INSERT into the GIFT table */
   before insert on tbCoach
   for each row
   begin

      SELECT seq_coach.nextval
           into :new.coachNo
            FROM dual;
   end TR_new_Coach_IN;
.
/
CREATE or REPLACE trigger TR_new_Location_IN
   before insert on tbloc
   for each row
   begin

      SELECT seq_loc.nextval
           into :new.locNo
            FROM dual;
   end TR_new_Location_IN;
.
/
CREATE or REPLACE trigger TR_new_Condition_IN
   before insert on tbCondition
   for each row
   begin

      SELECT seq_con.nextval
           into :new.conNo
            FROM dual;
   end TR_new_Condition_IN;
.
/
CREATE or REPLACE trigger TR_new_session_IN
   before insert on tbSession
   for each row
   begin

      SELECT seq_session.nextval
           into :new.sessionNo
            FROM dual;
   end TR_new_session_IN;
.
/
CREATE or REPLACE trigger TR_new_program_IN
   before insert on  tbProgram
   for each row
   begin

      SELECT seq_prog.nextval
           into :new.programNo
            FROM dual;
   end TR_new_program_IN;
.
/
CREATE or REPLACE trigger TR_new_measurement_IN
 
   before insert on tbMeasurement
   for each row
   begin

      SELECT seq_measure.nextval
           into :new.measureNo 
            FROM dual;
   end TR_new_measurement_IN;
.
/
-- ******************************************************
--    Test triggers
--
-- ******************************************************
SELECT * from tbWorkout;
INSERT into tbWorkout (miles, liftType, load, pace)  values (26.2, 'backsquat', 200, 5.6);
insert into tbWorkout (miles, liftType, load, pace) values (8.0, 'Push Press', 95, 8.0);
SELECT * from tbWorkout;

SELECT * from tbCoach;
Insert into tbCoach (firstName, lastName, mainSport, philosophy) values ('Jim', 'Bean','Football', 'Go TEAM');
SELECT * from tbCoach;
SELECT *from tbLoc;
INSERT into tbLoc (locName, ground, terrain) values ('Carson Beach', 'sand', 'slanted');
SELECT *from tbLoc;
SELECT * from tbCondition;
INSERT into tbCondition (conName, sleep, sickness, mainInjury) values ('Quad dull pain', 3, 'feeling health', 'Quads');
Select * from tbCondition;
SELECT * from tbSession;
INSERT into tbSession (coachNo, locNo, conNo, workoutNo, attendance, temperature) values (2, 4, 3,  7, 25, 48 );
SELECT * from tbSession;
SELECT * from tbProgram;
INSERT into tbProgram(programName, restrictcarbs, vegetarian, cardioimp, weightimp, workWeek, dailycal) values ('purge', 'Heavily', 'Completely', 10, 5, 20, 800);
SELECT * from tbProgram;
SELECT * from tbMeasurement;
INSERT into tbMeasurement (programNo, workoutNo, weight, armSize, legSize, chestSize, waistSize) values (4, 2, 169, 13, 21, 38, 28);
SELECT * from tbMeasurement;
-- ******************************************************
--    VIEW TABLES
--
-- Note:  Issue the appropiate commands to show your data
-- ******************************************************

SELECT * FROM tbWorkout;
SELECT * FROM tbCoach;
SELECT * FROM tbLoc;
SELECT * FROM tbCondition;
SELECT * FROM tbSession;
SELECT * FROM tbProgram;
SELECT * FROM tbMeasurement;

-- ******************************************************
--    QUALITY CONTROLS
--
--        *) Entity integrity
INSERT into tbWorkout  values (26.2, 'backsquat', 200, 5.6);
INSERT into tbCoach values (seq_coach.nextval, 'Cher', 'Climbing', 'Workouts should be fun');

--        *) Referential integrity
INSERT into tbSession values (seq_session.nextval, 20, 1, 5, 1, 8, 68 );
INSERT into tbMeasurement values (seq_measure.nextval, 1, 15, 195, 11, 24, 40, 38);
--        *) Column constraints
INSERT into tbCondition values (seq_con.nextval, 'Tired', 4.25, 'head cold', 'whole body drained');
INSERT into tbCoach values (seq_coach.nextval, 'Joey', 'Kyle', 'Climbing under the peaks of westford by Chaven and then swimming', 'Workouts should be fun');


-- ******************************************************
--    END SESSION
-- ******************************************************

spool off
