-- ALTER TABLE dept_new
-- MODIFY deptno NUMBER(2) PRIMARY KEY;

ALTER TABLE dept_new
ADD CONSTRAINT pk_dept_new PRIMARY KEY (deptno);
