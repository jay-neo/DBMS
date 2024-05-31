-- Disable the primary key constraint of dept_new table
ALTER TABLE dept_new 2 
DISABLE PRIMARY KEY CASCADE;


--  Enable the primary key constraint of dept_new table.
ALTER TABLE dept_new
ENABLE PRIMARY KEY;
