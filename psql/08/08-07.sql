DO $$
DECLARE
    v_empno TEXT;
    v_years_of_service INTEGER;
BEGIN
    -- Prompt user for employee number
    v_empno := '1234'; -- Replace with actual input method if required
    
    -- Get years of service
    SELECT FLOOR(EXTRACT(YEAR FROM AGE(hiredate))) INTO v_years_of_service
    FROM emp
    WHERE empno::TEXT = v_empno; -- Explicitly cast empno to TEXT if it’s not already
    
    -- Check and update salary if more than 22 years of service
    IF v_years_of_service > 22 THEN
        UPDATE emp
        SET salary = salary * 1.05
        WHERE empno::TEXT = v_empno; -- Explicitly cast empno to TEXT if it’s not already
    END IF;
END;
$$;
