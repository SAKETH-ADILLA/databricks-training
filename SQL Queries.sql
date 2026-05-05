-- 1
SELECT * FROM Employee;

-- 2
SELECT name, salary FROM Employee;

-- 3
SELECT * FROM Employee WHERE age > 30;

-- 4
SELECT name FROM Department;

-- 5
SELECT e.* 
FROM Employee e
JOIN Department d ON e.department_id = d.department_id
WHERE d.name = 'IT';

-- 6
SELECT * FROM Employee WHERE name LIKE 'J%';

-- 7
SELECT * FROM Employee WHERE name LIKE '%e';

-- 8
SELECT * FROM Employee WHERE name LIKE '%a%';

-- 9
SELECT * FROM Employee WHERE LENGTH(name) = 9;

-- 10
SELECT * FROM Employee WHERE name LIKE '_o%';

-- 11
SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;

-- 12
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;

-- 13
SELECT * FROM Employee WHERE YEAR(hire_date) < 2019;

-- 14
SELECT * FROM Employee WHERE hire_date >= '2021-03-01';

-- 15
SELECT * FROM Employee 
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 16
SELECT SUM(salary) FROM Employee;

-- 17
SELECT AVG(salary) FROM Employee;

-- 18
SELECT MIN(salary) FROM Employee;

-- 19
SELECT department_id, COUNT(*) 
FROM Employee GROUP BY department_id;

-- 20
SELECT department_id, AVG(salary) 
FROM Employee GROUP BY department_id;

-- 21
SELECT department_id, SUM(salary) 
FROM Employee GROUP BY department_id;

-- 22
SELECT department_id, AVG(age) 
FROM Employee GROUP BY department_id;

-- 23
SELECT YEAR(hire_date), COUNT(*) 
FROM Employee GROUP BY YEAR(hire_date);

-- 24
SELECT department_id, MAX(salary) 
FROM Employee GROUP BY department_id;

-- 25
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

-- 26
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 27
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- 28
SELECT YEAR(hire_date)
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- 29
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- 30
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- 31
SELECT * FROM Employee ORDER BY salary ASC;

-- 32
SELECT * FROM Employee ORDER BY age DESC;

-- 33
SELECT * FROM Employee ORDER BY hire_date ASC;

-- 34
SELECT * FROM Employee ORDER BY department_id, salary;

-- 35
SELECT department_id, SUM(salary) AS total
FROM Employee
GROUP BY department_id
ORDER BY total;

-- 36
SELECT e.name, d.name
FROM Employee e
JOIN Department d ON e.department_id = d.department_id;

-- 37
SELECT p.name, d.name
FROM Project p
JOIN Department d ON p.department_id = d.department_id;

-- 38
SELECT e.name, p.name
FROM Employee e
JOIN Project p ON e.department_id = p.department_id;

-- 39
SELECT e.*, d.name
FROM Employee e
LEFT JOIN Department d ON e.department_id = d.department_id;

-- 40
SELECT d.*, e.name
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id;

-- 46
SELECT * FROM Employee
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- 47
SELECT * FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 48
SELECT MAX(salary) FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- 49
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 50
SELECT *
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);