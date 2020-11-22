CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY, 
	emp_title_id TEXT NOT NULL,
	birth_date DATE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date date NOT NULL
);

CREATE TABLE titles (
	title_id TEXT PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY(emp_no),
	CONSTRAINT fk_emp
		FOREIGN KEY (emp_no)
			REFERENCES employees(emp_no)
);

CREATE TABLE departments (
	dept_no TEXT PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INTEGER REFERENCES employees (emp_no),
	dept_no TEXT REFERENCES departments(dept_no),
	CONSTRAINT emp_dept_mp
	PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no TEXT REFERENCES departments(dept_no),
	emp_no INTEGER REFERENCES employees (emp_no),
	CONSTRAINT dept_emp_no
	PRIMARY KEY (dept_no, emp_no)
);
