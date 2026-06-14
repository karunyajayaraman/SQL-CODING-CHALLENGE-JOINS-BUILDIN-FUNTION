
-- 1CREATE DATABASE

CREATE DATABASE StudentsDB;
USE StudentsDB;

-- CREATE TABLES

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Duration VARCHAR(20)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- INSERT SAMPLE DATA

INSERT INTO Students VALUES
(1, 'Aarav', 21, 'Chennai'),
(2, 'Meera', 22, 'Bangalore'),
(3, 'Karthik', 23, 'Hyderabad'),
(4, 'Divya', 21, 'Delhi');

INSERT INTO Courses VALUES
(101, 'Data Analytics', '3 Months'),
(102, 'Python Programming', '2 Months'),
(103, 'SQL Basics', '1 Month');

INSERT INTO Enrollments VALUES
(1001, 1, 101, '2025-05-10'),
(1002, 2, 102, '2025-06-01'),
(1003, 3, 103, '2025-06-15');

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

--------------------------------------------------------------------------------
-- DAY 5: SQL CODING CHALLENGE –JOINS & BUILDIN FUNTION
-- Question 1 – INNER JOIN

SELECT 
s.StudentID,
s.StudentName,
c.coursename
FROM students s JOIN 
enrollments e ON s.StudentID = e.StudentID
join Courses c
On c.CourseID = e.CourseID;

-------------------------------------------------------------------------------
-- Question 2 – LEFT JOIN and RIGHT JOIN

SELECT 
s.StudentID,
s.StudentName,
e.courseID,
e.EnrollmentDate
FROM Students s
LEFT JOIN 
enrollments e
ON s.StudentID = e.StudentID;


SELECT 
s.StudentID,
s.StudentName,
e.courseID,
e.EnrollmentDate
FROM students s
RIGHT JOIN 
enrollments e
ON s.StudentID = e.StudentID;

/*
LEFT JOIN → Returns all rows from the left table (Students) and matching rows from the right table (Enrollments).
RIGHT JOIN → Returns all rows from the right table (Enrollments) and matching rows from the left table (Students).
Non-matching rows display NULL values for the missing side.
*/
-----------------------------------------------------------------------------

-- Question 3 – ROUND()
SELECT ROUND(123.4567, 2) AS Rounded_values;
-----------------------------------------------------------------------------

-- Question 4 – ABS() & MOD()

SELECT 
ABS(-25) As Absolute_Value,
MOD(25,4) as Remainder;
------------------------------------------------------------------------------

-- Question 5 – CONCAT()

SELECT Studentname, City,
CONCAT (Studentname, ' From ', City) AS StudentDetails
FROM Students;
------------------------------------------------------------------------------

-- Question 6 – LENGTH()

SELECT Studentname,
LENGTH(Studentname) AS Name_Length
FROM Students;
-------------------------------------------------------------------------------
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

-- Question 7 – REPLACE()

SELECT Coursename,
REPLACE(Coursename, 'SQL', 'DataBase') AS Updated_Coursename
FROM Courses;
---------------------------------------------------------------------------

-- Question 8 – SUBSTRING()

SELECT Studentname, 
SUBSTRING(Studentname,1,3) AS Code_Prefix
FROM Students;
---------------------------------------------------------------------------
-- Question 9 – UPPER() & LOWER()

SELECT StudentID , Studentname,
UPPER(studentname) ,
LOWER(studentname)
FROM Students;
--------------------------------------------------------------------------

-- Question 10 – DATE FUNCTIONS (NOW, DATEDIFF, DATE_ADD)

SELECT 
StudentID,
EnrollmentDate,
NOW() AS Followup_date,
DATEDIFF('2026-06-08', '2025-05-10') as Days_Difference,
DATE_ADD(EnrollmentDate, INTERVAL 10 Day) AS Current_Datetime
FROM Enrollments;

------------------------------------------------------------------------
