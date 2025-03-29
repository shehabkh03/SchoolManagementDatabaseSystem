--Person Values
INSERT ALL
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (1,'Thomas'     ,'Richards'  ,'81010200131'  ,TO_DATE('1972-12-09','YYYY-MM-DD') ,'M','Tylna 66'       ,'533509520') --Teacher Male *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (2,'Rafal'      ,'Pacek'     ,'88070312117'  ,TO_DATE('1999-05-28','YYYY-MM-DD') ,'M','Skrajna 109'    ,'697374833') --Teacher Male *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (3,'Zofia'      ,'Kowalska'  ,'99031434267'  ,TO_DATE('1999-03-31','YYYY-MM-DD') ,'F','Lowicka 87'     ,'604362975') --Teacher Female *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (4,'Agnieszka'  ,'Sobczak'   ,'87051577442'  ,TO_DATE('1988-12-25','YYYY-MM-DD') ,'F','Aroniowa 51'    ,'783839830') --Teacher Female *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (5,'John'       ,'Smith'     ,'52020625219'  ,TO_DATE('1969-04-28','YYYY-MM-DD') ,'M','Uczniowska 134' ,'783292736') --Teacher Male *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (6,'Andzrej'    ,'Kotowski'  ,'52061719838'  ,TO_DATE('2006-09-15','YYYY-MM-DD') ,'M','Towarowa 61'    ,'663276593') --Student 1 Male *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (7,'Kotowski'   ,'Halicki'   ,'91021929359'  ,TO_DATE('1989-12-09','YYYY-MM-DD') ,'M','Towarowa 61'    ,'661064734') --Parent of Student 1 Male *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (8,'Alina'      ,'Borys'     ,'53021975365'  ,TO_DATE('2005-12-09','YYYY-MM-DD') ,'F','Chodakowska 10' ,'788329719') --Student 2 Female *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (9,'Borys'      ,'Konopa'    ,'99070484137'  ,TO_DATE('1990-12-09','YYYY-MM-DD') ,'M','Chodakowska 10' ,'798049252') --Parent of Student 2 Male *
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (10,'Artur'     ,'Wietechi'  ,'96070299215'  ,TO_DATE('2006-07-25','YYYY-MM-DD') ,'M','Pawia 58'       ,'664938211') --Student 3 Male
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (11,'Janina'    ,'Wietecha'  ,'65071396443'  ,TO_DATE('1990-07-24','YYYY-MM-DD') ,'F','Pawia 58'       ,'679132936') --Parent 3 Female
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (12,'Maciej'    ,'Bialek'    ,'01281554219'  ,TO_DATE('2005-12-25','YYYY-MM-DD') ,'M','Baltazara 143'  ,'729779945') --Student 4 Male
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (13,'Aurelia'   ,'Bialeka'   ,'68080398783'  ,TO_DATE('1989-06-09','YYYY-MM-DD') ,'F','Baltazara 143'  ,'783023405') --Parent 4 Female
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (14,'Monika'    ,'Igor'      ,'90061792325'  ,TO_DATE('2005-09-24','YYYY-MM-DD') ,'F','Fajansowa 22'   ,'538886088') --Student 5 Female
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (15,'Igor'      ,'Kamrowski' ,'96050141817'  ,TO_DATE('1990-01-24','YYYY-MM-DD') ,'M','Fajansowa 22'   ,'789825640')  --Parent 5 Male
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (16,'Blanka'    ,'Jerzy'     ,'62022425366'  ,TO_DATE('2006-05-31','YYYY-MM-DD') ,'F','Woronicza 81'   ,'608616798')  --Student 6 Female
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (17,'Jerzy'     ,'Szczerba'  ,'62092158395'  ,TO_DATE('1990-12-18','YYYY-MM-DD') ,'M','Woronicza 81'   ,'609401834')  --Parent 6 Male
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (18,'Arkadiusz' ,'Ludwik'    ,'90041695633'  ,TO_DATE('2003-09-24','YYYY-MM-DD') ,'M','Kielecka 50'    ,'726179262')  --Student 7 Male
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (19,'Ludwik'    ,'Bator'     ,'59090694871'  ,TO_DATE('1987-03-31','YYYY-MM-DD') ,'M','Kielecka 50'    ,'515094637')  --Parent 7 Male
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (20,'Oliwia'    ,'Zieminski' ,'65121541421'  ,TO_DATE('2002-01-01','YYYY-MM-DD') ,'F','Zabkowska 109'  ,'607969010')  --Student 8 Female
    INTO PERSON (id,Name, Surname,Pesel, Birthdate, Gender, Address, PhoneNo) VALUES (21,'Adrianna'  ,'Zieminska' ,'56042176461'  ,TO_DATE('1990-08-24','YYYY-MM-DD') ,'F','Zabkowska 109'  ,'725061666')  --Parent  8 Female
SELECT 1 FROM dual;
commit;

