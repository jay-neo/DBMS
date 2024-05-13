SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(100);
BEGIN
    v_name := '&Enter_Name';

    DBMS_OUTPUT.PUT_LINE('Hello ' || v_name || '!');
END;
/
