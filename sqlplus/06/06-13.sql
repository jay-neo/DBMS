CREATE TABLE dept_new1 AS SELECT * FROM dept;
CREATE TABLE emp_new1 AS SELECT * FROM emp;

ALTER TABLE dept_new1modify deptno PRIMARY KEY;
ALTER TABLE emp_new1 ADD CONSTRAINT emp_fk1 FOREIGN KEY (deptno) REFERENCES dept_new1(deptno);
