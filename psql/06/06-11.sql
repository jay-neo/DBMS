SELECT column_name, constraint_name 
FROM information_schema.constraint_column_usage 
WHERE table_name = 'emp_new';
