DECLARE
    v_empno       employees.empno%TYPE := 7369;
    v_commission  employees.comm%TYPE;
BEGIN
    SELECT comm
    INTO v_commission
    FROM employees
    WHERE empno = v_empno;

    IF v_commission IS NULL THEN
        UPDATE employees
        SET comm = 3000
        WHERE empno = v_empno;
        
        DBMS_OUTPUT.PUT_LINE('Commission updated to 3000.');
    ELSE
        UPDATE employees
        SET comm = comm * 1.25
        WHERE empno = v_empno;
        
        DBMS_OUTPUT.PUT_LINE('Commission raised by 25%.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
