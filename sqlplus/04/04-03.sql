SELECT
       ename,
       sal,
       (sal * 0.12) AS PF,
       (sal * 0.15) AS HRA,
       (sal * 0.90) AS DA,
       (sal + (sal * 0.12) + (sal * 0.15) + (sal * 0.90)) AS GROSS
FROM
       emp
ORDER BY
       GROSS ASC;
