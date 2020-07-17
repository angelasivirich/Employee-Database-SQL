CREATE TABLE department (
	dept_no VARCHAR(15) PRIMARY KEY,
	dept_name VARCHAR(20)
);

							   
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(20),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date DATE							  
);
					   
CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER
);
					  
CREATE TABLE titles(
	title_id VARCHAR(20) PRIMARY KEY,
	title VARCHAR(20)
);


CREATE TABLE department_employee(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(15),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY (emp_no,dept_no)
);
								
CREATE TABLE department_manager(
	dept_no VARCHAR(15),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no,dept_no)
);