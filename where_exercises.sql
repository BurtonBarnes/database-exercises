SELECT *
FROM employees;
DESCRIBE employees;

# Q2.
SELECT first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
# 709 rows returned, 709 employees with the above first names

#Q3.
SELECT first_name
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
#709 rows returned, it does match the rows from Q2

#Q4.
SELECT first_name
FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
	AND gender = 'M';
#441 employees returned

#Q5.
SELECT last_name
FROM employees
WHERE last_name Like 'E%';
# 7330 names returned

#Q6. 30723 names returned that either start or end with E. 23393 names end with e but don't start with e.
SELECT last_name
FROM employees
WHERE last_name Like '%E'
	AND last_name NOT LIKE 'E%';
    
#Q7. 899 names start and end with e. 24292 names end in e regardless of starting letter.
SELECT last_name
FROM employees
WHERE last_name Like '%E';

#Q8. returned 135214 employees
SELECT hire_date
FROM employees
WHERE hire_date LIKE '199%';

#Q9. 842 employees born on christmas
SELECT birth_date
FROM employees
WHERE birth_date LIKE '%12-25';

#Q10. 362 employees hired in 90s and born on chritmas
SELECT birth_date
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%';
    
#Q11. returned 1873 returned
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' OR last_name LIKE 'q%' OR last_name LIKE '%q';

#Q12 547 employees with q in name but no qu
SELECT last_name
FROM employees
WHERE (last_name LIKE '%q%' OR last_name LIKE 'q%' OR last_name LIKE '%q')
	AND (last_name NOT LIKE '%qu%' AND last_name NOT LIKE 'qu%' AND last_name NOT LIKE '%qu');