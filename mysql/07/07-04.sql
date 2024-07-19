CREATE VIEW emp_details AS
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    ename = '&Empname'
    AND TO_CHAR(SYSDATE, 'HH24') BETWEEN 9 AND 17
    AND TO_CHAR(SYSDATE, 'D') BETWEEN 2 AND 6
WITH
    CHECK OPTION;
