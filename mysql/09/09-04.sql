SET SERVEROUTPUT ON

DECLARE
    dno NUMBER := &deptno;
BEGIN
    UPDATE dept
    SET loc = 'KOLKATA'
    WHERE deptno = dno;

    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Updated');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Data NOT Found');
    END IF;
END;
/
