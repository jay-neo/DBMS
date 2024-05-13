-- Disable the primary key constraint of dept_new table
-- ALTER TABLE dept_new 2 
-- DISABLE PRIMARY KEY CASCADE;


--  Enable the primary key constraint of dept_new table.
-- ALTER TABLE dept_new
-- ENABLE PRIMARY KEY;


ALTER TABLE emp_new
DROP FOREIGN KEY emp_fk;

ALTER TABLE dept_new
DROP PRIMARY KEY;
