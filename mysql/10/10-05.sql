CREATE OR REPLACE TRIGGER ti
INSTEAD OF DELETE ON vi
FOR EACH ROW
BEGIN
    DELETE FROM emp
    WHERE empno = :old.empno;

    DELETE FROM dept
    WHERE deptno = :old.deptno;
END;
/
