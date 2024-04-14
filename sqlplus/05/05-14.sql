-- List the employees belong to department of MILLER.

SELECT ename
FROM emp
WHERE deptno = (
    SELECT deptno
    FROM emp
    WHERE ename LIKE('MILLER')
);
