--PROCEDURES
--1. Calculate Average Score Of Student and his rank over all students(CURSOR)
CREATE PROCEDURE CalculateAvgGradeAndRank @StudentId varchar(20)
AS
    BEGIN
    DECLARE @AvgGrade FLOAT;
    DECLARE @PassedRank INT;
    DECLARE @StudentNumber VARCHAR(20);
    DECLARE @CursorAvgGrade FLOAT;
    DECLARE @CursorRank INT;

    SELECT @AvgGrade = AVG(Grade)
    FROM Grade G
    JOIN Student S ON G.Student = S.Id
    WHERE S.Number = @StudentId;

    IF @AvgGrade IS NULL
    BEGIN
        PRINT 'Student with ID ' + CAST(@StudentId AS VARCHAR) + ' not found or has no grades recorded.';
        RETURN;
    END

    DECLARE PassedStudentsCursor CURSOR FOR
    SELECT
        S.Number AS StudentNumber,
        AVG(Grade) AS AvgGrade,
        RANK() OVER (ORDER BY AVG(Grade) DESC) AS PassedRank
    FROM Grade G
    JOIN Student S ON G.Student = S.Id
    GROUP BY S.Number
    HAVING AVG(Grade) >= 3;

    OPEN PassedStudentsCursor;

    FETCH NEXT FROM PassedStudentsCursor INTO @StudentNumber, @CursorAvgGrade, @CursorRank;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF @StudentNumber = @StudentId
        BEGIN
            SET @PassedRank = @CursorRank;
            BREAK;
        END
        FETCH NEXT FROM PassedStudentsCursor INTO @StudentNumber, @CursorAvgGrade, @CursorRank;
    END

    CLOSE PassedStudentsCursor;
    DEALLOCATE PassedStudentsCursor;

    IF @PassedRank IS NULL
            PRINT 'Student ' + @StudentId + ' has failed with an average grade of ' + CAST(ROUND(@AvgGrade, 2) AS VARCHAR);
        ELSE
            PRINT 'Student ' + @StudentId + ' has passed with an average grade of ' + CAST(ROUND(@AvgGrade, 2) AS VARCHAR) +
                  ' and is ranked ' + CAST(@PassedRank AS VARCHAR) + ' among the passed students.';
END

EXEC CalculateAvgGradeAndRank '29990' --non existent student
EXEC CalculateAvgGradeAndRank '29994' -- passed student
EXEC CalculateAvgGradeAndRank '29997' --failed student

--2 Insert Person into person table then insert into student table then assign student to group
CREATE PROCEDURE AddPersonAndAssignToGroup
    @p_Name VARCHAR(100),
    @p_Surname VARCHAR(100),
    @p_Pesel VARCHAR(20),
    @p_Birthdate DATE,
    @p_Gender CHAR(1),
    @p_Address VARCHAR(255),
    @p_PhoneNo VARCHAR(20),
    @p_StudentNumber VARCHAR(50),
    @p_EmergencyContactNo VARCHAR(20),
    @p_ParentId INT,
    @p_GroupId INT
