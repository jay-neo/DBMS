-- Display the list of employees working in each department and with this display the department 
-- information even if no employee belongs to that department. 
SELECT
    dept.deptno,
    dname,
    loc,
    ename
FROM
    dept
    LEFT JOIN emp ON dept.deptno = emp.deptno
ORDER BY
    deptno;
