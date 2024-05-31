ALTER TABLE emp_new
ADD CONSTRAINT emp_fk FOREIGN KEY (deptno) REFERENCES dept_new (deptno);
