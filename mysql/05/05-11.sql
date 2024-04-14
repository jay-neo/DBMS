-- Display different designations present in department 20 and 30.

SELECT DISTINCT job
FROM emp
WHERE deptno IN(20,30);
