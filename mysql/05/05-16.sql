-- List the job with highest average salary.
SELECT
    job
FROM
    (
        SELECT
            job,
            AVG(sal) AS avg_salary
        FROM
            emp
        GROUP BY
            job
    ) AS job_avg_salaries
ORDER BY
    avg_salary DESC LIMIT 1;
