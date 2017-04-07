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
DROP SEQUENCE seq_work;
DROP SEQUENCE seq_session;
DROP SEQUENCE seq_measure;
DROP SEQUENCE seq_con;
DROP SEQUENCE seq_prog;
DROP SEQUENCE seq_loc;
DROP SEQUENCE seq_coach;

-- ******************************************************
--    CREATE TABLES
-- ******************************************************
CREATE TABLE tbWorkout(
	workoutNo          number(6,0)        NOT NULL
		CONSTRAINT pk_tbWorkout  PRIMARY KEY,
	workdate           date               NOT NULL,
	miles              number(5,2)        DEFAULT 0,
	liftType   	       char(80)           DEFAULT 'none',
	load				       number(5,0)        DEFAULT 0,
	pace				       number (5,2)       DEFAULT 0
);

CREATE TABLE tbCoach (
  coachNo            number(5,0)        NOT NULL
    CONSTRAINT pk_tbCoach PRIMARY KEY CHECK (coachNo between '01' and '99999'),
  firstName         varchar2(30)        NOT NULL,
  lastName          varchar2(50)        NOT NULL,
  mainSport         varchar2(25)        DEFAULT 'unknown' NOT NULL,
  philosophy        varchar2(200)       DEFAULT 'unknown' NOT NULL
);


CREATE TABLE tbLoc (
  locNo              number(5,0)        NOT NULL
        CONSTRAINT pk_tbLoc PRIMARY KEY CHECK (locNo between '01' and '99999'),
  locName            varchar2(100)      NOT NULL,
  ground             varchar2(50)       DEFAULT 'unknown' NOT NULL,
  terrain	           varchar2(50)       DEFAULT 'unknown' NOT NULL
);

CREATE TABLE tbCondition (
  conNo          	number (5,0)          NOT NULL
    CONSTRAINT pk_tbCondition PRIMARY KEY  CHECK (conNo between '001' and '999'),
  conName         varchar2(100)			    NOT NULL,
  sleep           number(2)             NOT NULL
    CONSTRAINT rq_sleep CHECK (sleep between '0' and '24'),
  sickness        varchar2(50)          DEFAULT 'feeling well' NOT NULL,
  mainInjury      varchar2(50)          DEFAULT 'no injuries'  NOT NULL
);

CREATE TABLE tbSession (
  sessionNo       number (6,0)          NOT NULL
    CONSTRAINT pk_tbSession PRIMARY KEY,
  coachNo         number(5,0)           NOT NULL
    CONSTRAINT fk_coachNo_tbSession REFERENCES tbCoach (coachNo) ON DELETE CASCADE,
  locNo          	number(5,0)           NOT NULL
    CONSTRAINT fk_locNo_tbSession REFERENCES tbLoc (locNo) ON DELETE CASCADE,
  conNo          	number (5,0)          NOT NULL
    CONSTRAINT fk_conNo_tbSession REFERENCES tbCondition (conNo) ON DELETE CASCADE,
  workoutNo	      number(6,0)           NOT NULL
		CONSTRAINT fk_workoutNo_tbsession REFERENCES tbWorkout (workoutNo) ON DELETE CASCADE,
  attendance      number (6,0)        	NULL,
  temperature	    number(3,0)           NULL   
);

CREATE TABLE tbProgram (
	programNo       number(5,0)           NOT NULL
    CONSTRAINT pk_tbProgram PRIMARY KEY CHECK (programNo between '1' and '99'),
  programName 	  varchar2(200)	       	DEFAULT 'none' NOT NULL,
  restrictcarbs   varchar2(100)         DEFAULT 'no' NOT NULL,
  vegetarian      varchar2(200)         DEFAULT 'no' NOT NULL,
  cardioimp		    number(2)	            DEFAULT 1 NOT NULL
    CHECK(cardioimp between 1 and 10),
   weightimp      number(2)	            DEFAULT 1 NOT NULL
    CHECK(weightimp between 1 and 10),
  workWeek        number (2,0)          DEFAULT 0 NOT NULL
    CONSTRAINT rg_workWeek CHECK (workWeek between 1 and 21),
  dailycal        number (5,0)          DEFAULT 2000 NOT NULL
    CONSTRAINT rg_dailycal CHECK (dailycal between 800 and 99999)       
);

