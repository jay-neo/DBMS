SET
    SURVEROUTPUT ON
DECLARE CURSOR C2 IS
SELECT
    empno,
    sal,
    ename
from
    emp
order by
    sal desc;

BEGIN FOR record1 IN C1
LOOP
INSERT INTO
    message (EmpNumber, Name, Salary)
VALUES
    (record1.empno, record1.sal, record1.ename);

EXIT WHEN C1 % ROWCOUNT = 5;

END LOOP;

COMMIT;

END;