-- Find the names of those employees who earn more than their boss.
SELECT
    e1.ename,
    e1.sal AS emp_sal,
    e2.ename AS Boss,
    e2.sal AS Boss_sal
FROM
    emp e1
    JOIN emp e2 ON e1.mgr = e2.empno
WHERE
    e1.sal > e2.sal;