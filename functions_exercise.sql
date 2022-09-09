#Q2.
SELECT CONCAT (first_name, ' ', last_name) as full_name
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%';
    
#Q3.
SELECT UPPER (CONCAT (first_name, ' ', last_name)) as full_name
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%';
    
#Q4.
SELECT datediff( Now(), hire_date)
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%';
	
#Q5. 
SELECT MIN(salary), MAX(salary) from salaries;

#Q6. 
SELECT Concat(Lower(substr(first_name, 1, 1)), lower (substr(last_name, 1, 4)), '_', substr(birth_date, 6, 2), substr(birth_date, 3, 2)) as username
	FROM employees;




