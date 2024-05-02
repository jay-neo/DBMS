CREATE emp_test AS
SELECT
    ename
FROM
    emp;

CREATE
OR REPLACE trigger upper_str BEFORE
INSERT
    OR
UPDATE of ename ON emp_test FOR each ROW
BEGIN :new.ename := upper(:new.ename);

END;

INSERT INTO
    emp_test
VALUES
    ('modon');