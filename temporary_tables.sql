#Q1.
#a.
USE mirzakhani_1934;

CREATE TEMPORARY TABLE employees_with_departments AS (
SELECT first_name, last_name, dept_name
FROM employees.employees e
JOIN employees.dept_emp de ON e.emp_no = de.emp_no
JOIN employees.departments d ON de.dept_no = d.dept_no
LIMIT 100
);

SELECT *
FROM employees_with_departments;

#b.
ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

SELECT *
FROM employees_with_departments;

#c.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

SELECT *
FROM employees_with_departments;

#d. 

#2.
SELECT *
FROM payment;

CREATE TEMPORARY TABLE toal_pennies AS (
SELECT amount
FROM sakila.payment);

SELECT *
FROM total_pennies;

ALTER TABLE toal_pennies ADD pennies VARCHAR(100);

UPDATE toal_pennies SET pennies = (amount * 100);

SELECT *
FROM toal_pennies;

#3. Sales is making more money, Human resourcers makes much less
SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;

CREATE TEMPORARY TABLE salary AS (
SELECT salary
FROM employees.salaries);

SELECT *
FROM salary;

ALTER TABLE salary ADD avg_sal VARCHAR(100);

UPDATE salary SET avg_sal = (SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM employees.salaries);

SELECT AVG(salary), STD(salary)
FROM employees.salaries
WHERE to_date > CURDATE();

CREATE TEMPORARY TABLE overall_aggregates AS (
SELECT AVG(salary) AS avg_salary, STD(salary) AS std_salary
FROM employees.salaries
WHERE to_date > CURDATE()
);

SELECT *
FROM overall_aggregates;

SELECT dept_name, AVG(salary) AS department_current_average
FROM employees.salaries
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE employees.dept_emp.to_date > CURDATE()
AND employees.salaries.to_date > CURDATE()
GROUP BY dept_name;