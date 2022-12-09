-- Creating table with analysis of students records (SQL Server)
SELECT CONCAT(UPPER(s.last_name), ', ', LOWER(s.first_name)) AS full_name,
	COUNT(c.course_id) AS number_of_course,
	ISNULL(MIN(g.grade), '0') AS min_grade,
	ISNULL(MAX(g.grade), '0') AS max_grade,
	ISNULL(AVG(g.grade), '0') AS av_grade,

CASE 
	WHEN AVG(g.grade) >= 90 THEN 'A'
	WHEN AVG(g.grade) >= 80 THEN 'B'
	WHEN AVG(g.grade) >= 70 THEN 'C' 
	ELSE 'F'
END AS letter_grade,

CASE 
	WHEN COUNT(c.course_id) >= 1 THEN 'enrolled'
	ELSE 'not enrolled'
END AS enrollment

FROM students AS s
	FULL JOIN grades AS g
	ON s.student_id = g.student_id
	FULL JOIN courses AS c
	ON g.course_id = c.course_id
GROUP BY s.last_name, s.First_name
ORDER BY max_grade DESC
;


-- Finding employees under certain conditions (My SQL)
SELECT  first_name, 
	last_name, 
        count(emp_no), 
	count(DISTINCT gender)
FROM employees
	WHERE birth_date > '1960-01-01' 
  	AND hire_date < '1990-01-01'
  	AND first_name LIKE 'a%'
GROUP BY first_name, last_name
HAVING count(emp_no) > 1 AND count(DISTINCT gender) = 2
;

  








