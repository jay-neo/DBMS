SELECT
    ENAME,
    JOB
FROM
    Emp
WHERE
    (
        JOB LIKE '%M%'
        OR JOB LIKE '%P%'
    );
