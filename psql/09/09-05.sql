DO $$
BEGIN
    BEGIN
        INSERT INTO emp (empno, ename, sal)  -- assuming sal cannot be NULL
        VALUES (1001, 'John Doe', NULL);   -- This will raise an error
    EXCEPTION
        WHEN others THEN
            RAISE NOTICE 'Error: Cannot insert NULL into a NOT NULL column.';
    END;
    
    COMMIT;
END $$;
