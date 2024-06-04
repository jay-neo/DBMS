BEGIN
    INSERT INTO temp_emp
    SELECT *
    FROM emp
    WHERE empno = 7698;

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Employee 7698 details inserted into temp_emp table.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
