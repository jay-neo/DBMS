ALTER TABLE emp_new ADD CONSTRAINT fk_dept FOREIGN KEY (deptno) REFERENCES dept_new(deptno);

SELECT * FROM emp_new;
