SELECT
    job,
    STDDEV(sal) AS sd_salary
FROM
    emp
GROUP BY
    job
HAVING
    STDDEV(sal) > 0;
