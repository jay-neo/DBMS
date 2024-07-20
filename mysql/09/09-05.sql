SET SERVEROUTPUT ON

DECLARE
    user_error EXCEPTION;
    PRAGMA EXCEPTION_INIT(user_error, -01400); -- Code for "value too large for column"

BEGIN
    INSERT INTO emp
    VALUES
    (
        NULL,
        'Jay',
        'RESEARCH',
        7900,
        DATE '2002-05-12',
        90000,
        1200,
        200
    );
EXCEPTION
    WHEN user_error THEN
        DBMS_OUTPUT.PUT_LINE('CANNOT INSERT NULL VALUES');
END;
/
