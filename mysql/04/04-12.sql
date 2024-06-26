SELECT
    deptno,
    job,
    AVG(sal) AS avg_monthly_salary
FROM
    emp
GROUP BY
    deptno,
    job;
