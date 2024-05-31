CREATE VIEW EMPLOYEES_VIEW AS
SELECT
    e.empno,
    e.ename,
    e.job,
    e.deptno
FROM
    emp e
WHERE
    EXISTS (
        SELECT
            1
        FROM
            dept d
        WHERE
            e.deptno = d.deptno
    );
