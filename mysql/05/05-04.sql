-- List the employee name and their corresponding manager name from emp table.
SELECT
    e1.ename,
    e2.ename AS manager_name
FROM
    emp e1
    INNER JOIN emp e2 ON e1.MGR = e2.empno;
