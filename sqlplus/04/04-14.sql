SELECT
    job
FROM
    emp
GROUP BY
    job
HAVING
    MAX(sal) >= 5000;
