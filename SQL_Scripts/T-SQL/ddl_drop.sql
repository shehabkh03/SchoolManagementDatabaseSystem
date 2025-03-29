-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-01-23 21:49:11.28

-- foreign keys
ALTER TABLE Assignment DROP CONSTRAINT Assignment_Course;

ALTER TABLE Attendance DROP CONSTRAINT Attendance_Class;

ALTER TABLE Attendance DROP CONSTRAINT Attendance_Student;

ALTER TABLE Class DROP CONSTRAINT Class_Course;

ALTER TABLE Class DROP CONSTRAINT Class_Group;

ALTER TABLE Class DROP CONSTRAINT Class_Room;

ALTER TABLE Class DROP CONSTRAINT Class_Teacher;

ALTER TABLE Grade DROP CONSTRAINT Grade_Course;

ALTER TABLE Grade DROP CONSTRAINT Grade_Student;

ALTER TABLE Grade DROP CONSTRAINT Grade_Teacher;

ALTER TABLE Student_Group DROP CONSTRAINT Student_Group_Group;

ALTER TABLE Student_Group DROP CONSTRAINT Student_Group_Student;

ALTER TABLE Student DROP CONSTRAINT Student_Person_Parent;

ALTER TABLE Student DROP CONSTRAINT Student_Person_Student;

ALTER TABLE Teacher DROP CONSTRAINT Teacher_Person;

ALTER TABLE Teacher DROP CONSTRAINT Teacher_Teacher;

ALTER TABLE Teacher_history DROP CONSTRAINT Teacher_history_Course;

ALTER TABLE Teacher_history DROP CONSTRAINT Teacher_history_Teacher;

-- tables
DROP TABLE Assignment;

DROP TABLE Attendance;

DROP TABLE Class;

DROP TABLE Course;

DROP TABLE Grade;

DROP TABLE "Group";

DROP TABLE Person;

DROP TABLE Room;

DROP TABLE Student;

DROP TABLE Student_Group;

DROP TABLE Teacher;

DROP TABLE Teacher_history;

-- End of file.

