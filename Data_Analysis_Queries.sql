SELECT *
FROM employees
LIMIT 10;

SELECT *
FROM dept_emp;

--#1
SELECT e.emp_no, last_name, sex, salary
FROM   employees e
	   JOIN salaries s ON e.emp_no = s.emp_no;
--#2	   
SELECT  first_name, last_name, hire_date
FROM	employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986';

--#3

WITH departments_cte AS(
	SELECT *
	FROM departments
) 
, dept_man_cte AS(
	SELECT dm.dept_no, emp_no, dep.dept_name
	FROM dept_manager dm
		JOIN departments_cte dep ON dm.dept_no = dep.dept_no
)
SELECT  d.dept_no, dept_name, e.emp_no, last_name, first_name
FROM employees e
	JOIN dept_man_cte d ON e.emp_no = d.emp_no;


--#4

WITH departments_cte AS (
	SELECT *
	FROM departments
)
, dept_emp_cte AS (
	SELECT de.dept_no, dept_name, de.emp_no
	FROM dept_emp de
		JOIN departments_cte dep ON de.dept_no = dep.dept_no
)
SELECT e.emp_no, last_name, first_name, dept_name
FROM   employees e
	   JOIN dept_emp_cte dect on e.emp_no = dect.emp_no;

