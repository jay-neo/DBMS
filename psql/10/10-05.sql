-- Assume you have a view `V1` created like this
CREATE VIEW V1 AS
SELECT empno, ename FROM emp;

CREATE OR REPLACE FUNCTION trg_instead_of_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM emp
    WHERE empno = OLD.empno;
    RETURN OLD;
END;
$$;

CREATE TRIGGER INSTEAD_OF_DELETE
INSTEAD OF DELETE ON V1
FOR EACH ROW
EXECUTE FUNCTION trg_instead_of_delete();
