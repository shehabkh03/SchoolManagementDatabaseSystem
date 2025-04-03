---------------- 5 Select queries using where

--1. List of People starting with letter A (students and teachers)
SELECT *
FROM PERSON
WHERE NAME like 'A%';

--2. List of Assignments with due date before '2023-12-01'
SELECT *
FROM ASSIGNMENT
WHERE DUE_DATE < TO_DATE('2023-12-01', 'YYYY-MM-DD');

--3. List of Courses with credit hours greater or equal to 100 hours
SELECT *
FROM COURSE
WHERE CREDIT_HOURS >= 100;

--4. People who are born in year 2005 and 2006
SELECT Name, Surname, Birthdate
FROM PERSON
WHERE EXTRACT(YEAR FROM Birthdate) IN (2005, 2006)
order by BIRTHDATE desc;

--5. List of People between the age of 55 and 35
SELECT *
FROM PERSON
WHERE EXTRACT(YEAR FROM Birthdate) between 1969 and 1989
order by BIRTHDATE desc;

---------------- 5 Select queries that require joining tables

--6 List of Students that start with letter A,Their gender,Their parents name and Their Emergency contact number start with number 7
SELECT STUDENT.NAME ||' '|| STUDENT.SURNAME as Student,STUDENT.GENDER,PARENT.NAME || ' ' || PARENT.SURNAME as Parent,EMERGENCY_CONTACTNO
FROM STUDENT S
JOIN PERSON STUDENT ON S.ID = STUDENT.ID
JOIN PERSON PARENT ON S.PARENT = PARENT.ID
WHERE Student.NAME like 'A%' and EMERGENCY_CONTACTNO like '7%';

--7. List of Teachers,Their age,Their gender and Their Supervisors and age of their supervisor
SELECT TEACHER.name || ' ' || TEACHER.surname AS Teacher,TEACHER.GENDER,(2024-EXTRACT(YEAR FROM TEACHER.BIRTHDATE)) as Age_Teacher,SUPERVISOR.name || ' ' || SUPERVISOR.surname AS Supevisor,SUPERVISOR.GENDER,(2024-EXTRACT(YEAR FROM SUPERVISOR.BIRTHDATE)) as Age_Supervisor
FROM TEACHER T
JOIN PERSON TEACHER ON t.id = TEACHER.id
JOIN TEACHER T_SUPERVIOSR ON T.SUPERVISOR = T_SUPERVIOSR.id
JOIN PERSON SUPERVISOR ON T_SUPERVIOSR.id = SUPERVISOR.id
ORDER BY Age_Teacher asc, Age_Supervisor asc;

--8. List of Teachers who are 25 years old,Their gender and the courses they teach
SELECT P_T.NAME || ' '|| P_T.SURNAME as Teacher,P_T.GENDER,C.Name
FROM TEACHER_HISTORY TH
JOIN TEACHER T ON TH.TEACHER = T.ID
JOIN PERSON P_T ON T.ID = P_T.ID
JOIN COURSE C ON TH.COURSE = C.ID
WHERE EXTRACT(YEAR FROM P_T.BIRTHDATE) = 1999;

--9. List of Students who were excused or absent on classes and date of class
SELECT P.name ||' '|| P.surname as Student,C."Date",CR.NAME
FROM PERSON P
JOIN STUDENT S ON P.ID = S.ID
JOIN ATTENDANCE A ON S.ID = A.STUDENT
JOIN CLASS C ON A.CLASS = C.ID
JOIN COURSE CR ON C.COURSE = CR.ID
WHERE A.STATUS IN ('E','A')
ORDER BY C."Date" asc;

