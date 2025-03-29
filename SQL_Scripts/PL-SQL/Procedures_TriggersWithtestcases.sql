--PROCEDURES
--1. Calculate Average Score Of Student and his rank over all students(CURSOR)
CREATE OR REPLACE PROCEDURE CalculateAvgGradeAndRank (p_StudentId Student."Number"%type)
IS
    AvgGrade FLOAT;
    PassedRank INTEGER;
    StudentNumber VARCHAR2(20);
    AvgGradeCursor FLOAT;
    RankCursor INTEGER;

    CURSOR PassedStudentsCursor IS
    SELECT
        S."Number" AS StudentNumber,
        AVG(G.Grade) AS AvgGrade,
        RANK() OVER (ORDER BY AVG(G.Grade) DESC) AS PassedRank
    FROM Grade G
    JOIN Student S ON G.Student = S.Id
    GROUP BY S."Number"
    HAVING AVG(G.Grade) >= 3;
BEGIN

        SELECT AVG(G.Grade) INTO AvgGrade
        FROM Grade G
        JOIN Student S ON G.Student = S.Id
        WHERE S."Number" = p_StudentId;

        IF AvgGrade IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Student with ID ' || p_StudentId || ' not found');
            RETURN;
        END IF;

    OPEN PassedStudentsCursor;
    LOOP
        FETCH PassedStudentsCursor INTO StudentNumber, AvgGradeCursor, RankCursor;
        EXIT WHEN PassedStudentsCursor%NOTFOUND;
        IF StudentNumber = p_StudentId THEN
            PassedRank := RankCursor;
            EXIT;
        END IF;
    END LOOP;
    CLOSE PassedStudentsCursor;

    IF PassedRank IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Student ' || p_StudentId || ' has failed with an average grade of ' || ROUND(AvgGrade, 2));
    ELSE
        DBMS_OUTPUT.PUT_LINE('Student ' || p_StudentId || ' has passed with an average grade of ' || ROUND(AvgGrade, 2) ||
                              ' and is ranked ' || PassedRank || ' among the passed students.');
    END IF;
end;

CALL CalculateAvgGradeAndRank('29990'); --non existent student
CALL CalculateAvgGradeAndRank('29994'); -- passed student
CALL CalculateAvgGradeAndRank('29997'); --failed student

--2 Insert Person into person table then insert into student table then assign student to group
CREATE OR REPLACE PROCEDURE AddPersonAndAssignToGroup(
    p_Name Person.Name%TYPE,
    p_Surname Person.Surname%TYPE,
    p_Pesel Person.Pesel%TYPE,
    p_Birthdate Person.Birthdate%TYPE,
    p_Gender Person.Gender%TYPE,
    p_Address Person.Address%TYPE,
    p_PhoneNo Person.PhoneNo%TYPE,
    p_StudentNumber Student."Number"%TYPE,
    p_EmergencyContactNo Student.Emergency_ContactNo%TYPE,
    p_ParentId Student.Parent%TYPE,
    p_GroupId "Group".Id%TYPE
) AS
    v_NewPersonId INTEGER;
    v_Group_Enrolled_Count INTEGER;
    v_Group_Max_Capacity INTEGER := 5;
    v_GroupExists INTEGER;
    v_StudentExists INTEGER;
    v_PeselExists INTEGER;
BEGIN
     IF p_Gender NOT IN ('M', 'F') THEN
        RAISE_APPLICATION_ERROR(-20002, 'Invalid gender. Allowed values are: M or F.');
    END IF;

     -- Check if Pesel is unique
    SELECT COUNT(*) INTO v_PeselExists FROM Person WHERE Pesel = p_Pesel;
    IF v_PeselExists > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Pesel already exists. Must be unique.');
    END IF;

      -- Check if the student number already exists
    SELECT COUNT(*) INTO v_StudentExists FROM Student WHERE "Number" = p_StudentNumber;
    IF v_StudentExists > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Student number already exists. Must be unique.');
    END IF;


    -- Check if the group exists
    SELECT COUNT(*) INTO v_GroupExists FROM "Group" WHERE Id = p_GroupId;
    IF v_GroupExists = 0 THEN
        RAISE_APPLICATION_ERROR(-20005, 'Group does not exist.');
    END IF;

    SELECT NVL(MAX(Id), 0) + 1 INTO v_NewPersonId FROM Person;

    -- Insert the new person into the Person table
    INSERT INTO Person (Id, Name, Surname, Pesel, Birthdate, Gender, Address, PhoneNo)
    VALUES (v_NewPersonId, p_Name, p_Surname, p_Pesel, p_Birthdate, p_Gender, p_Address, p_PhoneNo);

    -- Insert the new person as a student
    INSERT INTO Student (Id, "Number", Status, Emergency_ContactNo, Parent)
    VALUES (v_NewPersonId, p_StudentNumber, 'A', p_EmergencyContactNo, p_ParentId);

    --Check group count
    SELECT COUNT(*) INTO v_Group_Enrolled_Count
    FROM Student_Group
    WHERE "Group" = p_GroupId;

    IF v_Group_Enrolled_Count >= v_Group_Max_Capacity THEN
        RAISE_APPLICATION_ERROR(-20007, 'Group is full. Enrollment is not possible.');
    END IF;

    -- Assign the student to the group
    INSERT INTO Student_Group (Student, "Group", Date_from, Date_to)
    VALUES (v_NewPersonId, p_GroupId, SYSDATE, NULL);
    DBMS_OUTPUT.PUT_LINE('Student with Student Number ' || p_StudentNumber || ' was added to Group ' || p_GroupId || '.');


    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20008, 'A required record was not found.');
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20009, 'Duplicate value encountered.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END AddPersonAndAssignToGroup;

