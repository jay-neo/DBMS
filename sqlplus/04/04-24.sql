SELECT
    ename
FROM
    emp
WHERE
    ename = UPPER(
        SUBSTRING (
            ename
            FROM
                1 FOR 1
        )
    ) || LOWER(
        SUBSTRING (
            ename
            FROM
                2
        )
    );
