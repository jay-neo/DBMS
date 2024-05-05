SELECT
    SUBSTRING (
        job
        FROM
            2 FOR 3
    ) AS job_substring
FROM
    emp
WHERE
    job = 'SALESMAN';
