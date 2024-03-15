-- List the employee name and their corresponding manager name from emp table where employee name includes  
--an “A” and display will be appeared as in the example given below.

SELECT e1.ename || ' works for ' || e2.ename AS "Employees of their managers"
FROM emp e1
JOIN emp e2
ON e1.mgr = e2.empno
WHERE e1.ename LIKE('%A%');
