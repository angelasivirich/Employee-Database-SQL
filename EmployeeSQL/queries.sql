
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
CREATE VIEW employee_salary AS -- will be used in python, to create the hystogram
SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", e.sex AS "Sex", s.salary AS "Salary"
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986

SELECT first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE hire_date  >= '1986-01-01' AND hire_date <= '1986-12-31' 
ORDER BY hire_date;


-- 3. List the manager of each department with the following information:department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no AS "Department Number", d.dept_name AS "Department Name", dm.emp_no AS "Manager Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name" 
FROM department AS d
INNER JOIN department_manager AS dm
ON (d.dept_no = dm.dept_no)
	INNER JOIN employees AS e
	ON (dm.emp_no = e.emp_no);

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.


SELECT e.emp_no AS "Employee Number", e.last_name "Last Name", e.first_name "First Name", x.dept_name AS "Department Name"
FROM employees AS e
JOIN(
	SELECT de.emp_no, d.dept_name
	FROM department_employee AS de
	JOIN department AS d
	ON (de.dept_no = d.dept_no)
) AS x
ON (x.emp_no = e.emp_no)


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name AS "First Name", last_name AS "Last Name", sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE ‘B%’

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", x.dept_name AS "Department Name"
FROM employees AS e 
JOIN
	(SELECT *
	FROM department_employee AS de
	JOIN department AS d
	ON ( d.dept_no = de.dept_no)
	WHERE d.dept_name = 'Sales'
	 ) AS x
ON (e.emp_no = x.emp_no)


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", x.dept_name AS "Department Name"
FROM employees AS e 
JOIN
	(SELECT *
	FROM department_employee AS de
	JOIN department AS d
	ON ( d.dept_no = de.dept_no)
	WHERE d.dept_name IN ('Development', 'Sales')
	 ) AS x
ON (e.emp_no = x.emp_no)

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT (last_name) As "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC

--BONUS. Create a bar chart of average salary by title.3. Create a bar chart of average salary by title.
CREATE VIEW average_salary AS
SELECT t.title AS "Title", ROUND(AVG(s.salary),2) AS "Average Salary"
FROM department_employee AS de
JOIN employees AS e
ON (de.emp_no = e.emp_no)
		JOIN salaries AS s
		ON (s.emp_no = e.emp_no)
			JOIN titles AS t
			ON(t.title_id = e.emp_title_id)
GROUP BY t.title
			



