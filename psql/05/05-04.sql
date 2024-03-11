SELECT e.ENAME AS "Employee Name", m.ENAME AS "Manager Name"
FROM Emp e
LEFT JOIN Emp m ON e.MGR = m.EMPNO;