CALL AddPersonAndAssignToGroup('John','Smith','88070312128',TO_DATE('2003-05-28','YYYY-MM-DD') ,'S','Skrajna 109','697374833','30001','536765003',7,1); -- Invalid Gender
CALL AddPersonAndAssignToGroup('John','Smith','81010200131',TO_DATE('2003-05-28','YYYY-MM-DD') ,'M','Skrajna 109','697374833','30002','536765003',7,1); --Not Unique Pesel
CALL AddPersonAndAssignToGroup('John','Smith','88070312128',TO_DATE('2003-05-28','YYYY-MM-DD') ,'M','Skrajna 109','697374833','29999','536765003',7,1); --Not Unique Student Number
CALL AddPersonAndAssignToGroup('John','Smith','88070312137',TO_DATE('2003-05-28','YYYY-MM-DD') ,'M','Skrajna 109','697374833','30003','536765003',7,3); --Group doesn't exist
CALL AddPersonAndAssignToGroup('John','Smith','88070312137',TO_DATE('2003-05-28','YYYY-MM-DD') ,'M','Skrajna 109','697374833','30000','536765003',7,1); --Add to group 1
CALL AddPersonAndAssignToGroup('Micheal','Smith','88070312136',TO_DATE('2003-05-28','YYYY-MM-DD') ,'M','Skrajna 109','697374833','30001','536765003',7,1); --cant add to group 1 because group 1 is full


--TRIGGERS
--1.allows to insert or update grade only if grade is suitable
CREATE OR REPLACE TRIGGER TR_GRADE_BIUDR
BEFORE INSERT OR UPDATE OR DELETE ON Grade
FOR EACH ROW
BEGIN
    -- Prevent DELETE operation
    IF DELETING THEN
        RAISE_APPLICATION_ERROR(-20002, 'Deleting grades is not allowed.');
    END IF;

    -- Validate the grade for INSERT or UPDATE
    IF INSERTING OR UPDATING THEN
        IF :NEW.Grade NOT IN (2, 3, 3.5, 4, 4.5, 5) THEN
            RAISE_APPLICATION_ERROR(-20001, 'Invalid grade. Allowed grades are: 2, 3, 3.5, 4, 4.5, 5.');
        END IF;
    END IF;

    -- Prevent updating to a lower grade
    IF UPDATING THEN
        IF :NEW.Grade < :OLD.Grade THEN
            RAISE_APPLICATION_ERROR(-20003, 'Updating to a lower grade is not allowed.');
        END IF;
    END IF;
END;

INSERT INTO Grade (Id, Grade, Course, Student, Teacher) VALUES (25,1,4,6,5);-- cant enter grade 1
INSERT INTO Grade (Id, Grade, Course, Student, Teacher) VALUES (25,4,4,6,5); --grade 4 is ok
INSERT INTO Grade (Id, Grade, Course, Student, Teacher) VALUES (26,2.5,4,8,5); --cant enter grade 2.5
INSERT INTO Grade (Id, Grade, Course, Student, Teacher) VALUES (26,3,4,8,5);--grade 3 is ok
--updating to grade 3 is not allowed because it is a lower grade
UPDATE GRADE
SET GRADE = 3
where Course = 4 and Student = 6;
--updating to grade 1 is not allowed
UPDATE GRADE
SET GRADE = 1
where Course = 4 and Student = 8;
--updating to a grade 4 is allowed because it is a higher grade
UPDATE GRADE
SET GRADE = 4
where Course = 4 and Student = 8;
--cannot delete grade after trigger
delete FROM GRADE WHERE COURSE = 4 and Student = 8;


--2.Notifications about changes
DROP TRIGGER TR_GRADE_BIUDR;
CREATE OR REPLACE TRIGGER TR_Student_AIUDR
AFTER INSERT OR UPDATE OR DELETE ON Student
FOR EACH ROW
BEGIN
    -- INSERT
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('New student added: ' || :NEW."Number" || ' with status ' || :NEW.Status);
    END IF;

    -- UPDATE
    IF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('Student ' || :OLD."Number" || ' status changed from ' || :OLD.Status || ' to ' || :NEW.Status);
    END IF;

    -- DELETE
    IF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('Student ' || :OLD."Number" || ' removed with status ' || :OLD.Status);
    END IF;
END;

INSERT INTO Student (Id, "Number", Status,EMERGENCY_CONTACTNO,PARENT) VALUES (2, 'S12345', 'A','12334456',4);
UPDATE Student SET Status = 'S' WHERE Id = 2;
DELETE FROM Student WHERE Id = 2;


