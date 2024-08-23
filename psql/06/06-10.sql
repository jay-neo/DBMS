SELECT constraint_name
FROM information_schema.table_constraints
WHERE table_name = 'dept_new' AND constraint_type = 'PRIMARY KEY';

ALTER TABLE dept_new DROP CONSTRAINT dept_new_pk CASCADE;

