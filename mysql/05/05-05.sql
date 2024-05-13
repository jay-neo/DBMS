-- List the employee name and their corresponding manager name from emp table along this
--  select that employee who have no manager.
SELECT
    e1.ename,
    e2.ename AS manager_name
FROM
    emp e1
    LEFT JOIN emp e2 ON e1.MGR = e2.empno;
