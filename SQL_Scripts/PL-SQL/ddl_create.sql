-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-01-23 21:48:59.227

-- tables
-- Table: Assignment
CREATE TABLE Assignment (
    Id integer  NOT NULL,
    Description varchar2(30)  NOT NULL,
    Start_date date  NOT NULL,
    Due_date date  NOT NULL,
    Course integer  NOT NULL,
    CONSTRAINT Assignment_pk PRIMARY KEY (Id)
) ;

-- Table: Attendance
CREATE TABLE Attendance (
    Id integer  NOT NULL,
    Class integer  NOT NULL,
    Status char(1)  NOT NULL,
    Student integer  NOT NULL,
    CONSTRAINT Attedance_Status_Check CHECK (Status In ('P','A','E')),
    CONSTRAINT Attendance_pk PRIMARY KEY (Id)
) ;

-- Table: Class
CREATE TABLE Class (
    Id integer  NOT NULL,
    Time timestamp  NOT NULL,
    "Date" date  NOT NULL,
    Room integer  NOT NULL,
    "Group" integer  NOT NULL,
    Course integer  NOT NULL,
    Teacher integer  NOT NULL,
    CONSTRAINT Class_pk PRIMARY KEY (Id)
) ;

-- Table: Course
CREATE TABLE Course (
    Id integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Description varchar2(100)  NOT NULL,
    Credit_Hours integer  NOT NULL,
    CONSTRAINT Course_pk PRIMARY KEY (Id)
) ;

-- Table: Grade
CREATE TABLE Grade (
    Id integer  NOT NULL,
    Grade number(2,1)  NOT NULL,
    Course integer  NOT NULL,
    Student integer  NOT NULL,
    Teacher integer  NOT NULL,
    CONSTRAINT Grade_pk PRIMARY KEY (Id)
) ;

-- Table: Group
CREATE TABLE "Group" (
    Id integer  NOT NULL,
    Code varchar2(4)  NOT NULL,
    CONSTRAINT Group_pk PRIMARY KEY (Id)
) ;

-- Table: Person
CREATE TABLE Person (
    Id integer  NOT NULL,
    Name varchar2(30)  NOT NULL,
    Surname varchar2(30)  NOT NULL,
    Pesel char(11)  NOT NULL,
    Birthdate date  NOT NULL,
    Gender char(1)  NOT NULL,
    Address varchar2(30)  NOT NULL,
    PhoneNo varchar2(12)  NOT NULL,
    CONSTRAINT Gender_Check CHECK (Gender In ('M','F')),
    CONSTRAINT Person_pk PRIMARY KEY (Id)
) ;

-- Table: Room
CREATE TABLE Room (
    Id integer  NOT NULL,
    "Number" integer  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY (Id)
) ;

-- Table: Student
CREATE TABLE Student (
    Id integer  NOT NULL,
    "Number" varchar2(20)  NOT NULL,
    Status char(1)  NOT NULL,
    Emergency_ContactNo varchar2(12)  NULL,
    Parent integer  NOT NULL,
    CONSTRAINT Student_Status_Check CHECK (Status In ('A','S')),
    CONSTRAINT Student_pk PRIMARY KEY (Id)
) ;

-- Table: Student_Group
CREATE TABLE Student_Group (
    Student integer  NOT NULL,
    "Group" integer  NOT NULL,
    Date_from date  NOT NULL,
    Date_to date  NULL,
    CONSTRAINT Student_Group_pk PRIMARY KEY ("Group",Student)
) ;

-- Table: Teacher
CREATE TABLE Teacher (
    Id integer  NOT NULL,
    Salary number(8,2)  NOT NULL,
    Employment_date date  NOT NULL,
    Dismissal_date date  NULL,
    Supervisor integer  NULL,
    CONSTRAINT Teacher_pk PRIMARY KEY (Id)
) ;

