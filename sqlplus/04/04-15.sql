SELECT
    job,
    SUM(sal) AS total_salary,
    MAX(sal) AS max_salary,
    MIN(sal) AS min_salary,
    AVG(sal) AS avg_salary
FROM
    emp
WHERE
    deptno = 20
GROUP BY
    job
HAVING
    AVG(sal) > 1000;
