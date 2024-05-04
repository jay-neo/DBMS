SET SERVEROUTPUT ON

DECLARE
    v_ename emp.ename%TYPE;
    v_job emp.job%TYPE;
BEGIN
    SELECT ename, job
    INTO v_ename, v_job
    FROM emp
    WHERE doj BETWEEN TO_DATE('01-JAN-1997', 'DD-MON-YYYY') AND TO_DATE('31-DEC-1997', 'DD-MON-YYYY');

    DBMS_OUTPUT.PUT_LINE(v_ename || ' ' || v_job);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No Employee hired in 1997');
END;
/
