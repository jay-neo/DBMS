SELECT
    ename
FROM
    emp
WHERE
    ename = CONCAT(
        UPPER(SUBSTRING(ename, 1, 1)),
        LOWER(SUBSTRING(ename, 2))
    );
