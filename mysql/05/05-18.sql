-- List the names of the employees who earn lowest 
-- salary in each department.

SELECT ename , deptno , sal
FROM emp
WHERE sal
IN (
    SELECT MIN(sal) 
    FROM emp
    GROUP BY deptno
);
