DROP TABLE IF EXISTS temp_emp CASCADE;
CREATE TABLE temp_emp AS TABLE emp WITH NO DATA;

DO $$
BEGIN
    -- Update salary if less than 35000
    UPDATE emp
    SET sal = 35000
    WHERE empno = '7788' AND sal < 35000;
    
    -- Commit the changes
    -- COMMIT; -- COMMIT is not needed in anonymous blocks
END;
$$;
