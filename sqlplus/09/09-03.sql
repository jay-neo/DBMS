CREATE TABLE emp_sal (
    emp_id VARCHAR(8) PRIMARY KEY,
    cur_sal NUMBER(7, 2) NOT NULL,
    inc_date DATE NOT NULL
);

SET
    SURVEROUTPUT ON
DECLARE inc NUMBER;

emp_sal_rec emp_sal % ROWTYPE;

CURSOR cur IS
SELECT
    *
FROM
    emp
WHERE
    deptno = (
        SELECT
            deptno
        FROM
            dept
        WHERE
            dname LIKE 'RESEARCH'
    );

BEGIN FOR emp_sal_rec IN cur
LOOP inc := emp_sal_rec.sal * 1.02;
    INSERT INTO
        emp_sal
    VALUES
        (emp_sal_rec.empno, inc, SYSDATE);
END LOOP;

END;
