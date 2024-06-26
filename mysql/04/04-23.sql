SELECT
    ename,
    sal,
    COALESCE(comm, 0) AS commission
FROM
    emp
WHERE
    ename LIKE '%M%'
ORDER BY
    ename ASC;
