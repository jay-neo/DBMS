DO $$
DECLARE
    -- Define a record variable to hold the cursor result
    rec RECORD;
BEGIN
    -- Open a cursor with the query
    FOR rec IN
        SELECT empno, ename, sal
        FROM emp
        ORDER BY sal DESC
        LIMIT 5
    LOOP
        -- Insert the data into the message table
        INSERT INTO message (EmpNumber, Name, Salary)
        VALUES (rec.empno, rec.ename, rec.sal);
    END LOOP;

    COMMIT;
END $$;
