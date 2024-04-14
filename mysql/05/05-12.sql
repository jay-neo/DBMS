-- List the job common to department 20 and 30.

(
    SELECT job
    FROM emp
    WHERE emp.deptno IN(20)
) INTERSECT (
    SELECT job
    FROM emp
    WHERE emp.deptno IN(30)
);
