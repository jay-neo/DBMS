-- List the jobs that are unique to department 20 compare 
-- to other departments present in emp table.
SELECT DISTINCT
    job
FROM
    emp
WHERE
    deptno = 20
    AND job NOT IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno != 20
    );
