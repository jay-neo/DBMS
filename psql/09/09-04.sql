DO $$
BEGIN
    BEGIN
        INSERT INTO emp (empno, ename, sal)  -- assuming sal cannot be NULL
        VALUES (1001, 'John Doe', NULL);   -- This will raise an error
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('Error: Cannot insert NULL into a NOT NULL column.');
    END;
    
    COMMIT;
END;
$$

