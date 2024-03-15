-- List the employees belong to department of MILLER.

SELECT ename
FROM emp
WHERE deptno = (
    SELECT deptno
    FROM emp
    WHERE ename LIKE('MILLER')
);




-- If a boy does not get success within 30 years then he need to suicide...
-- Whole world is not ready to accept him...
-- No other choice is there.
