SELECT
    deptno,
    COUNT(*) AS num_employees
FROM
    emp
GROUP BY
    deptno;
