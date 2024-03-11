SELECT e.ENAME AS "Employee Name", e.SAL AS "Employee Salary",
       m.ENAME AS "Boss Name", m.SAL AS "Boss Salary"
FROM Emp e
JOIN Emp m ON e.MGR = m.EMPNO
WHERE e.SAL > m.SAL;
