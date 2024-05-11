SELECT
    SUBSTRING(job, 2, 3) AS job_substring
FROM
    emp
WHERE
    job = 'SALESMAN';