--Student Values
INSERT ALL
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (6 ,'29992','A','536765003',7) --1 M
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (8 ,'29993','A','784069255',9) --2 F
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (10,'29994','A','889310907',11) --3 M
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (12,'29995','A','536179834',13) --4 M
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (14,'29996','A','881727840',15) --5 F
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (16,'29997','A','729658766',17) --6 F
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (18,'29998','A','727797060',19) --7 M
    INTO STUDENT (id,"Number", STATUS,EMERGENCY_CONTACTNO,PARENT) VALUES (20,'29999','A','673481196',21) --8 F
SELECT 1 FROM dual;
commit;

--Teacher Values
INSERT ALL
    INTO TEACHER (id,SALARY, EMPLOYMENT_DATE, DISMISSAL_DATE, SUPERVISOR) VALUES (1,10025.69,TO_DATE('2012-05-31','YYYY-MM-DD'),null,null)--1
    INTO TEACHER (id,SALARY, EMPLOYMENT_DATE, DISMISSAL_DATE, SUPERVISOR) VALUES (5,9765.43 ,TO_DATE('2014-05-01','YYYY-MM-DD'),null,null)--2
    INTO TEACHER (id,SALARY, EMPLOYMENT_DATE, DISMISSAL_DATE, SUPERVISOR) VALUES (4,6575.23 ,TO_DATE('2020-06-04','YYYY-MM-DD'),null,5)--3
    INTO TEACHER (id,SALARY, EMPLOYMENT_DATE, DISMISSAL_DATE, SUPERVISOR) VALUES (2,6125.53 ,TO_DATE('2020-05-25','YYYY-MM-DD'),null,1)--4
    INTO TEACHER (id,SALARY, EMPLOYMENT_DATE, DISMISSAL_DATE, SUPERVISOR) VALUES (3,5750.33 ,TO_DATE('2023-03-18','YYYY-MM-DD'),null,4)--5
SELECT 1 FROM dual;
commit;


--Group
INSERT ALL
    INTO "Group" (Id,Code) VALUES (1,'SG1')
    INTO "Group" (Id,Code) VALUES (2,'SG2')
SELECT 1 FROM dual;
commit;

