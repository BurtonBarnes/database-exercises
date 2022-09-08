#Q2. first row was Irena Acton last row is Maya Zyda
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name ASC;

#Q3. Irena Acton and Vidya Zxeizig
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
	ORDER BY first_name, last_name ASC;

#Q4. Irena Acton and Maya Zyda
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya') 
	ORDER BY last_name, first_name ASC;

#Q5. 899 returned. First: Ramzi Erde 10021, last: Tadahiro Erde 499648
SELECT *
FROM employees
WHERE last_name Like '%E' and last_name like 'E%'
	ORDER By emp_no ASC;
    
#Q6. 899 returned. Oldest: Sergi Erde, Newest: Teiji Eldridge
SELECT *
FROM employees
WHERE last_name Like '%E' and last_name like 'E%'
	ORDER By hire_date ASC;
    
#Q7. 362 returned. Oldest employee is Khun Bernini, Younges: Douadi Pettis
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%'
    ORDER BY birth_date ASC, hire_date DESC;