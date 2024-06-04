SELECT
    ename,
    CASE
        WHEN comm IS NULL THEN 'Not Applicable'
    END AS commission
FROM
    emp
WHERE
    ename LIKE '%M%'
ORDER BY
    ename DESC;