--10. List of Students who got a grade 4 or 5 on courses,Their group,and the teacher who gave the grade
SELECT STUDENT.name || ' ' || STUDENT.surname as Student,GP.CODE,GRADE,CR.NAME,TEACHER.name || ' ' || TEACHER.surname as Teacher
FROM GRADE G
JOIN STUDENT S ON G.STUDENT = s.ID
JOIN PERSON STUDENT ON S.ID = STUDENT.ID
JOIN STUDENT_GROUP SG ON S.ID = SG.STUDENT
JOIN "Group" GP ON SG."Group" = GP.ID
JOIN TEACHER T ON G.TEACHER = T.ID
JOIN PERSON TEACHER ON T.ID = TEACHER.ID
JOIN COURSE CR ON G.COURSE = CR.ID
WHERE GRADE = 4 or GRADE = 5;

---------------- 5 select queries using GROUP by + Aggregate functions

--11. count of teachers by gender
SELECT Gender, COUNT(*) AS teacher_count
FROM TEACHER
JOIN PERSON P ON TEACHER.ID = P.ID
GROUP BY Gender;

--12. number of students in each group
SELECT G.CODE AS group_id,COUNT(SG.STUDENT) AS student_count
FROM STUDENT_GROUP SG
JOIN STUDENT S on SG.STUDENT = S.ID
JOIN "Group" G on SG."Group" = G.ID
GROUP BY G.CODE
ORDER BY student_count DESC;

--13. List of highest grade acquired by each student
SELECT P.NAME || ' ' || P.SURNAME AS student_name,MAX(G.GRADE) AS highest_grade
FROM GRADE G
JOIN STUDENT S ON G.STUDENT = S.ID
JOIN PERSON P ON S.ID = P.ID
GROUP BY P.NAME, P.SURNAME
order by highest_grade desc;

--14. List of Attendance in each class
SELECT C.ID AS class_id,CR.NAME AS course_name,R."Number" AS room_number,COUNT(A.ID) AS total_attendance,
    SUM(CASE WHEN A.STATUS = 'P' THEN 1 ELSE 0 END) AS present,
    SUM(CASE WHEN A.STATUS = 'A' THEN 1 ELSE 0 END) AS absent,
    SUM(CASE WHEN A.STATUS = 'E' THEN 1 ELSE 0 END) AS excused
FROM CLASS C
JOIN COURSE CR ON C.COURSE = CR.ID
JOIN ROOM R ON C.ROOM = R.ID
JOIN ATTENDANCE A ON C.ID = A.CLASS
GROUP BY C.ID, CR.name, R."Number";

--15.The list of average,max, and min of grades in each course in each group
SELECT GP.CODE,CR.NAME,AVG(G.GRADE) as avg_grade,MAX(G.GRADE) as max_grade,MIN(G.GRADE) as min_grade
FROM STUDENT_GROUP SG
JOIN "Group" GP on SG."Group" = GP.ID
JOIN STUDENT S on SG.STUDENT = S.ID
JOIN GRADE G ON S.ID = G.STUDENT
JOIN COURSE CR ON G.COURSE = CR.ID
GROUP BY GP.CODE, CR.NAME;

---------------- 3 select using subqueries

--16.Teacher with highest salary
SELECT P.Name || ' '||P.SURNAME as teacher , T.Salary
FROM TEACHER T
JOIN PERSON P ON T.ID = P.ID
WHERE T.Salary = (
    SELECT MAX(T2.Salary)
    FROM TEACHER T2
);

--17. students who have grade higher than their course average
SELECT DISTINCT (P.Name||' '|| P.Surname)as student
FROM STUDENT S
JOIN PERSON P ON S.ID = P.ID
JOIN GRADE G ON S.id = G.STUDENT
WHERE G.GRADE > (
    SELECT AVG(G2.GRADE)
    FROM GRADE G2
    WHERE G2.COURSE = G.COURSE
);

--18. students with the highest grade 5 in each course
SELECT P.Name ||' '||P.SURNAME AS student,C.NAME,G.GRADE
FROM STUDENT S
JOIN PERSON P ON S.ID = P.ID
JOIN GRADE G ON S.ID = G.STUDENT
JOIN COURSE C ON G.COURSE = C.ID
WHERE G.GRADE = (
        SELECT MAX(GRADE)
        FROM GRADE
        WHERE COURSE = G.COURSE
    );









