-- List all employees who joined the company before their manager.
SELECT
    e1.ename,
    e2.ename AS Manager
FROM
    emp e1
    JOIN emp e2 ON e1.mgr = e2.empno
WHERE
    e1.hiredate < e2.hiredate;
