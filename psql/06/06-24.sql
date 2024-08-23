-- Make the comm column of emp_new table as unused (PostgreSQL doesn't directly support marking columns as unused, so we'll skip this)

ALTER TABLE emp_new DROP COLUMN comm;
