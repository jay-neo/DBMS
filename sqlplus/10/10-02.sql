CREATE OR REPLACE FUNCTION review_emp (emp_no NUMBER) RETURN NUMBER IS
    incr emp.sal%TYPE;
    net emp.sal%TYPE;

    v_empno emp.empno%TYPE;
    v_sal emp.sal%TYPE;
    v_comm emp.comm%TYPE;
BEGIN
    SELECT empno, sal, NVL(comm, 0)
    INTO v_empno, v_sal, v_comm
    FROM emp
    WHERE empno = emp_no;

    net := v_sal + v_comm;

    IF v_sal <= 15000 THEN
        incr := net * 0.2;
    ELSIF v_sal > 15000 AND v_sal <= 30000 THEN
        incr := net * 0.3;
    ELSE
        incr := net * 0.4;
    END IF;

    RETURN incr;
END review_emp;
/

-- Example usage:
DECLARE
    empno_param NUMBER := 7698;
    increased_salary NUMBER;
BEGIN
    increased_salary := review_emp(empno_param);
    DBMS_OUTPUT.PUT_LINE('Increased salary for employee ' || empno_param || ' is ' || increased_salary);
END;
/
