CREATE VIEW Emp_Data AS
SELECT
    empno,
    ename,
    job,
    deptno,
    sal,
    mgr
FROM
    emp
WHERE
    sal BETWEEN 10000 AND 20000
    AND mgr IN (
        SELECT
            empno
        FROM
            emp
    )
    AND deptno IN (
        SELECT
            deptno
        FROM
            dept
    );
