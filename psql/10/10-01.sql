CREATE OR REPLACE PROCEDURE INCR_OF_EMP(v_empno INT, increment_amount NUMERIC)
LANGUAGE plpgsql
AS $$
DECLARE
    current_salary NUMERIC;
BEGIN
    -- Retrieve current salary
    SELECT sal INTO current_salary
    FROM emp
    WHERE empno = v_empno;

    -- Check if salary is NULL
    IF current_salary IS NULL THEN
        RAISE EXCEPTION 'Salary Missing: This Employee has NULL salary';
    ELSE
        -- Update the salary
        UPDATE emp
        SET sal = current_salary + increment_amount
        WHERE empno = v_empno;
    END IF;
END;
$$;

CALL INCR_OF_EMP(7698, 1000);

