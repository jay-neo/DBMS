DO $$
DECLARE
    emp_cursor CURSOR FOR
        SELECT empno, ename, sal, COALESCE(comm, 0) as comm
        FROM emp
        WHERE (sal + COALESCE(comm, 0)) > 25000;

    v_empno emp.empno%TYPE;
    v_ename emp.ename%TYPE;
    v_sal emp.sal%TYPE;
    v_comm emp.comm%TYPE;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO v_empno, v_ename, v_sal, v_comm;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Empno: %, Name: %, Salary: %, Commission: %', v_empno, v_ename, v_sal, v_comm;
    END LOOP;
    CLOSE emp_cursor;
END $$;