CREATE TABLE tbMeasurement (
  measureNo       number(5,0)             NOT NULL
    CONSTRAINT pk_measureNo PRIMARY KEY CHECK (measureNo between '1' and '99999'),
  programNo       number(3)               NOT NULL
    CONSTRAINT fk_programNo_tbMeasurement REFERENCES tbProgram (programNo) ON DELETE CASCADE,
  workoutNo	      number(6,0)	            NOT NULL
		CONSTRAINT fk_workoutNo_tbMeasurement REFERENCES tbWorkout (workoutNo) ON DELETE CASCADE,
  weight          number(3,0)             NOT NULL,
  armSize	        number(3,0)				      NULL,
  legSize			    number(3,0)				      NULL,
  chestSize	      number(3,0)				      NULL,
  waistSize       number(3,0)             NULL		
);
	 
	
-- ******************************************************
--    CREATE SEQUENCES
-- ******************************************************
CREATE SEQUENCE seq_work
  INCREMENT BY 1
  START WITH 1;

CREATE SEQUENCE seq_coach
  INCREMENT BY 1
  START WITH 1;
    
CREATE SEQUENCE seq_loc
  INCREMENT BY 1
  START WITH 1;
    
CREATE SEQUENCE seq_con
  INCREMENT BY 1
  START WITH 1;
    
CREATE SEQUENCE seq_session
  INCREMENT BY 1
  START WITH 1;   
    
CREATE SEQUENCE seq_prog
  INCREMENT BY 1
  START WITH 1;
        
CREATE SEQUENCE seq_measure
  INCREMENT BY 1
  START WITH 1;
    


    
    
-- ******************************************************
--    POPULATE TABLES
--
-- Note:  Follow instructions and data provided on PS-3
--        to populate the tables
-- ******************************************************
/* inventory tbWorkout */
INSERT INTO tbWorkout VALUES (seq_work.nextval, to_date('09-10-2016','mm-dd-yyyy'), 0, 'push press', 100, 0 );
INSERT INTO tbWorkout VALUES (seq_work.nextval, to_date('09-17-2016','mm-dd-yyyy'), 0, 'push press', 102, 0);
INSERT INTO tbWorkout VALUES (seq_work.nextval, to_date('10-10-2016','mm-dd-yyyy'), 0, 'back squat',  190, 0);
INSERT INTO tbWorkout VALUES (seq_work.nextval, to_date('10-24-2016','mm-dd-yyyy'), 0, 'back squat',  135, 0);
INSERT INTO tbWorkout VALUES (seq_work.nextval, to_date('11-12-2016','mm-dd-yyyy'), 1, 'lunges',  170, 3);
INSERT INTO tbWorkout VALUES (seq_work.nextval, to_date('11-25-2016','mm-dd-yyyy'), 4, 'none', 0, 6.25 );


/* inventory tbCoach */
INSERT INTO tbCoach VALUES (seq_coach.nextval, 'Nick', 'DeFronz', 'swimming', 'Body awareness is essential');
INSERT INTO tbCoach VALUES (seq_coach.nextval, 'Joey', 'Crass', 'Climbing', 'Workouts should be fun');
INSERT INTO tbCoach VALUES (seq_coach.nextval, 'JT', 'Stevens', 'Circus', 'Workouts builds character');
INSERT INTO tbCoach VALUES (seq_coach.nextval, 'Chris', 'Kringle', 'Obstacles', 'Positivity wins');
INSERT INTO tbCoach VALUES (seq_coach.nextval, 'Eric', 'Ehmann', 'Running', 'Turtle Power!');

