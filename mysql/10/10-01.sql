CREATE OR REPLACE PROCEDURE incr_of_emp (emp_no NUMBER, amt_incr NUMBER) IS
    psal emp.sal%TYPE;
    salary_missing EXCEPTION;
BEGIN
    SELECT sal INTO psal
    FROM emp
    WHERE empno = emp_no;

    IF psal IS NULL THEN
        RAISE salary_missing;
    ELSE
        UPDATE emp
        SET sal = sal + amt_incr
        WHERE empno = emp_no;
    END IF;

EXCEPTION
    WHEN salary_missing THEN
        DBMS_OUTPUT.PUT_LINE('Employee ' || emp_no || ' has NULL salary');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No such employee with empno ' || emp_no);
END;
/

-- Example usage:
-- Check the current salary of empno 7698
SELECT empno, sal FROM emp WHERE empno = 7698;

-- Execute the procedure to increase the salary of empno 7698 by 1200
BEGIN
    incr_of_emp(7698, 1200);
END;
/

-- Check the updated salary of empno 7698
SELECT empno, sal FROM emp WHERE empno = 7698;
