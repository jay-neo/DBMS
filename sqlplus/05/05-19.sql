-- List the employee details whose salary greater than 
-- the average salary for their department.

SELECT *
FROM emp e1
WHERE e1.sal > (
    SELECT AVG(sal)
    FROM emp e2
    WHERE e1.deptno = e2.deptno
);