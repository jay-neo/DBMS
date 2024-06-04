SET SERVEROUTPUT ON;

DECLARE
    v_empno       employees.empno%TYPE;
    v_hiredate    employees.hiredate%TYPE;
    v_years       NUMBER;
BEGIN
    v_empno := &Enter_Employee_Number;

    SELECT hiredate
    INTO v_hiredate
    FROM employees
    WHERE empno = v_empno;

    v_years := TRUNC(MONTHS_BETWEEN(SYSDATE, v_hiredate) / 12);

    IF v_years > 22 THEN
        UPDATE employees
        SET sal = sal * 1.05
        WHERE empno = v_empno;

        DBMS_OUTPUT.PUT_LINE('Salary incremented by 5%.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee has not been working for more than 22 years.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
