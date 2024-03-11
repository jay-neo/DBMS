SELECT CONCAT(e.ENAME, ' works for ', m.ENAME) AS "Employees and Their Managers"
FROM Emp e
JOIN Emp m ON e.MGR = m.EMPNO
WHERE e.ENAME LIKE '%A%';
