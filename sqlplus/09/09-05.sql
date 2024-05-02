SET
    SURVEROUTPUT ON
DECLARE user_error
EXCEPTION;

PRAGMA EXECPTION_INIT (user_error, -0150);

BEGIN
insert into
    emp
values
    (
        NULL,
        'Jay',
        'REARCH',
        7900,
        '12-MAY-2002',
        90000,
        1200,
        200
    );

EXECPTION WHEN user_error THEN DBMS_OUTPUT.PUT_LINE ('CANNOT INSERT NULL VALUES');

END;