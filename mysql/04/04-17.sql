SELECT
    AVG(max_sal) AS avg_max_salary
FROM
    (
        SELECT
            MAX(sal) AS max_sal
        FROM
            emp
        GROUP BY
            deptno
    ) AS max_salaries;
