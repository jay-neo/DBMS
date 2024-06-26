SELECT
    deptno,
    AVG(sal) AS avg_salary
FROM
    emp
GROUP BY
    deptno
HAVING
    COUNT(*) > 5;
