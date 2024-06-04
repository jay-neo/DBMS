SELECT
    deptno,
    SUM(COALESCE(comm, 100)) AS total_commission
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno DESC;
