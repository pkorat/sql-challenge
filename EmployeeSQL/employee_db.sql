CREATE TABLE IF NOT EXISTS titles (
	TitleID VARCHAR,
	Title VARCHAR NOT NULL,
	PRIMARY KEY (TitleID)
);

SELECT *
FROM titles;


CREATE TABLE IF NOT EXISTS employees (
	EmployeeID INT,
	TitleID VARCHAR NOT NULL,
	BirthDate DATE,
	FirstName VARCHAR NOT NULL,
	LastName VARCHAR NOT NULL,
	Sex VARCHAR NOT NULL,
	HireDate DATE,
	PRIMARY KEY (EmployeeID),
	FOREIGN KEY (TitleID) REFERENCES titles(TitleID)
);

SELECT *
FROM employees;


CREATE TABLE IF NOT EXISTS salaries (
	EmployeeID INT,
	Salary MONEY NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID)
);

SELECT *
FROM salaries;


CREATE TABLE IF NOT EXISTS dep_type (
	DepartmentID VARCHAR NOT NULL,
	DepartmentName VARCHAR NOT NULL,
	PRIMARY KEY (DepartmentID)
);

SELECT *
FROM dep_type;


CREATE TABLE IF NOT EXISTS departments (
	EmployeeID INT,
	DepartmentID VARCHAR NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
	FOREIGN KEY (DepartmentID) REFERENCES dep_type(DepartmentID)
);

SELECT *
FROM departments;




SELECT emp.EmployeeID, tt.Title, emp.BirthDate, emp.FirstName, emp.LastName, 
	emp.Sex, emp.HireDate, salaries.Salary, dep.DepartmentID,
	dep_type.DepartmentName
FROM employees AS emp
JOIN titles AS tt
	ON emp.TitleID = tt.TitleID
JOIN salaries
	ON emp.EmployeeID = salaries.EmployeeID
JOIN departments AS dep
	ON emp.EmployeeID = dep.EmployeeID
JOIN dep_type
	ON dep.DepartmentID = dep_type.DepartmentID;