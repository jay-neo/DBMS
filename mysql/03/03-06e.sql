SELECT
    *
FROM
    Emp
WHERE
    HIREDATE < STR_TO_DATE ('31-JUL-81', '%d-%b-%y');
