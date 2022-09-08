
SELECT DISTINCT title FROM titles;

#Q3. Alselm Cappello, Utz Mandell, Bouchung Schgreitr, Baocai Kushner, Petter Stroustrup
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%'
    Order By hire_date ASC
    Limit 5;
    
#Q4. Limit tells you how much is on a single page while offset is the pages numbered, defined by limit
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25'
	AND hire_date LIKE '199%'
    Order By hire_date ASC
    Limit 5 OFFSET 45;