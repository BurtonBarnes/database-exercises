#Q1.
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name
FROM employees
WHERE hire_date = (SELECT hire_date
					FROM employees
					WHERE emp_no = '101010');

#Q2.
SELECT DISTINCT title
FROM titles
WHERE to_date = '9999-01-01' AND emp_no IN (SELECT emp_no
											FROM employees
											WHERE first_name = 'Aamod');
                
#Q3. 85108 employees are no longer working for the company
SELECT COUNT(*)
FROM employees
WHERE emp_no IN (SELECT emp_no
				FROM dept_emp
				WHERE to_date NOT LIKE '9999-01-01');

#Q4.
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name
FROM employees
WHERE gender = 'F' AND emp_no IN (SELECT emp_no
								FROM dept_manager
                                WHERE to_date > CURDATE());
                                
#Q5.
SELECT emp_no
FROM salaries
WHERE to_date = '9999-01-01' AND salary > (SELECT AVG(salary)
											FROM salaries);

#Q6.a. 83 employees within 1 deviation of max
SELECT COUNT(*)
FROM salaries
WHERE to_date > CURDATE()
AND salary > ((SELECT MAX(salary) FROM salaries WHERE to_date > CURDATE()) - (SELECT STD(salary) FROM salaries WHERE to_date > CURDATE()));
#b. 

#Bonus 1
SELECT dept_name
FROM departments
WHERE dept_no IN (SELECT dept_no
FROM dept_manager
WHERE emp_no IN (SELECT emp_no
FROM employees
WHERE gender = 'F'));

#Bonus 2
SELECT CONCAT(first_name, ' ', last_name) as Full_Name
FROM employees
WHERE emp_no = (SELECT emp_no
FROM salaries
ORDER BY salary DESC
LIMIT 1);

#Bonus 3
SELECT dept_name
FROM departments
WHERE dept_no = (SELECT dept_no
FROM dept_emp
WHERE emp_no = (SELECT emp_no
FROM employees
WHERE emp_no = (SELECT emp_no
FROM salaries
ORDER BY salary DESC
LIMIT 1)));