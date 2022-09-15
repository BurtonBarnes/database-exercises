SELECT CONCAT(first_name, ' ', last_name) AS full_name, hire_date AS start_date
FROM employees;

#Q1. C
SELECT dept_no, from_date AS start_date, to_date, emp_no,
	CASE to_date
		WHEN '9999-01-01' THEN 1
        ELSE 0
	END AS still_employed
FROM dept_emp;

#Q2.
SELECT *,
	CASE 
		WHEN last_name IN('A%', 'B%','C%', 'D%', 'E%', 'F%', 'G%', 'H%') THEN 'A-H'
		WHEN last_name IN('I%', 'J%','K%', 'L%', 'M%', 'N%', 'O%', 'P%', 'Q%') THEN 'I-Q'
		WHEN last_name IN('R%', 'S%','T%', 'U%', 'V%', 'W%', 'X%', 'Y%', 'Z%') THEN 'A-H'
    END AS alpha_group
FROM employees;

#Q3.
SELECT birth_date,
	COUNT(CASE WHEN birth_date LIKE '195%' THEN birth_date ELSE NULL END) AS '1950s',
    COUNT(CASE WHEN birth_date LIKE '196%' THEN birth_date ELSE NULL END) AS '1960s'
FROM employees
GROUP BY birth_date;

#Q4.
SELECT dept_name
FROM departments
WHERE dept_no IN (SELECT dept_no
					FROM dept_emp);