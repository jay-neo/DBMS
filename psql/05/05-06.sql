SELECT e.ENAME AS "Employee Name", e.JOB AS "Employee Job", e.SAL AS "Employee Salary",
       m.ENAME AS "Boss Name", m.JOB AS "Boss Job", m.SAL AS "Boss Salary"
FROM Emp e
LEFT JOIN Emp m ON e.MGR = m.EMPNO;
