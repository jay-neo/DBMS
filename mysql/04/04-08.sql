SELECT
    job,
    COUNT(*) AS num_employees
FROM
    emp
GROUP BY
    job
ORDER BY
    num_employees DESC;