-- Table: Teacher_history
CREATE TABLE Teacher_history (
    Teacher integer  NOT NULL,
    Course integer  NOT NULL,
    Date_from date  NOT NULL,
    Date_to date  NULL,
    CONSTRAINT Teacher_history_pk PRIMARY KEY (Course,Date_from,Teacher)
) ;

-- foreign keys
-- Reference: Assignment_Course (table: Assignment)
ALTER TABLE Assignment ADD CONSTRAINT Assignment_Course
    FOREIGN KEY (Course)
    REFERENCES Course (Id);

-- Reference: Attendance_Class (table: Attendance)
ALTER TABLE Attendance ADD CONSTRAINT Attendance_Class
    FOREIGN KEY (Class)
    REFERENCES Class (Id);

-- Reference: Attendance_Student (table: Attendance)
ALTER TABLE Attendance ADD CONSTRAINT Attendance_Student
    FOREIGN KEY (Student)
    REFERENCES Student (Id);

-- Reference: Class_Course (table: Class)
ALTER TABLE Class ADD CONSTRAINT Class_Course
    FOREIGN KEY (Course)
    REFERENCES Course (Id);

-- Reference: Class_Group (table: Class)
ALTER TABLE Class ADD CONSTRAINT Class_Group
    FOREIGN KEY ("Group")
    REFERENCES "Group" (Id);

-- Reference: Class_Room (table: Class)
ALTER TABLE Class ADD CONSTRAINT Class_Room
    FOREIGN KEY (Room)
    REFERENCES Room (Id);

-- Reference: Class_Teacher (table: Class)
ALTER TABLE Class ADD CONSTRAINT Class_Teacher
    FOREIGN KEY (Teacher)
    REFERENCES Teacher (Id);

-- Reference: Grade_Course (table: Grade)
ALTER TABLE Grade ADD CONSTRAINT Grade_Course
    FOREIGN KEY (Course)
    REFERENCES Course (Id);

-- Reference: Grade_Student (table: Grade)
ALTER TABLE Grade ADD CONSTRAINT Grade_Student
    FOREIGN KEY (Student)
    REFERENCES Student (Id);

-- Reference: Grade_Teacher (table: Grade)
ALTER TABLE Grade ADD CONSTRAINT Grade_Teacher
    FOREIGN KEY (Teacher)
    REFERENCES Teacher (Id);

-- Reference: Student_Group_Group (table: Student_Group)
ALTER TABLE Student_Group ADD CONSTRAINT Student_Group_Group
    FOREIGN KEY ("Group")
    REFERENCES "Group" (Id);

-- Reference: Student_Group_Student (table: Student_Group)
ALTER TABLE Student_Group ADD CONSTRAINT Student_Group_Student
    FOREIGN KEY (Student)
    REFERENCES Student (Id);

-- Reference: Student_Person_Parent (table: Student)
ALTER TABLE Student ADD CONSTRAINT Student_Person_Parent
    FOREIGN KEY (Parent)
    REFERENCES Person (Id);

-- Reference: Student_Person_Student (table: Student)
ALTER TABLE Student ADD CONSTRAINT Student_Person_Student
    FOREIGN KEY (Id)
    REFERENCES Person (Id);

-- Reference: Teacher_Course_Course (table: Teacher_history)
ALTER TABLE Teacher_history ADD CONSTRAINT Teacher_Course_Course
    FOREIGN KEY (Course)
    REFERENCES Course (Id);

-- Reference: Teacher_Person (table: Teacher)
ALTER TABLE Teacher ADD CONSTRAINT Teacher_Person
    FOREIGN KEY (Id)
    REFERENCES Person (Id);

-- Reference: Teacher_Teacher (table: Teacher)
ALTER TABLE Teacher ADD CONSTRAINT Teacher_Teacher
    FOREIGN KEY (Supervisor)
    REFERENCES Teacher (Id);

-- Reference: Teacher_history_Teacher (table: Teacher_history)
ALTER TABLE Teacher_history ADD CONSTRAINT Teacher_history_Teacher
    FOREIGN KEY (Teacher)
    REFERENCES Teacher (Id);

-- End of file.

