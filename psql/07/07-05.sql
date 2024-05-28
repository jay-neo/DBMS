CREATE VIEW EMPLOYEES AS
SELECT empno, ename, job, deptno
FROM emp
WHERE deptno IN (SELECT deptno FROM dept);
