ALTER TABLE emp_new
ADD CONSTRAINT min_salary CHECK (SAL >= 700);

SELECT * FROM emp_new;
