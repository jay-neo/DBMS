SELECT
    deptno,
    SUM(sal) AS total_salary_payable
FROM
    emp
GROUP BY
    deptno;
