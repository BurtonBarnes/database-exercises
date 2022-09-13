USE employees;

DESCRIBE dept_emp;

DESCRIBE employees;

SELECT * FROM employees LIMIT 50;

SELECT * FROM dept_emp LIMIT 40;
#inner join of employees and dept_emp
SELECT * 
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
LIMIT 50;

# inner join employees, dept_emp and departments
SELECT *
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
LIMIT 50;

# selecting first_name, last_name, and dept_name from inner join of employees
SELECT employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
LIMIT 50;

#with aliases and where clause
SELECT e.first_name, e.last_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON employees.emp_no = dept_emp.emp_no
JOIN departments AS d ON dept_emp.dept_no = departments.dept_no
WHERE e.gender = 'F';
#Join example exercises
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
#Employees Database
#Q1. 
USE employees;

#Q2.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
  WHERE de.to_date = '9999-01-01';
  
#Q3.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_manager AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
  WHERE de.to_date = '9999-01-01' AND e.gender = 'F';
  
#Q4.
SELECT t.title, COUNT(de.emp_no)
FROM dept_emp de
JOIN titles t ON de.emp_no = t.emp_no
	AND t.to_date > CURDATE()
    AND de.to_date > CURDATE()
JOIN departments d ON de.dept_no = d.dept_no
	AND d.dept_name = 'Customer Service'
GROUP BY t.title;

#Q5.
SELECT d.dept_name AS 'Department Name', 
	CONCAT(e.first_name, ' ', e.last_name) AS 'Name', 
    s.salary AS 'Salary'
FROM employees e
JOIN salaries s On e.emp_no = s.emp_no
	AND s.to_date > CURDATE ()
JOIN dept_manager dm oN e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN departments d ON dm.dept_no = d.dept_no
ORDER BY d.dept_name;

#Q6.
SELECT COUNT(dept_emp.emp_no), departments.dept_name, dept_emp.dept_no
FROM employees
LEFT JOIN dept_emp on dept_emp.emp_no = employees.emp_no
LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE to_date LIKE '999%'
GROUP BY dept_emp.dept_no
ORDER BY departments.dept_no;

#Q7.
SELECT d.dept_name,
	ROUND(AVG(salary), 2)AS average_salary
FROM dept_emp de
JOIN salaries s ON de.emp_no = s.emp_no
	AND de.to_date > CURDATE()
    AND s.to_date > CURDATE()
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#Q8.
SELECT e.first_name, e.last_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
	AND de.to_date > CURDATE()
JOIN salaries s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments d ON de.dept_no = d.dept_no
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

#Q9.
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN salaries s ON e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments d ON dm.dept_no = d.dept_no
ORDER BY s.salary DESC
LIMIT 1;

#Q10.
SELECT d.dept_name,
	ROUND(AVG(salary), 2)AS average_salary
FROM departments d
JOIN salaries s ON de.emp_no = s.emp_no
JOIN dept_emp de ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary;