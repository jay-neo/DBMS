SELECT
    AVG(sal) AS avg_salary,
    COUNT(*) AS num_employees
FROM
    emp
WHERE
    deptno = 20;
