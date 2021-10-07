CREATE TABLE IF NOT EXISTS titles (
	TitleID VARCHAR,
	Title VARCHAR NOT NULL,
	PRIMARY KEY (TitleID)
);



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



CREATE TABLE IF NOT EXISTS salaries (
	EmployeeID INT NOT NULL,
	Salary MONEY NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
	PRIMARY KEY (EmployeeID)
);



CREATE TABLE IF NOT EXISTS dep_type (
	DepartmentID VARCHAR NOT NULL,
	DepartmentName VARCHAR NOT NULL,
	PRIMARY KEY (DepartmentID)
);


CREATE TABLE IF NOT EXISTS dep_emp (
	EmployeeID INT,
	DepartmentID VARCHAR NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
	FOREIGN KEY (DepartmentID) REFERENCES dep_type(DepartmentID),
	PRIMARY KEY (EmployeeID, DepartmentID)
);


CREATE TABLE IF NOT EXISTS dep_man (
	DepartmentID VARCHAR NOT NULL,
	EmployeeID INT NOT NULL,
	FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
	FOREIGN KEY (DepartmentID) REFERENCES dep_type(DepartmentID),
	PRIMARY KEY (EmployeeID, DepartmentID)
);