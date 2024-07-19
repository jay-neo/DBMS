CREATE VIEW dept_summary AS
SELECT
    d.dname,
    MIN(e.sal) AS minsal,
    MAX(e.sal) AS maxsal,
    AVG(e.sal) AS avgsal
FROM
    emp e
JOIN
    dept d ON e.deptno = d.deptno
GROUP BY
    d.dname;
