--Person Values

INSERT INTO PERSON (ID, Name, Surname, Pesel, Birthdate, Gender, Address, PhoneNo)VALUES
(1, 'Thomas', 'Richards', '81010200131', '1972-12-09', 'M', 'Tylna 66', '533509520'), --Teacher Male
(2, 'Rafal', 'Pacek', '88070312117', '1999-05-28', 'M', 'Skrajna 109', '697374833'), --Teacher Male
(3, 'Zofia', 'Kowalska', '99031434267', '1999-03-31', 'F', 'Lowicka 87', '604362975'), --Teacher Female
(4, 'Agnieszka', 'Sobczak', '87051577442', '1988-12-25', 'F', 'Aroniowa 51', '783839830'), --Teacher Female
(5, 'John', 'Smith', '52020625219', '1969-04-28', 'M', 'Uczniowska 134', '783292736'), --Teacher Male
(6, 'Andzrej', 'Kotowski', '52061719838', '2006-09-15', 'M', 'Towarowa 61', '663276593'), --Student 1 Male
(7, 'Kotowski', 'Halicki', '91021929359', '1989-12-09', 'M', 'Towarowa 61', '661064734'), --Parent of Student 1 Male
(8, 'Alina', 'Borys', '53021975365', '2005-12-09', 'F', 'Chodakowska 10', '788329719'), --Student 2 Female
(9, 'Borys', 'Konopa', '99070484137', '1990-12-09', 'M', 'Chodakowska 10', '798049252'), --Parent of Student 2 Male
(10, 'Artur', 'Wietechi', '96070299215', '2006-07-25', 'M', 'Pawia 58', '664938211'), --Student 3 Male
(11, 'Janina', 'Wietecha', '65071396443', '1990-07-24', 'F', 'Pawia 58', '679132936'), --Parent 3 Female
(12, 'Maciej', 'Bialek', '01281554219', '2005-12-25', 'M', 'Baltazara 143', '729779945'), --Student 4 Male
(13, 'Aurelia', 'Bialeka', '68080398783', '1989-06-09', 'F', 'Baltazara 143', '783023405'), --Parent 4 Female
(14, 'Monika', 'Igor', '90061792325', '2005-09-24', 'F', 'Fajansowa 22', '538886088'), --Student 5 Female
(15, 'Igor', 'Kamrowski', '96050141817', '1990-01-24', 'M', 'Fajansowa 22', '789825640'), --Parent 5 Male
(16, 'Blanka', 'Jerzy', '62022425366', '2006-05-31', 'F', 'Woronicza 81', '608616798'), --Student 6 Female
(17, 'Jerzy', 'Szczerba', '62092158395', '1990-12-18', 'M', 'Woronicza 81', '609401834'), --Parent 6 Male
(18, 'Arkadiusz', 'Ludwik', '90041695633', '2003-09-24', 'M', 'Kielecka 50', '726179262'), --Student 7 Male
(19, 'Ludwik', 'Bator', '59090694871', '1987-03-31', 'M', 'Kielecka 50', '515094637'), --Parent 7 Male
(20, 'Oliwia', 'Zieminski', '65121541421', '2002-01-01', 'F', 'Zabkowska 109', '607969010'), --Student 8 Female
(21, 'Adrianna', 'Zieminska', '56042176461', '1990-08-24', 'F', 'Zabkowska 109', '725061666'); --Parent  8 Female


--Student Values
INSERT INTO STUDENT (ID, [Number], STATUS, EMERGENCY_CONTACTNO, PARENT)VALUES
(6, '29992', 'A', '536765003', 7),--1 M
(8, '29993', 'A', '784069255', 9),--2 F
(10, '29994', 'A', '889310907', 11),--3 M
(12, '29995', 'A', '536179834', 13),--4 M
(14, '29996', 'A', '881727840', 15),--5 F
(16, '29997', 'A', '729658766', 17),--6 F
(18, '29998', 'A', '727797060', 19),--7 M
(20, '29999', 'A', '673481196', 21);--8 F


--Teacher Values

INSERT INTO TEACHER (ID, SALARY, EMPLOYMENT_DATE, DISMISSAL_DATE, SUPERVISOR)VALUES
(1, 10025.69, '2012-05-31', NULL, NULL), --1
(5, 9765.43, '2014-05-01', NULL, NULL), --2
(4, 6575.23, '2020-06-04', NULL, 5), --3
(2, 6125.53, '2020-05-25', NULL, 1), --4
(3, 5750.33, '2023-03-18', NULL, 4); --5


--Group
INSERT INTO [Group] (ID, Code) VALUES
(1, 'SG1'),
(2, 'SG2');


