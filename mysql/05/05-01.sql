-- Display empno, emoname, dname and loc from emp and dept table.
SELECT
    empno,
    ename,
    dname,
    loc
FROM
    emp
    JOIN dept ON emp.deptno = dept.deptno;
