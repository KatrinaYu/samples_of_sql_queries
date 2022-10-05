
-- Having query 
SELECT  first_name, last_name, 
        count(emp_no), count(DISTINCT gender)
  FROM employees
WHERE birth_date > '1960-01-01' 
  AND hire_date < '1990-01-01'
  AND first_name LIKE 'a%'
GROUP BY first_name, last_name
HAVING count(emp_no) > 1 
   AND count(DISTINCT gender) = 2
;
  
-- JOIN query
SELECT first_name, last_name, dept_no
  FROM employees AS emp
LEFT JOIN dept_manager AS man
      ON emp.emp_no = man.emp_no
WHERE dept_no IS NOT NULL
; 

-- CASE query
SELECT ROUND(AVG(salary) ,0) AS rounded_avg_sal,
CASE
	WHEN salary BETWEEN 30000 AND 60000 THEN 'low_salary'
	WHEN salary BETWEEN 60001 AND 110000 THEN 'mid_salary'
	WHEN salary BETWEEN 110001 AND 180000 THEN 'high_salary'
    ELSE 'empty' 
END AS level_sal
  FROM salaries
GROUP BY level_sal
;





