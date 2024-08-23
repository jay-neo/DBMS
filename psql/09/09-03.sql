DO $$
DECLARE
    v_deptno INTEGER;
BEGIN
    -- Get department number for Computer Science
    SELECT deptno INTO v_deptno FROM dept WHERE dname = 'Computer Science';

    -- Increment salaries
    UPDATE emp
    SET sal = sal * 1.02
    WHERE deptno = v_deptno;

    -- Insert records into Emp_sal_inc
    INSERT INTO Emp_sal_inc (Emp_id, Cur_sal, Inc_date)
    SELECT empno, sal, CURRENT_DATE
    FROM emp
    WHERE deptno = v_deptno;

    COMMIT;
END $$;
