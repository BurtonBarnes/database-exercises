#Q2. there have been seven unique titles
SELECT DISTINCT title
	from titles;

#Q3.
SELECT last_name
FROM employees
WHERE last_name Like '%E'
	AND last_name LIKE 'E%'
	GROUP BY last_name;
    
#Q4.
SELECT DISTINCT first_name, last_name
FROM employees
WHERE last_name Like '%E'
	AND last_name LIKE 'E%'
    AND first_name LIKE 'E%'
    AND first_name LIKE '%E';
    
#Q5. Chleq, Lindqvist, and Qiwen
SELECT DISTINCT last_name
FROM employees
WHERE (last_name LIKE '%q%')
	AND (last_name NOT LIKE '%qu%');
    
#Q6. 
SELECT Count(last_name), last_name
FROM employees
WHERE (last_name LIKE '%q%')
	AND (last_name NOT LIKE '%qu%')
    GROUP BY last_name;
    
#Q7.
SELECT Count(first_name), first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
	Group BY first_name;
    
#Q8.
SELECT COUNT(*), Concat(Lower(substr(first_name, 1, 1)), 
	lower (substr(last_name, 1, 4)),
    '_',
    substr(birth_date, 6, 2), 
    substr(birth_date, 3, 2)) as username
	FROM employees
    GROUP BY username
    ORDER BY COUNT(*);