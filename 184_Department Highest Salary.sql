/*
The Employee table holds all employees. 
Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. 
For the above tables, Max has the highest salary in the IT department and Henry has the highest salary in the Sales department.

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
*/

SELECT D.Name AS Department ,E.Name AS Employee ,E.Salary 
FROM
	Employee E,
	(SELECT DepartmentId,max(Salary) as max FROM Employee GROUP BY DepartmentId) T,
	Department D
WHERE E.DepartmentId = T.DepartmentId 
  AND E.Salary = T.max
  AND E.DepartmentId = D.id

/*another */
SELECT
    D.name AS 'Department',
    E.name AS 'Employee',
    E.Salary
FROM
    Employee E
        JOIN
    Department D ON E.DepartmentId = D.Id
WHERE
    (E.DepartmentId, E.Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary) as Salary
        FROM
            Employee
        GROUP BY DepartmentId
    )

/* or use concat*/
SELECT
    D.name AS 'Department',
    E.name AS 'Employee',
    E.Salary
FROM
    Employee E
        JOIN
    Department D ON E.DepartmentId = D.Id
WHERE
    concat(E.DepartmentId, E.Salary) IN
    (   SELECT
            concat(DepartmentId, MAX(Salary)) as Salary
        FROM
            Employee
        GROUP BY DepartmentId
    )




