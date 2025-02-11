CREATE Database School_SYS;
Use School_SYS;

CREATE TABLE Students
(
  StudentID INT NOT NULL IDENTITY(1,1),
  _Name VARCHAR(50) NOT NULL,
  _DateOfBirth DATE NOT NULL,
  _Address VARCHAR(50) NOT NULL,
  Phone VARCHAR(50) NOT NULL,
  _Email VARCHAR(50) NOT NULL,
  PRIMARY KEY (StudentID)
);

CREATE TABLE FamilyInfo
(
  _FamilyID INT NOT NULL IDENTITY(1,1),
  F_Name VARCHAR(50) NOT NULL,
  _F_Phone VARCHAR(50) NOT NULL,
  StudentID INT NOT NULL,
  PRIMARY KEY (_FamilyID),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Courses
(
  _CourseID INT NOT NULL IDENTITY(1,1),
  CourseName VARCHAR(50) NOT NULL,
  _Description VARCHAR(255) NOT NULL,
  __Resources VARCHAR(255) NOT NULL,
  PRIMARY KEY (_CourseID)
);

CREATE TABLE Classes
(
  ClassID INT NOT NULL IDENTITY(1,1),
  Class_code VARCHAR(50) NOT NULL,
  room_number VARCHAR(50) NOT NULL,
  Schedule VARCHAR(50) NOT NULL,
  PRIMARY KEY (ClassID)
);

CREATE TABLE Assignments
(
  AssignmentID INT NOT NULL IDENTITY(1,1),
  Assignment_Name VARCHAR(50) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  Status_ VARCHAR(50) NOT NULL,
  _CourseID INT NOT NULL,
  PRIMARY KEY (AssignmentID),
  FOREIGN KEY (_CourseID) REFERENCES Courses(_CourseID)
);

CREATE TABLE Attendance
(
  AttendanceID INT NOT NULL IDENTITY(1,1),
  _Attendance_Date DATE NOT NULL,
  AbsenceType VARCHAR(50) NOT NULL,
  Reason VARCHAR(255) NOT NULL,
  StudentID INT NOT NULL,
  PRIMARY KEY (AttendanceID),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

CREATE TABLE Student_Courses
(
  StudentID INT NOT NULL,
  _CourseID INT NOT NULL,
  PRIMARY KEY (StudentID, _CourseID),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (_CourseID) REFERENCES Courses(_CourseID)
);

CREATE TABLE Student_Classes
(
  StudentID INT NOT NULL,
  ClassID INT NOT NULL,
  PRIMARY KEY (StudentID, ClassID),
  FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Students (_Name, _DateOfBirth, _Address, Phone, _Email)
VALUES 
('Ali Ahmed', '2000-05-15', '123 Main St', '1234567890', 'ali.ahmed@example.com'),
('Sara Khalid', '2001-08-22', '456 Elm St', '9876543210', 'sara.khalid@example.com'),
('Mohammed Noor', '1999-12-10', '789 Oak St', '1122334455', 'mohammed.noor@example.com'),
('Lina Hassan', '2002-03-05', '321 Pine St', '5566778899', 'lina.hassan@example.com'),
('Omar Saeed', '2000-07-18', '654 Cedar St', '6677889900', 'omar.saeed@example.com');

INSERT INTO FamilyInfo (F_Name, _F_Phone, StudentID)
VALUES 
('Ahmed Ali', '1239874560', 1),
('Khalid Hassan', '9873216540', 2),
('Noor Mohammed', '7418529630', 3),
('Hassan Lina', '3692581470', 4),
('Saeed Omar', '1597534860', 5);


INSERT INTO Courses (CourseName, _Description, __Resources)
VALUES 
('Math', 'Algebra and Geometry', 'math_resources.pdf'),
('Physics', 'Mechanics and Thermodynamics', 'physics_resources.pdf'),
('Chemistry', 'Organic and Inorganic Chemistry', 'chemistry_resources.pdf'),
('Computer Science', 'Programming and Data Structures', 'cs_resources.pdf'),
('History', 'World and Regional History', 'history_resources.pdf');



INSERT INTO Classes (Class_code, room_number, Schedule)
VALUES 
('MTH101', 'A101', 'Mon-Wed-Fri 10:00-11:30'),
('PHY102', 'B202', 'Tue-Thu 09:00-10:30'),
('CHM103', 'C303', 'Mon-Wed 12:00-13:30'),
('CSE104', 'D404', 'Tue-Thu 14:00-15:30'),
('HIS105', 'E505', 'Fri 08:00-10:00');

INSERT INTO Assignments (Assignment_Name, Description, Status_, _CourseID)
VALUES 
('Math Assignment 1', 'Solve algebra problems', 'Completed', 1),
('Physics Lab Report', 'Write about experiments', 'Pending', 2),
('Chemistry Research', 'Organic compounds study', 'Completed', 3),
('Programming Task', 'Write a Python script', 'Pending', 4),
('History Essay', 'Research World War II', 'Completed', 5);

INSERT INTO Attendance (_Attendance_Date, AbsenceType, Reason, StudentID)
VALUES 
('2024-01-02', 'Sick', 'Flu', 1),
('2024-01-03', 'Excused', 'Family event', 2),
('2024-01-04', 'Unexcused', 'Missed class', 3),
('2024-01-05', 'Sick', 'Cold', 4),
('2024-01-06', 'Excused', 'Medical appointment', 5);


INSERT INTO Student_Courses (StudentID, _CourseID)
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),
(5, 5);


INSERT INTO Student_Classes (StudentID, ClassID)
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4),
(5, 5); 

SELECT * FROM Students WHERE _DateOfBirth = '2000-05-15';

SELECT * FROM Courses WHERE CourseName = 'Math';

ALTER TABLE Students ADD Email VARCHAR(50);

INSERT INTO Students (_Name, _DateOfBirth, _Address, Phone, _Email)
VALUES ('Hassan Ali', '2003-09-10', '55 irbid', '222222222222222', 'hassan.ali@example.com');


Select Students.* From Students INNER JOIN
FamilyInfo on Students.StudentID=FamilyInfo.StudentID;

SELECT Students.* 
FROM Students
INNER JOIN Student_Courses ON Students.StudentID = Student_Courses.StudentID
INNER JOIN Courses ON Student_Courses._CourseID = Courses._CourseID
WHERE Courses.CourseName = 'Math';


SELECT Students.* 
FROM Students
INNER JOIN Student_Courses ON Students.StudentID = Student_Courses.StudentID
INNER JOIN Assignments ON Student_Courses._CourseID = Assignments._CourseID
WHERE Assignments.Assignment_Name = 'SQL Assignment' AND Assignments.Status_ = 'Completed';


SELECT Students.* 
FROM Students
INNER JOIN Attendance ON Students.StudentID = Attendance.StudentID
WHERE Attendance._Attendance_Date BETWEEN '2024-01-01' AND '2024-01-05';