/* inventory tbLoc */
INSERT INTO tbLoc VALUES (seq_loc.nextval, 'CrossFit Somerville', 'rubber', 'wobbly');
INSERT INTO tbLoc VALUES (seq_loc.nextval, 'Summit Avenue', 'cement', 'steep incline');
INSERT INTO tbLoc VALUES (seq_loc.nextval, 'Harvard Stadium', 'cement', 'stairs');
INSERT INTO tbloc VALUES (seq_loc.nextval, 'Charles River', 'pavement', 'flat');

/* inventory tbCondition */
INSERT INTO tbCondition VALUES (seq_con.nextval, 'Feeling Great', 6, 'healthy', 'no injuries');
INSERT INTO tbCondition VALUES (seq_con.nextval, 'Run Recovery', 6, 'health', ' sore quads');
INSERT INTO tbCondition VALUES (seq_con.nextval, 'Tired', 4, 'head cold', 'whole body drained');
INSERT INTO tbCondition VALUES (seq_con.nextval, 'Back Pain', 5, 'stomach pain', 'back');
INSERT INTO tbCondition VALUES (seq_con.nextval, 'Sharp pain', 5, 'healthy', 'arms');

/* inventory tbSession */
INSERT INTO tbSession VALUES (seq_session.nextval, 1, 1, 5, 1, 8, 68 );
INSERT INTO tbSession VALUES (seq_session.nextval, 3, 1, 1,  2, 3, 68 );
INSERT INTO tbSession VALUES (seq_session.nextval, 1, 1, 2, 3, 4, 68);
INSERT INTO tbSession VALUES (seq_session.nextval, 3, 1, 3,  4, 8, 68);
INSERT INTO tbSession VALUES (seq_session.nextval, 4, 3, 3,  5, 300, 53);
INSERT INTO tbSession VALUES (seq_session.nextval, 5, 2, 5,  6, 0, 48 );

/* inventory tbProgram */
INSERT INTO tbProgram VALUES (seq_prog.nextval, 'supplement free relaxed', 'No', 'No', 3, 3, 3, 2500);
INSERT INTO tbProgram VALUES (seq_prog.nextval, 'beach body lifts', 'Heavily', 'Mostly',  5, 8, 7, 1800);
INSERT INTO tbProgram VALUES (seq_prog.nextval, 'hobbyist', 'No', 'Not really',  5, 5, 5, 2200);
INSERT INTO tbProgram VALUES (seq_prog.nextval, 'beach body cardio', 'Heavily', 'Mostly', 8, 5, 10, 1800);

/* inventory tbMeasurement */
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 1, 1, 195, 11, 24, 40, 38);
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 3, 2, 192, 11, 24, 40, 38);
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 3, 3, 190, 11, 24, 40, 36);
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 2, 4, 176, 12, 23, 39, 33);
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 4, 5, 175, 12, 23, 39, 33);
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 4, 6, 168, 13, 21, 38, 32);
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 4, 6, 168, 13, 21, 38, 32);



-- ******************************************************
--    Create triggers
--
-- Note:  Issue the appropriate commands to show your data
-- ******************************************************
CREATE or REPLACE TRIGGER TR_new_workout_IN
   /* trigger executes BEFORE an INSERT INTO the GIFT table */
   before INSERT ON tbWorkout
   for each row
   BEGIN

      SELECT seq_work.nextval, sysdate
           INTO :new.workoutNo, :new.workdate
            FROM dual;
   END TR_new_workout_IN;
.
/
CREATE or REPLACE TRIGGER TR_new_Coach_IN
   /* trigger executes BEFORE an INSERT INTO the GIFT table */
  before INSERT ON tbCoach
    for each row
    BEGIN

      SELECT seq_coach.nextval
        INTO :new.coachNo
        FROM dual;
    END TR_new_Coach_IN;
.
/
CREATE or REPLACE TRIGGER TR_new_Location_IN
  before INSERT ON tbloc
  for each row
    BEGIN
      SELECT seq_loc.nextval
        INTO :new.locNo
        FROM dual;
    END TR_new_Location_IN;
