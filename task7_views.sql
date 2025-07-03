
-- Enable foreign keys
PRAGMA foreign_keys = ON;

-- Drop existing tables and views
DROP VIEW IF EXISTS HighEarners;
DROP VIEW IF EXISTS DeptStats;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Create Departments table
CREATE TABLE Departments (
    DeptID INTEGER PRIMARY KEY,
    DeptName TEXT NOT NULL
);

-- Create Employees table
CREATE TABLE Employees (
    EmpID INTEGER PRIMARY KEY,
    EmpName TEXT NOT NULL,
    Salary INTEGER NOT NULL,
    DeptID INTEGER,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Insert sample data into Departments
INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Insert sample data into Employees
INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(101, 'Alice', 60000, 1),
(102, 'Bob', 75000, 2),
(103, 'Charlie', 50000, 3),
(104, 'David', 80000, 2),
(105, 'Eve', 90000, 1);

-- View 1: High earners
CREATE VIEW HighEarners AS
SELECT EmpName, Salary
FROM Employees
WHERE Salary > 70000;

-- View 2: Department statistics
CREATE VIEW DeptStats AS
SELECT D.DeptName, COUNT(E.EmpID) AS EmployeeCount, AVG(E.Salary) AS AvgSalary
FROM Departments D
JOIN Employees E ON D.DeptID = E.DeptID
GROUP BY D.DeptName;

-- Use views
SELECT * FROM HighEarners;
SELECT * FROM DeptStats;