--Student_Group
INSERT ALL
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (6,1,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (10,1,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (8,1,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (14,1,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (12,2,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (20,2,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (16,2,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
    INTO STUDENT_GROUP (STUDENT, "Group", DATE_FROM, DATE_TO) VALUES (18,2,TO_DATE('2024-10-01','YYYY-MM-DD'),null)
SELECT 1 FROM dual;
commit;

--Course
INSERT ALL
    INTO COURSE (id, name, description, credit_hours) VALUES (1,'Calculus','designed to give students the skills to use calculus in social sciences and business applications.',120 )
    INTO COURSE (id, name, description, credit_hours) VALUES (2,'Discrete Mathematics','probability,set theory,logic,Boolean algebra,combinatorics,and recursion',90 )
    INTO COURSE (id, name, description, credit_hours) VALUES (3,'Linear Algebra','includes a study of matrices,vectors,tensors, and linear transformations.',100 )
	INTO COURSE (id, name, description, credit_hours) VALUES (4, 'Programming Techniques', 'Techniques used in modern day programming',100)
SELECT 1 FROM dual;
commit;

--Teacher_history
INSERT ALL
    INTO TEACHER_HISTORY (TEACHER, COURSE, DATE_FROM, DATE_TO) VALUES (1,1,TO_DATE('2023-10-01','YYYY-MM-DD'),null)
    INTO TEACHER_HISTORY (TEACHER, COURSE, DATE_FROM, DATE_TO) VALUES (5,2,TO_DATE('2023-10-12','YYYY-MM-DD'),TO_DATE('2024-06-28','YYYY-MM-DD'))
    INTO TEACHER_HISTORY (TEACHER, COURSE, DATE_FROM, DATE_TO) VALUES (4,2,TO_DATE('2023-10-05','YYYY-MM-DD'),null)
    INTO TEACHER_HISTORY (TEACHER, COURSE, DATE_FROM, DATE_TO) VALUES (2,1,TO_DATE('2023-10-25','YYYY-MM-DD'),TO_DATE('2024-03-29','YYYY-MM-DD'))
    INTO TEACHER_HISTORY (TEACHER, COURSE, DATE_FROM, DATE_TO) VALUES (3,3,TO_DATE('2023-10-09','YYYY-MM-DD'),TO_DATE('2024-01-01','YYYY-MM-DD'))
    INTO TEACHER_HISTORY (TEACHER, COURSE, DATE_FROM, DATE_TO) VALUES (5,4,TO_DATE('2023-10-29','YYYY-MM-DD'),null)
SELECT 1 FROM dual;
commit;


--ROOM
INSERT ALL
    INTO ROOM (ID, "Number") VALUES (1,111)
    INTO ROOM (ID, "Number") VALUES (2,112)
    INTO ROOM (ID, "Number") VALUES (3,113)
    INTO ROOM (ID, "Number") VALUES (4,114)
    INTO ROOM (ID, "Number") VALUES (5,115)
SELECT 1 FROM dual;
commit;

--Class

INSERT ALL
    INTO CLASS (ID, TIME, "Date", ROOM, "Group", COURSE, TEACHER) VALUES (1, TO_TIMESTAMP('2024-11-25 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-11-25','YYYY-MM-DD'), 1, 1, 2, 5)
    INTO CLASS (ID, TIME, "Date", ROOM, "Group", COURSE, TEACHER) VALUES (2, TO_TIMESTAMP('2024-11-26 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-11-26','YYYY-MM-DD'), 2, 2, 2, 1)
    INTO CLASS (ID, TIME, "Date", ROOM, "Group", COURSE, TEACHER) VALUES (3, TO_TIMESTAMP('2024-11-27 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-11-27','YYYY-MM-DD'), 3, 1, 3, 4)
    INTO CLASS (ID, TIME, "Date", ROOM, "Group", COURSE, TEACHER) VALUES (4, TO_TIMESTAMP('2024-11-28 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-11-28','YYYY-MM-DD'), 4, 2, 3, 2)
    INTO CLASS (ID, TIME, "Date", ROOM, "Group", COURSE, TEACHER) VALUES (5, TO_TIMESTAMP('2024-11-29 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-11-29','YYYY-MM-DD'), 5, 1, 1, 3)
SELECT 1 FROM dual;
COMMIT;

--Attendance
INSERT ALL
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (1,1,'P',6) --class 1(SG1)
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (2,1,'A',10) --class 1
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (3,1,'E',8) --class 1
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (4,1,'P',14) --class 1
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (5,2,'E',12) --class 2(SG2)
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (6,2,'P',20) --class 2
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (7,2,'A',16) --class 2
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (8,2,'P',18) --class 2
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (9,3,'P',6) --class 3(SG1)
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (10,3,'E',10) --class 3
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (11,3,'A',8) --class 3
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (12,3,'P',14) --class 3
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (13,4,'P',12) --class 4(SG2)
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (14,4,'P',20) --class 4
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (15,4,'P',16) --class 4
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (16,4,'P',18) --class 4
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (17,5,'P',6) --class 5(SG1)
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (18,5,'A',10) --class 5
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (19,5,'P',8) --class 5
    INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES (20,5,'P',14) --class 5
SELECT 1 FROM dual;
commit;

--Assignment
INSERT ALL
    INTO ASSIGNMENT (ID, DESCRIPTION, START_DATE, DUE_DATE, COURSE) VALUES (1,'Homework of limits',TO_DATE('2023-11-25','YYYY-MM-DD'),TO_DATE('2023-11-30','YYYY-MM-DD'),1)
    INTO ASSIGNMENT (ID, DESCRIPTION, START_DATE, DUE_DATE, COURSE) VALUES (2,'Solve the Matrices',TO_DATE('2023-12-02','YYYY-MM-DD'),TO_DATE('2023-12-08','YYYY-MM-DD'),3)
    INTO ASSIGNMENT (ID, DESCRIPTION, START_DATE, DUE_DATE, COURSE) VALUES (3,'Prove or Disprove',TO_DATE('2023-12-15','YYYY-MM-DD'),TO_DATE('2023-12-25','YYYY-MM-DD'),2)
SELECT 1 FROM dual;
commit;

--Grade
INSERT ALL
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (1,5,1,6,1) --student with id 6
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (2,3.5,3,6,3) --student with id 6
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (3,4,2,6,4) --student with id 6
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (4,5,1,10,1) --student with id 10
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (5,5,3,10,3) --student with id 10
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (6,4.5,2,10,4)--student with id 10
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (7,4,1,8,1)--student with id 8
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (8,5,3,8,3)--student with id 8
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (9,4.5,2,8,4)--student with id 8
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (10,5,1,12,1)--student with id 12
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (11,5,3,12,3)--student with id 12
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (12,5,2,12,4)--student with id 12
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (13,3,1,14,1)--student with id 14
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (14,3.5,3,14,3)--student with id 14
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (15,2,2,14,4)--student with id 14
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (16,2,1,16,1)--student with id 16
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (17,3,3,16,3)--student with id 16
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (18,2,2,16,4)--student with id 16
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (19,4,1,18,1)--student with id 18
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (20,4,3,18,3)--student with id 18
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (21,4,2,18,4)--student with id 18
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (22,4.5,1,20,1)--student with id 20
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (23,5,3,20,3)--student with id 20
    INTO GRADE (ID, GRADE, COURSE, STUDENT, TEACHER) VALUES (24,3.5,2,20,4)--student with id 20
SELECT 1 FROM dual;
commit;






