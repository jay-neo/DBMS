SELECT e.*
FROM Emp e
JOIN (
    SELECT DEPTNO, AVG(SAL) AS avg_sal
    FROM Emp
    GROUP BY DEPTNO
) d ON e.DEPTNO = d.DEPTNO
WHERE e.SAL > d.avg_sal;