.
/
CREATE or REPLACE TRIGGER TR_new_Condition_IN
  before INSERT ON tbCondition
  for each row
    BEGIN
      SELECT seq_con.nextval
        INTO :new.conNo
        FROM dual;
    END TR_new_Condition_IN;
.
/
CREATE or REPLACE TRIGGER TR_new_session_IN
  before INSERT ON tbSession
  for each row
    BEGIN
      SELECT seq_session.nextval
        INTO :new.sessionNo
        FROM dual;
    END TR_new_session_IN;
.
/
CREATE or REPLACE TRIGGER TR_new_program_IN
  before INSERT ON tbProgram
  for each row
    BEGIN
      SELECT seq_prog.nextval
        INTO :new.programNo
        FROM dual;
   END TR_new_program_IN;
.
/
CREATE or REPLACE TRIGGER TR_new_measurement_IN
  before INSERT ON tbMeasurement
  for each row
    BEGIN 
      SELECT seq_measure.nextval
        INTO :new.measureNo 
        FROM dual;
    END TR_new_measurement_IN;
.
/
-- ******************************************************
--    Test triggers
--
-- ******************************************************
SELECT * FROM tbWorkout;
INSERT INTO tbWorkout (miles, liftType, load, pace)  VALUES (26.2, 'backsquat', 200, 5.6);
INSERT INTO tbWorkout (miles, liftType, load, pace) VALUES (8.0, 'Push Press', 95, 8.0);
SELECT * FROM tbWorkout;

SELECT * FROM tbCoach;
INSERT INTO tbCoach (firstName, lastName, mainSport, philosophy) VALUES ('Jim', 'Bean','Football', 'Go TEAM');
SELECT * FROM tbCoach;
SELECT * FROM tbLoc;
INSERT INTO tbLoc (locName, ground, terrain) VALUES ('Carson Beach', 'sand', 'slanted');
SELECT * FROM tbLoc;
SELECT * FROM tbCondition;
INSERT INTO tbCondition (conName, sleep, sickness, mainInjury) VALUES ('Quad dull pain', 3, 'feeling health', 'Quads');
SELECT * FROM tbCondition;
SELECT * FROM tbSession;
INSERT INTO tbSession (coachNo, locNo, conNo, workoutNo, attendance, temperature) VALUES (2, 4, 3,  7, 25, 48 );
SELECT * FROM tbSession;
SELECT * FROM tbProgram;
INSERT INTO tbProgram(programName, restrictcarbs, vegetarian, cardioimp, weightimp, workWeek, dailycal) VALUES ('purge', 'Heavily', 'Completely', 10, 5, 20, 800);
SELECT * FROM tbProgram;
SELECT * FROM tbMeasurement;
INSERT INTO tbMeasurement (programNo, workoutNo, weight, armSize, legSize, chestSize, waistSize) VALUES (4, 2, 169, 13, 21, 38, 28);
SELECT * FROM tbMeasurement;
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
INSERT INTO tbWorkout  VALUES (26.2, 'backsquat', 200, 5.6);
INSERT INTO tbCoach VALUES (seq_coach.nextval, 'Cher', 'Climbing', 'Workouts should be fun');

--        *) Referential integrity
INSERT INTO tbSession VALUES (seq_session.nextval, 20, 1, 5, 1, 8, 68 );
INSERT INTO tbMeasurement VALUES (seq_measure.nextval, 1, 15, 195, 11, 24, 40, 38);
--        *) Column constraints
INSERT INTO tbCondition VALUES (seq_con.nextval, 'Tired', 4.25, 'head cold', 'whole body drained');
INSERT INTO tbCoach VALUES (seq_coach.nextval, 'Joey', 'Kyle', 'Climbing under the peaks of westford by Chaven and then swimming', 'Workouts should be fun');


-- ******************************************************
--    END SESSION
-- ******************************************************

spool off
