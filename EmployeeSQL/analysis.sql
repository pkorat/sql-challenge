-- Get the salary of each employee
SELECT emp.EmployeeID, emp.LastName, emp.FirstName, emp.Sex, s.salary 
FROM employees as emp
INNER JOIN salaries as s ON s.EmployeeID=emp.EmployeeID
ORDER BY emp.EmployeeID;

-- Employees hired in 1986
SELECT emp.FirstName, emp.LastName, emp.HireDate 
FROM employees as emp
WHERE emp.hiredate::text LIKE '1986%'
ORDER BY emp.hiredate;

-- Managers for each department
SELECT dm.departmentid, dt.departmentname, dm.employeeid, emp.firstname, emp.lastname
FROM dep_man as dm
INNER JOIN dep_type as dt
ON dt.departmentid = dm.departmentid
INNER JOIN employees as emp
ON dm.employeeid = emp.employeeid;

-- Employee departments
SELECT emp.employeeid, emp.lastname, emp.firstname, dt.departmentname
FROM employees as emp
INNER JOIN dep_emp as de
ON de.employeeid = emp.employeeid
INNER JOIN dep_type as dt
ON dt.departmentid = de.departmentid;

-- Employees search
SELECT emp.firstname, emp.lastname, emp.sex
FROM employees as emp
WHERE emp.firstname = 'Hercules'
AND emp.lastname LIKE 'B%'
ORDER BY emp.lastname;

-- Sales Department employees
SELECT emp.employeeid, emp.lastname, emp.firstname, dt.departmentname
FROM employees as emp
INNER JOIN dep_emp as de
ON emp.employeeid = de.employeeid
INNER JOIN dep_type as dt
ON de.departmentid = dt.departmentid
WHERE dt.departmentname LIKE 'Sales'
ORDER BY emp.employeeid;

-- Sales and Development department employees
SELECT emp.employeeid, emp.lastname, emp.firstname, dt.departmentname
FROM employees as emp
INNER JOIN dep_emp as de
ON emp.employeeid = de.employeeid
INNER JOIN dep_type as dt
ON de.departmentid = dt.departmentid
WHERE dt.departmentname = 'Development'
OR dt.departmentname LIKE 'Sales'
ORDER BY emp.employeeid;

-- Frequency of lastnames
SELECT emp.lastname, COUNT(emp.lastname)
FROM employees as emp
GROUP BY emp.lastname
ORDER BY COUNT(emp.lastname) DESC;