AS
BEGIN
    DECLARE @v_NewPersonId INT;
    DECLARE @v_Group_Enrolled_Count INT;
    DECLARE @v_Group_Max_Capacity INT = 5;
    DECLARE @v_GroupExists INT;
    DECLARE @v_StudentExists INT;
    DECLARE @v_PeselExists INT;

    BEGIN TRANSACTION;

    BEGIN TRY
        -- Validate gender
        IF @p_Gender NOT IN ('M', 'F')
        BEGIN
            RAISERROR ('Invalid gender. Allowed values are: M or F.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Check if Pesel is unique
        SELECT @v_PeselExists = COUNT(*) FROM Person WHERE Pesel = @p_Pesel;
        IF @v_PeselExists > 0
        BEGIN
            RAISERROR ('Pesel already exists. Must be unique.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Check if the student number already exists
        SELECT @v_StudentExists = COUNT(*) FROM Student WHERE "Number" = @p_StudentNumber;
        IF @v_StudentExists > 0
        BEGIN
            RAISERROR ('Student number already exists. Must be unique.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Check if the group exists
        SELECT @v_GroupExists = COUNT(*) FROM [Group] WHERE Id = @p_GroupId;
        IF @v_GroupExists = 0
        BEGIN
            RAISERROR ('Group does not exist.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Generate new Person ID
        SELECT @v_NewPersonId = ISNULL(MAX(Id), 0) + 1 FROM Person;

        -- Insert the new person into the Person table
        INSERT INTO Person (Id, Name, Surname, Pesel, Birthdate, Gender, Address, PhoneNo)
        VALUES (@v_NewPersonId, @p_Name, @p_Surname, @p_Pesel, @p_Birthdate, @p_Gender, @p_Address, @p_PhoneNo);

        -- Insert the new person as a student
        INSERT INTO Student (Id, "Number", Status, Emergency_ContactNo, Parent)
        VALUES (@v_NewPersonId, @p_StudentNumber, 'A', @p_EmergencyContactNo, @p_ParentId);

        -- Check group capacity
        SELECT @v_Group_Enrolled_Count = COUNT(*)
        FROM Student_Group
        WHERE "Group" = @p_GroupId;

        IF @v_Group_Enrolled_Count >= @v_Group_Max_Capacity
        BEGIN
            RAISERROR ('Group is full. Enrollment is not possible.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        -- Assign the student to the group
        INSERT INTO Student_Group (Student, "Group", Date_from, Date_to)
        VALUES (@v_NewPersonId, @p_GroupId, GETDATE(), NULL);

        PRINT 'Student with Student Number ' + @p_StudentNumber + ' was added to Group ' + CAST(@p_GroupId AS NVARCHAR);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

EXEC AddPersonAndAssignToGroup 'John', 'Smith', '88070312128', '2003-05-28', 'S',  'Skrajna 109', '697374833', '30001', '536765003', 7, 1;-- Invalid Gender
EXEC AddPersonAndAssignToGroup 'John', 'Smith', '81010200131', '2003-05-28', 'M', 'Skrajna 109', '697374833', '30002', '536765003', 7, 1;-- Not Unique Pesel
EXEC AddPersonAndAssignToGroup 'John', 'Smith', '88070312128', '2003-05-28', 'M',  'Skrajna 109', '697374833', '29999', '536765003', 7, 1;-- Not Unique Student Number
EXEC AddPersonAndAssignToGroup 'John', 'Smith', '88070312137', '2003-05-28', 'M', 'Skrajna 109', '697374833', '30003', '536765003', 7, 3;-- Group doesn't exist
EXEC AddPersonAndAssignToGroup 'John', 'Smith', '88070312137', '2003-05-28', 'M', 'Skrajna 109', '697374833', '30000', '536765003', 7, 1;-- Add to Group 1
EXEC AddPersonAndAssignToGroup 'Micheal', 'Smith', '88070312136', '2003-05-28', 'M', 'Skrajna 109', '697374833', '30001', '536765003', 7, 1;-- Cannot add to Group 1 because it's full

--TRIGGERS
--1.allows to insert or update grade only if grade is suitable
CREATE TRIGGER TR_GRADE_BIUDR
ON Grade
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Prevent DELETE operation (Only if there's no corresponding insert)
    IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
    BEGIN
        RAISERROR ('Deleting grades is not allowed.', 16, 1);
        RETURN;
    END;

    -- Validate grades for INSERT or UPDATE
    IF EXISTS (SELECT 1 FROM inserted WHERE Grade NOT IN (2, 3, 3.5, 4, 4.5, 5))
    BEGIN
        RAISERROR ('Invalid grade. Allowed grades are: 2, 3, 3.5, 4, 4.5, 5.', 16, 1);
        RETURN;
    END;

    -- Prevent updating to a lower grade
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.Id = d.Id
        WHERE i.Grade < d.Grade
    )
    BEGIN
        RAISERROR ('Updating to a lower grade is not allowed.', 16, 1);
        RETURN;
    END;

    -- Perform INSERT operation if applicable
    IF EXISTS (SELECT 1 FROM inserted) AND NOT EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO Grade (Id, Grade, Course, Student, Teacher)
        SELECT Id, Grade, Course, Student, Teacher FROM inserted;
    END;

    -- Perform UPDATE operation if applicable
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        UPDATE g
        SET g.Grade = i.Grade
        FROM Grade g
        JOIN inserted i ON g.Id = i.Id;
    END;
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
CREATE TRIGGER TR_Student_AIUDR
ON Student
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewNumber NVARCHAR(20), @NewStatus NVARCHAR(1);
    DECLARE @OldNumber NVARCHAR(20), @OldStatus NVARCHAR(1), @UpdatedStatus NVARCHAR(1);
    DECLARE @DeletedNumber NVARCHAR(20), @DeletedStatus NVARCHAR(1);

    -- INSERT: Log new student
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        SELECT TOP 1 @NewNumber = i."Number", @NewStatus = i.Status
        FROM inserted i;

        PRINT 'New student added: ' + @NewNumber + ' with status ' + @NewStatus;
    END;

    -- UPDATE: Log student status change
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        SELECT TOP 1 @OldNumber = d."Number", @OldStatus = d.Status, @UpdatedStatus = i.Status
        FROM deleted d
        INNER JOIN inserted i ON d.Id = i.Id;

        PRINT 'Student ' + @OldNumber + ' status changed from ' + @OldStatus + ' to ' + @UpdatedStatus;
    END;

    -- DELETE: Log student removal
    IF EXISTS (SELECT 1 FROM deleted)
    BEGIN
        SELECT TOP 1 @DeletedNumber = d."Number", @DeletedStatus = d.Status
        FROM deleted d;

        PRINT 'Student ' + @DeletedNumber + ' removed with status ' + @DeletedStatus;
    END;
END;

INSERT INTO Student (Id, "Number", Status,EMERGENCY_CONTACTNO,PARENT) VALUES (2, 'S12345', 'A','12334456',4);
UPDATE Student SET Status = 'S' WHERE Id = 2;
DELETE FROM Student WHERE Id = 2;




