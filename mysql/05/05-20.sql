--  List all employees who work in DALLAS and 
-- earn more than any employee working in CHICAGO.

SELECT ename
FROM emp 
WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'DALLAS') 
AND sal > ALL (
   SELECT sal FROM emp 
    WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'CHICAGO')
);