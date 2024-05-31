CREATE
OR REPLACE PROCEDURE incr_of_emp (emp_no NUMBER, amt_incr NUMBER) IS psal emp.sal % TYPE;

salary_missing
exception;

BEGIN
SELECT
    sal INTO psal
FROM
    emp
WHERE
    empno = emp_no;

IF psal IS NULL THEN raise salary_missing;

ELSE
UPDATE emp
SET
    sal = sal + amt_incr
WHERE
    empno = emp_no;

END IF;

exception WHEN salary_missing THEN dbms_output.put_line (emp_no || 'Has salary is NULL');

WHEN NO_DATA_FOUND THEN dbms_output.put_line (emp_no || 'NO such employee');

END;

SELECT
    *
FROM
    emp
WHERE
    empno = 7698;

execute incr_of_emp (7698, 1200);

SELECT
    *
FROM
    emp
WHERE
    empno = 7698;