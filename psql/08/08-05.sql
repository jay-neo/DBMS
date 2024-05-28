DO $$
BEGIN
    -- Update commission
    UPDATE emp
    SET comm = COALESCE(comm, 3000) * CASE WHEN comm IS NULL THEN 1 ELSE 1.25 END
    WHERE empno = '7369';
    
    -- Commit the changes
    -- COMMIT; -- COMMIT is not needed in anonymous blocks
END;
$$;
