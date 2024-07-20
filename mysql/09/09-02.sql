SET SERVEROUTPUT ON

DECLARE
    CURSOR c2 IS
        SELECT empno, sal, ename
        FROM emp
        ORDER BY sal DESC;
BEGIN
    FOR record1 IN c2 LOOP
        INSERT INTO message (EmpNumber, Name, Salary)
        VALUES (record1.empno, record1.ename, record1.sal);

        EXIT WHEN c2%ROWCOUNT = 5;
    END LOOP;

    COMMIT;
END;
/
