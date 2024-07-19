CREATE TABLE dept_new1 AS
SELECT
    *
FROM
    Dept;

ALTER TABLE dept_new1
ADD CONSTRAINT dept_new1_pk PRIMARY KEY (deptno);



CREATE TABLE emp_new1 AS
SELECT
    *
FROM
    Emp;

ALTER TABLE emp_new1
ADD CONSTRAINT emp_new1_dept_fk FOREIGN KEY (deptno) REFERENCES dept_new1 (deptno);
