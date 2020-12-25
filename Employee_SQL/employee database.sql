SELECT * FROM employees
--List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT e.emp_no "Employee Number",e.last_name "Employee Last Number",e.first_name "Employee First Name",e.sex,s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_no=s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name "Employee First Name",last_name "Employee Last Name",hire_date "Hire Date"
FROM employees
WHERE date_part('year',hire_date) = '1986'
ORDER BY hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
-- SELECT * FROM departments
-- SELECT * FROM dept_manger 

SELECT dm.dept_no  "Department Number",d.dept_name  "Department Name",dm.emp_no  "Manager Number", 
e.last_name  "Manager Last Name", e.first_name  "Manager First Name"
FROM dept_manger dm
LEFT JOIN departments d ON dm.dept_no=d.dept_no
LEFT JOIN employees e ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT * FROM dept_emp

SELECT de.emp_no "Employee Number",e.last_name "Employee Last Name",e.first_name "Employee First Name",d.dept_name "Department Name"
FROM dept_emp de
LEFT JOIN employees e ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name "Employee First Name",last_name "Employee Last Name",sex "Sex"
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT de.emp_no "Employee Number",e.last_name "Employee Last Name",e.first_name "Employee First Name",d.dept_name "Department Name"
FROM dept_emp de
LEFT JOIN employees e ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT de.emp_no "Employee Number",e.last_name "Employee Last Name",e.first_name "Employee First Name",d.dept_name "Department Name"
FROM dept_emp de
LEFT JOIN employees e ON de.emp_no = e.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
SELECT last_name "Employee Last Name", COUNT(last_name) "Frequency Last Name"
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;