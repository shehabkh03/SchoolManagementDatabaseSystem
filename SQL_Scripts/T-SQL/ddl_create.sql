-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-01-23 21:49:11.28

-- tables
-- Table: Assignment
CREATE TABLE Assignment (
    Id int  NOT NULL,
    Description varchar(30)  NOT NULL,
    Start_date date  NOT NULL,
    Due_date date  NOT NULL,
    Course int  NOT NULL,
    CONSTRAINT Assignment_pk PRIMARY KEY  (Id)
);

-- Table: Attendance
CREATE TABLE Attendance (
    Id int  NOT NULL,
    Class int  NOT NULL,
    Status char(1)  NOT NULL,
    Student int  NOT NULL,
    CONSTRAINT Attedance_Status_Check CHECK (Status In ('P','A','E')),
    CONSTRAINT Attendance_pk PRIMARY KEY  (Id)
);

-- Table: Class
CREATE TABLE Class (
    Id int  NOT NULL,
    Time datetime  NOT NULL,
    Date date  NOT NULL,
    Room int  NOT NULL,
    "Group" int  NOT NULL,
    Course int  NOT NULL,
    Teacher int  NOT NULL,
    CONSTRAINT Class_pk PRIMARY KEY  (Id)
);

-- Table: Course
CREATE TABLE Course (
    Id int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Description varchar(100)  NOT NULL,
    Credit_Hours int  NOT NULL,
    CONSTRAINT Course_pk PRIMARY KEY  (Id)
);

-- Table: Grade
CREATE TABLE Grade (
    Id int  NOT NULL,
    Grade decimal(2,1)  NOT NULL,
    Course int  NOT NULL,
    Student int  NOT NULL,
    Teacher int  NOT NULL,
    CONSTRAINT Grade_pk PRIMARY KEY  (Id)
);

-- Table: Group
CREATE TABLE "Group" (
    Id int  NOT NULL,
    Code varchar(4)  NOT NULL,
    CONSTRAINT Group_pk PRIMARY KEY  (Id)
);

-- Table: Person
CREATE TABLE Person (
    Id int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Surname varchar(30)  NOT NULL,
    Pesel char(11)  NOT NULL,
    Birthdate date  NOT NULL,
    Gender char(1)  NOT NULL,
    Address varchar(30)  NOT NULL,
    PhoneNo varchar(12)  NOT NULL,
    CONSTRAINT Gender_Check CHECK (Gender In ('M','F')),
    CONSTRAINT Person_pk PRIMARY KEY  (Id)
);

-- Table: Room
CREATE TABLE Room (
    Id int  NOT NULL,
    Number int  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY  (Id)
);

-- Table: Student
CREATE TABLE Student (
    Id int  NOT NULL,
    Number varchar(20)  NOT NULL,
    Status char(1)  NOT NULL,
    Emergency_ContactNo varchar(12)  NULL,
    Parent int  NOT NULL,
    CONSTRAINT Student_Status_Check CHECK (Status In ('A','S')),
    CONSTRAINT Student_pk PRIMARY KEY  (Id)
);

-- Table: Student_Group
CREATE TABLE Student_Group (
    Student int  NOT NULL,
    "Group" int  NOT NULL,
    Date_from date  NOT NULL,
    Date_to date  NULL,
    CONSTRAINT Student_Group_pk PRIMARY KEY  (Student,"Group")
);

-- Table: Teacher
CREATE TABLE Teacher (
    Id int  NOT NULL,
    Salary money  NOT NULL,
    Employment_date date  NOT NULL,
    Dismissal_date date  NULL,
    Supervisor int  NULL,
    CONSTRAINT Teacher_pk PRIMARY KEY  (Id)
);

-- Table: Teacher_history
CREATE TABLE Teacher_history (
    Teacher int  NOT NULL,
    Course int  NOT NULL,
    Date_from date  NOT NULL,
    Date_to date  NULL,
    CONSTRAINT Teacher_history_pk PRIMARY KEY  (Date_from,Course,Teacher)
);

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

-- Reference: Teacher_Person (table: Teacher)
ALTER TABLE Teacher ADD CONSTRAINT Teacher_Person
    FOREIGN KEY (Id)
    REFERENCES Person (Id);

-- Reference: Teacher_Teacher (table: Teacher)
ALTER TABLE Teacher ADD CONSTRAINT Teacher_Teacher
    FOREIGN KEY (Supervisor)
    REFERENCES Teacher (Id);

-- Reference: Teacher_history_Course (table: Teacher_history)
ALTER TABLE Teacher_history ADD CONSTRAINT Teacher_history_Course
    FOREIGN KEY (Course)
    REFERENCES Course (Id);

-- Reference: Teacher_history_Teacher (table: Teacher_history)
ALTER TABLE Teacher_history ADD CONSTRAINT Teacher_history_Teacher
    FOREIGN KEY (Teacher)
    REFERENCES Teacher (Id);

-- End of file.

