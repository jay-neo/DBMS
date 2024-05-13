CREATE VIEW EMP_READ AS
SELECT
    job,
    MIN(sal) AS minsal,
    MAX(sal) AS maxsal
FROM
    emp
GROUP BY
    job;