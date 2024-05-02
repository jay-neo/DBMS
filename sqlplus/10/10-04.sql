CREATE
OR REPLACE TRIGGER total_salary AFTER DELETE
OR
INSERT
    OR
UPDATE OF deptno,
sal ON emp FOR EACH ROW
BEGIN IF DELETING
OR (
    UPDATING
    AND :OLD.deptno != :NEW.deptno
) THEN
UPDATE dept
SET
    totsal = totsal - :OLD.sal
WHERE
    deptno = :OLD.deptno;

END IF;

IF INSERTING
OR (
    UPDATING
    AND :OLD.deptno != :NEW.deptno
) THEN
UPDATE dept
SET
    totsal = totsal + :NEW.sal
WHERE
    deptno = :NEW.deptno;

END IF;

IF (
    UPDATING
    AND :OLD.deptno != :NEW.deptno
    AND :OLD.sal != :NEW.sal
) THEN
UPDATE dept
SET
    totsal = totsal - :OLD.sal + :NEW.sal
WHERE
    deptno = :OLD.deptno;

END IF;

END;
