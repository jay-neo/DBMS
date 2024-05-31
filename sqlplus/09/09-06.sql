SET
    SURVEROUTPUT ON
DECLARE Vename emp.ename % type;

Vjob emp.job % type;

BEGIN
SELECT
    ename,
    job INTO Vename,
    Vjob
FROM
    emp
WHERE
    doj BETWEEN '01-JAN-97' AND '31-DEC-97';

dbms_output.put_line (Vename || ' ' || Vjob);

EXCEPTION WHEN NO_DATA_FOUND THEN dbms_output.put_line ('No Employee hired in 97');

END;