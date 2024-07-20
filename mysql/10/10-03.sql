CREATE OR REPLACE TRIGGER upper_str
BEFORE INSERT OR UPDATE OF ename ON emp
FOR EACH ROW
BEGIN
    :NEW.ename := UPPER(:NEW.ename);
END;
/

INSERT INTO emp (ename) VALUES ('modon');
