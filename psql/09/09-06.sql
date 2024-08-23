DO $$
DECLARE
    emp_cursor CURSOR FOR
        SELECT empno, ename
        FROM emp
        WHERE EXTRACT(YEAR FROM hiredate) = 1997;

    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
BEGIN
    OPEN emp_cursor;
    FETCH emp_cursor INTO v_empno, v_ename;
    IF NOT FOUND THEN
        RAISE NOTICE 'No employees joined in 1997.';
    END IF;

    LOOP
        RAISE NOTICE 'Empno: %, Name: %', v_empno, v_ename;
        FETCH emp_cursor INTO v_empno, v_ename;
        EXIT WHEN NOT FOUND;
    END LOOP;
    
    CLOSE emp_cursor;
END $$;
