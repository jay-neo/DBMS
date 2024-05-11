SELECT
    job,
    AVG(sal) AS avg_salary
FROM
    emp
WHERE
    job != 'MANAGER'
GROUP BY
    job;
