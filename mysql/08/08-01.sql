DECLARE
    v_empno     employees.empno%TYPE := 7788;
    v_new_salary employees.empno%TYPE := 35000;
    v_current_salary employees.salary%TYPE;
BEGIN
    SELECT sal
    INTO v_current_salary
    FROM emp
    WHERE empno = v_empno;

    IF v_current_salary < v_new_salary THEN
        UPDATE employees
        SET salary = v_new_salary
        WHERE empno = v_empno;
        
        DBMS_OUTPUT.PUT_LINE('Salary updated to ' || v_new_salary);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No update needed. Current salary is already ' || v_current_salary);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/