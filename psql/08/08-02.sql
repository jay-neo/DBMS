DO $$
BEGIN
    -- Insert into temp_emp from emp
    INSERT INTO temp_emp
    SELECT * FROM emp
    WHERE empno = '7698';
    
    -- Commit the changes
    -- COMMIT; -- COMMIT is not needed in anonymous blocks
END;
$$;
