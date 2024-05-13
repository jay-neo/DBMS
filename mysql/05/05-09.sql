-- How much Miller needs to earn to be in BLAKE’s Grade?
SELECT
    sal AS miller_sal,
    (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'BLAKE'
    ) AS BLAKE_sal,
    (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'BLAKE'
    ) - (
        SELECT
            sal
        FROM
            emp
        WHERE
            ename = 'MILLER'
    ) AS Requirement
FROM
    emp
WHERE
    ename = 'MILLER';