--Student_Group
INSERT INTO STUDENT_GROUP (STUDENT, [Group], DATE_FROM, DATE_TO) VALUES
(6, 1, '2024-10-01', NULL),
(10, 1, '2024-10-01', NULL),
(8, 1, '2024-10-01', NULL),
(14, 1, '2024-10-01', NULL),
(12, 2, '2024-10-01', NULL),
(20, 2, '2024-10-01', NULL),
(16, 2, '2024-10-01', NULL),
(18, 2, '2024-10-01', NULL);


--Course
INSERT INTO COURSE (ID, Name, Description, Credit_Hours) VALUES
(1, 'Calculus', 'designed to give students the skills to use calculus in social sciences and business applications.', 120),
(2, 'Discrete Mathematics', 'probability,set theory,logic,Boolean algebra,combinatorics,and recursion', 90),
(3, 'Linear Algebra', 'includes a study of matrices,vectors,tensors, and linear transformations.', 100),
(4, 'Programming Techniques', 'Techniques used in modern day programming',100);


--Teacher_history
INSERT INTO TEACHER_HISTORY (TEACHER, COURSE, DATE_FROM, DATE_TO) VALUES
(1, 1, '2023-10-01', NULL),
(5, 2, '2023-10-12', '2024-06-28'),
(4, 2, '2023-10-05', NULL),
(2, 1, '2023-10-25', '2024-03-29'),
(3, 3, '2023-10-09', '2024-01-01'),
(5, 4, '2023-10-29' , NULL);



--ROOM
INSERT INTO ROOM (ID, [Number]) VALUES
(1, 111),
(2, 112),
(3, 113),
(4, 114),
(5, 115);


--Class
INSERT INTO CLASS (ID, TIME, [Date], ROOM, [Group], COURSE, TEACHER) VALUES
(1, '2024-11-25T09:30:00', '2024-11-25', 1, 1, 2, 5),
(2, '2024-11-26T11:00:00', '2024-11-26', 2, 2, 2, 1),
(3, '2024-11-27T12:45:00', '2024-11-27', 3, 1, 3, 4),
(4, '2024-11-28T14:30:00', '2024-11-28', 4, 2, 3, 2),
(5, '2024-11-29T16:15:00', '2024-11-29', 5, 1, 1, 3);


--Attendance
INSERT INTO ATTENDANCE (ID, CLASS, STATUS, STUDENT) VALUES
(1, 1, 'P', 6), --class 1(SG1)
(2, 1, 'A', 10), --class 1
(3, 1, 'E', 8), --class 1
(4, 1, 'P', 14), --class 1
(5, 2, 'E', 12), --class 2(SG2)
(6, 2, 'P', 20), --class 2
(7, 2, 'A', 16), --class 2
(8, 2, 'P', 18), --class 2
(9,3,'P',6), --class 3(SG1)
(10,3,'E',10), --class 3
(11,3,'A',8), --class 3
(12,3,'P',14), --class 3
(13,4,'P',12), --class 4(SG2)
(14,4,'P',20), --class 4
(15,4,'P',16), --class 4
(16,4,'P',18), --class 4
(17,5,'P',6), --class 5(SG1)
(18,5,'A',10), --class 5
(19,5,'P',8), --class 5
(20,5,'P',14); --class 5


--Assignment
INSERT INTO Assignment (ID, DESCRIPTION, START_DATE, DUE_DATE, COURSE) VALUES
(1,'Homework of limits','2024-11-25','2024-11-30',1),
(2,'Solve the Matrices','2024-12-02','2024-12-08',3),
(3,'Prove or Disprove','2024-12-15','2024-12-23',2);


--Grade
INSERT INTO Grade (ID,GRADE,COURSE,STUDENT,TEACHER) VALUES
(1,5,1,6,1), --student with id 6
(2,3.5,3,6,3), --student with id 6
(3,4,2,6,4), --student with id 6
(4,5,1,10,1), --student with id 10
(5,5,3,10,3), --student with id 10
(6,4.5,2,10,4),--student with id 10
(7,4,1,8,1),--student with id 8
(8,5,3,8,3),--student with id 8
(9,4.5,2,8,4),--student with id 8
(10,5,1,12,1),--student with id 12
(11,5,3,12,3),--student with id 12
(12,5,2,12,4),--student with id 12
(13,3,1,14,1),--student with id 14
(14,3.5,3,14,3),--student with id 14
(15,2,2,14,4),--student with id 14
(16,2,1,16,1),--student with id 16
(17,3,3,16,3),--student with id 16
(18,2,2,16,4),--student with id 16
(19,4,1,18,1),--student with id 18
(20,4,3,18,3),--student with id 18
(21,4,2,18,4),--student with id 18
(22,4.5,1,20,1),--student with id 20
(23,5,3,20,3),--student with id 20
(24,3.5,2,20,4);--student with id 20


