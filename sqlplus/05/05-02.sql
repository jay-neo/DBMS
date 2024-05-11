-- Display empno, empname and their deptno, dpetname and loc from emp and dept table.
SELECT
    empno,
    ename,
    emp.deptno,
    dname,
    loc
FROM
    emp
    JOIN dept ON emp.deptno = dept.deptno;
