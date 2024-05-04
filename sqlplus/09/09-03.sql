CREATE TABLE emp_sal_inc (
    emp_id VARCHAR2(8) PRIMARY KEY,
    cur_sal NUMBER(7, 2) NOT NULL,
    inc_date DATE NOT NULL
);

SET SERVEROUTPUT ON

DECLARE
    inc NUMBER;
    emp_sal_rec emp%ROWTYPE;

    CURSOR cur IS
        SELECT *
        FROM emp
        WHERE deptno = (
            SELECT deptno
            FROM dept
            WHERE dname = 'COMPUTER SCIENCE'
        );

BEGIN
    FOR emp_sal_rec IN cur LOOP
        inc := emp_sal_rec.sal * 1.02;
        
        -- Update the salary of the employee
        UPDATE emp
        SET sal = inc
        WHERE empno = emp_sal_rec.empno;

        -- Insert a record into emp_sal_inc table
        INSERT INTO emp_sal_inc (emp_id, cur_sal, inc_date)
        VALUES (emp_sal_rec.empno, inc, SYSDATE);
    END LOOP;

    COMMIT;
END;
/
