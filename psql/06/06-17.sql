-- SELECT comments
-- FROM user_col_comments
-- WHERE table_name = 'EMP' AND column_name = 'ENAME';
-- SELECT col_description('dept'::regclass, 'deptno'::regclass::oid);
-- SELECT col_description('dept'::regclass, 'deptno'::name::regclass::integer) AS column_comment;

SELECT col_description('dept'::regclass, ordinal_position) 
FROM information_schema.columns 
WHERE table_name = 'dept' AND column_name = 'deptno';
