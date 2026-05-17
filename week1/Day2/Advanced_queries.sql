**Schema (MySQL v5.7)**

    -- Create Department table
    CREATE TABLE Department (
        department_id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL
    );
    
    -- Create Employee table
    CREATE TABLE Employee (
        emp_id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        age INT,
        salary DECIMAL(10, 2),
        department_id INT,
        hire_date DATE,
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    -- Create Project table
    CREATE TABLE Project (
        project_id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        department_id INT,
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    -- Insert data into Department table
    INSERT INTO Department (department_id, name) VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Marketing');
    
    -- Insert data into Employee table
    INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
    (1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),
    (2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),
    (3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),
    (4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),
    (5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),
    (6, 'David Green', 38, 70000.00, 4, '2022-05-18'),
    (7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');
    
    -- Insert data into Project table
    INSERT INTO Project (project_id, name, department_id) VALUES
    (1, 'Project Alpha', 1),
    (2, 'Project Beta', 2),
    (3, 'Project Gamma', 1),
    (4, 'Project Delta', 3),
    (5, 'Project Epsilon', 4),
    (6, 'Project Zeta', 4),
    (7, 'Project Eta', 3);
    
    
    -- Insert additional data into Department table (if needed)
    -- No additional departments needed for this data set
    
    -- Insert additional data into Employee table to test edge cases for joins and nested queries
    INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
    (8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'),  -- Employee without a department
    (9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),
    (10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');
    
    -- Insert additional data into Project table to test edge cases for joins
    INSERT INTO Project (project_id, name, department_id) VALUES
    (8, 'Project Theta', 1),
    (9, 'Project Iota', NULL);  -- Project without a department

---

**Query #1**

    SELECT * FROM Employee
    ORDER BY salary;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #2**

    SELECT * FROM Employee
    ORDER BY salary DESC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

---
**Query #3**

    SELECT * FROM Employee
    ORDER BY YEAR(hire_date);

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

---
**Query #4**

    SELECT * FROM Employee
    ORDER BY department_id, salary;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

---
**Query #5**

    SELECT department_id, SUM(salary) AS dept_total
    FROM Employee
    GROUP BY department_id
    ORDER BY dept_total;

| department_id | dept_total |
| ------------- | ---------- |
|               | 48000.0    |
| 3             | 100000.0   |
| 2             | 110000.0   |
| 4             | 123000.0   |
| 1             | 195000.0   |

---
**Query #6**

    SELECT e.name AS emply_name, d.name AS dept_name
    FROM Employee e
    INNER JOIN Department d
    ON e.department_id = d.department_id;

| emply_name  | dept_name |
| ----------- | --------- |
| John Doe    | IT        |
| Bob Brown   | IT        |
| Grace Kelly | IT        |
| Jane Smith  | HR        |
| Charlie P.  | HR        |
| Alice Blue  | Finance   |
| Eve Black   | Finance   |
| David Green | Marketing |
| Hannah Lee  | Marketing |

---
**Query #7**

    SELECT p.name AS project_name, d.name AS dept_name
    FROM Project p
    INNER JOIN Department d
    ON p.department_id = d.department_id;

| project_name    | dept_name |
| --------------- | --------- |
| Project Alpha   | IT        |
| Project Gamma   | IT        |
| Project Theta   | IT        |
| Project Beta    | HR        |
| Project Delta   | Finance   |
| Project Eta     | Finance   |
| Project Epsilon | Marketing |
| Project Zeta    | Marketing |

---
**Query #8**

    SELECT e.name AS emp_name, p.name AS project_name
    FROM Employee e
    INNER JOIN Project p
    ON e.department_id = p.department_id;

| emp_name    | project_name    |
| ----------- | --------------- |
| John Doe    | Project Alpha   |
| Bob Brown   | Project Alpha   |
| Grace Kelly | Project Alpha   |
| Jane Smith  | Project Beta    |
| Charlie P.  | Project Beta    |
| John Doe    | Project Gamma   |
| Bob Brown   | Project Gamma   |
| Grace Kelly | Project Gamma   |
| Alice Blue  | Project Delta   |
| Eve Black   | Project Delta   |
| David Green | Project Epsilon |
| Hannah Lee  | Project Epsilon |
| David Green | Project Zeta    |
| Hannah Lee  | Project Zeta    |
| Alice Blue  | Project Eta     |
| Eve Black   | Project Eta     |
| John Doe    | Project Theta   |
| Bob Brown   | Project Theta   |
| Grace Kelly | Project Theta   |

---
**Query #9**

    SELECT e.name AS emp_name, d.name AS dept_name
    FROM Employee e
    LEFT JOIN Department d
    ON e.department_id = d.department_id;

| emp_name    | dept_name |
| ----------- | --------- |
| John Doe    | IT        |
| Bob Brown   | IT        |
| Grace Kelly | IT        |
| Jane Smith  | HR        |
| Charlie P.  | HR        |
| Alice Blue  | Finance   |
| Eve Black   | Finance   |
| David Green | Marketing |
| Hannah Lee  | Marketing |
| Frank White |           |

---
**Query #10**

    SELECT e.name AS emp_name, d.name AS dept_name
    FROM Employee e
    RIGHT JOIN Department d
    ON e.department_id = d.department_id;

| emp_name    | dept_name |
| ----------- | --------- |
| John Doe    | IT        |
| Bob Brown   | IT        |
| Grace Kelly | IT        |
| Jane Smith  | HR        |
| Charlie P.  | HR        |
| Alice Blue  | Finance   |
| Eve Black   | Finance   |
| David Green | Marketing |
| Hannah Lee  | Marketing |

---
**Query #11**

    SELECT e.emp_id, e.name AS employee_name
    FROM Employee e
    LEFT JOIN Project p
    ON e.department_id = p.department_id
    WHERE p.project_id IS NULL;

| emp_id | employee_name |
| ------ | ------------- |
| 8      | Frank White   |

---
**Query #12**

    SELECT e.emp_id,
           e.name AS employee_name,
           COUNT(p.project_id) AS number_of_projects
    FROM Employee e
    LEFT JOIN Project p
    ON e.department_id = p.department_id
    GROUP BY e.emp_id, e.name;

| emp_id | employee_name | number_of_projects |
| ------ | ------------- | ------------------ |
| 1      | John Doe      | 3                  |
| 2      | Jane Smith    | 1                  |
| 3      | Bob Brown     | 3                  |
| 4      | Alice Blue    | 2                  |
| 5      | Charlie P.    | 1                  |
| 6      | David Green   | 2                  |
| 7      | Eve Black     | 2                  |
| 8      | Frank White   | 0                  |
| 9      | Grace Kelly   | 3                  |
| 10     | Hannah Lee    | 2                  |

---
**Query #13**

    SELECT e.name AS emp_name, d.department_id
    FROM Employee e
    LEFT JOIN Department d
    ON e.department_id = d.department_id
    WHERE d.department_id IS NULL;

| emp_name    | department_id |
| ----------- | ------------- |
| Frank White |               |

---
**Query #14**

    SELECT e.name AS emp_name, d.department_id
    FROM Employee e
    LEFT JOIN Department d
    ON d.department_id = d.department_id
    WHERE d.department_id = 1;

| emp_name    | department_id |
| ----------- | ------------- |
| John Doe    | 1             |
| Jane Smith  | 1             |
| Bob Brown   | 1             |
| Alice Blue  | 1             |
| Charlie P.  | 1             |
| David Green | 1             |
| Eve Black   | 1             |
| Frank White | 1             |
| Grace Kelly | 1             |
| Hannah Lee  | 1             |

---
**Query #15**

    SELECT d.name AS department_name
    FROM Department d
    JOIN Employee e
    ON d.department_id = e.department_id
    GROUP BY d.name
    ORDER BY AVG(e.salary) DESC
    LIMIT 1;

| department_name |
| --------------- |
| IT              |

---
**Query #16**

    SELECT name, salary
    FROM Employee
    WHERE salary = (SELECT MAX(salary) FROM Employee);

| name      | salary  |
| --------- | ------- |
| Bob Brown | 80000.0 |

---
**Query #17**

    SELECT name, salary
    FROM Employee
    WHERE salary > (SELECT AVG(salary) FROM Employee);

| name        | salary  |
| ----------- | ------- |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| David Green | 70000.0 |
| Grace Kelly | 65000.0 |

---
**Query #18**

    SELECT MAX(salary) AS second_highest_salary
    FROM Employee
    WHERE salary < (SELECT MAX(salary) FROM Employee);

| second_highest_salary |
| --------------------- |
| 70000.0               |

---
**Query #19**

    SELECT d.name AS department_name
    FROM Department d
    WHERE d.department_id = (
        SELECT department_id
        FROM Employee
        GROUP BY department_id
        ORDER BY COUNT(*) DESC
        LIMIT 1
    );

| department_name |
| --------------- |
| IT              |

---
**Query #20**

    SELECT e.name, e.salary, e.department_id
    FROM Employee e
    WHERE e.salary > (
        SELECT AVG(e2.salary)
        FROM Employee e2
        WHERE e2.department_id = e.department_id
    );

| name        | salary  | department_id |
| ----------- | ------- | ------------- |
| Jane Smith  | 60000.0 | 2             |
| Bob Brown   | 80000.0 | 1             |
| David Green | 70000.0 | 4             |
| Eve Black   | 55000.0 | 3             |

---
**Query #21**

    SELECT MAX(salary) AS third_highest_salary
    FROM Employee
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employee
        WHERE salary < (
            SELECT MAX(salary)
            FROM Employee
        )
    );

| third_highest_salary |
| -------------------- |
| 65000.0              |

---
**Query #22**

    SELECT MAX(salary) AS third_highest_salary
    FROM Employee
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employee
        WHERE salary < (
            SELECT MAX(salary)
            FROM Employee
        )
    );

| third_highest_salary |
| -------------------- |
| 65000.0              |

---
**Query #23**

    SELECT name, age
    FROM Employee
    WHERE age > ALL (
        SELECT age
        FROM Employee
        WHERE department_id = (
            SELECT department_id
            FROM Department
            WHERE name = 'HR'
        )
    );

| name        | age |
| ----------- | --- |
| Bob Brown   | 45  |
| David Green | 38  |
| Eve Black   | 40  |

---
**Query #24**

    SELECT d.name AS department_name,
           AVG(e.salary) AS average_salary
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    GROUP BY d.name
    HAVING AVG(e.salary) > 55000;

| department_name | average_salary |
| --------------- | -------------- |
| IT              | 65000.0        |
| Marketing       | 61500.0        |

---
**Query #25**

    SELECT name
    FROM Employee
    WHERE department_id IN (
        SELECT department_id
        FROM Project
        GROUP BY department_id
        HAVING COUNT(project_id) >= 2
    );

| name        |
| ----------- |
| John Doe    |
| Bob Brown   |
| Alice Blue  |
| David Green |
| Eve Black   |
| Grace Kelly |
| Hannah Lee  |

---
**Query #26**

    SELECT name, hire_date
    FROM Employee
    WHERE hire_date = (
        SELECT hire_date
        FROM Employee
        WHERE name = 'Jane Smith'
    );

| name       | hire_date  |
| ---------- | ---------- |
| Jane Smith | 2019-07-23 |

---
**Query #27**

    SELECT SUM(salary) AS total_salary
    FROM Employee
    WHERE YEAR(hire_date) = 2020;

| total_salary |
| ------------ |
| 103000.0     |

---
**Query #28**

    SELECT d.name AS department_name,
           AVG(e.salary) AS average_salary
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    GROUP BY d.name
    ORDER BY average_salary DESC;

| department_name | average_salary |
| --------------- | -------------- |
| IT              | 65000.0        |
| Marketing       | 61500.0        |
| HR              | 55000.0        |
| Finance         | 50000.0        |

---
**Query #29**

    SELECT d.name AS department_name,
           COUNT(e.emp_id) AS employee_count,
           AVG(e.salary) AS average_salary
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    GROUP BY d.name
    HAVING COUNT(e.emp_id) > 1
       AND AVG(e.salary) > 55000;

| department_name | employee_count | average_salary |
| --------------- | -------------- | -------------- |
| IT              | 3              | 65000.0        |
| Marketing       | 2              | 61500.0        |

---
**Query #30**

    SELECT d.name AS department_name,
           COUNT(e.emp_id) AS total_employees,
           AVG(e.salary) AS average_salary
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    GROUP BY d.name
    HAVING COUNT(e.emp_id) > 2;

| department_name | total_employees | average_salary |
| --------------- | --------------- | -------------- |
| IT              | 3               | 65000.0        |

---
**Query #31**

    SELECT e.name, e.salary
    FROM Employee e
    WHERE e.salary > (
        SELECT AVG(salary)
        FROM Employee
        WHERE department_id = e.department_id
    );

| name        | salary  |
| ----------- | ------- |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |

---
**Query #32**

    SELECT name
    FROM Employee
    WHERE hire_date = (
        SELECT hire_date
        FROM Employee
        ORDER BY age DESC
        LIMIT 1
    );

| name      |
| --------- |
| Bob Brown |

---
**Query #33**

    SELECT d.name AS department_name,
           COUNT(p.project_id) AS total_projects
    FROM Department d
    LEFT JOIN Project p
    ON d.department_id = p.department_id
    GROUP BY d.name
    ORDER BY total_projects DESC;

| department_name | total_projects |
| --------------- | -------------- |
| IT              | 3              |
| Marketing       | 2              |
| Finance         | 2              |
| HR              | 1              |

---
**Query #34**

    SELECT d.name AS department_name,
           e.name AS employee_name,
           e.salary
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    WHERE e.salary = (
        SELECT MAX(salary)
        FROM Employee
        WHERE department_id = e.department_id
    );

| department_name | employee_name | salary  |
| --------------- | ------------- | ------- |
| HR              | Jane Smith    | 60000.0 |
| IT              | Bob Brown     | 80000.0 |
| Marketing       | David Green   | 70000.0 |
| Finance         | Eve Black     | 55000.0 |

---
