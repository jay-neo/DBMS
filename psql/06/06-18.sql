-- SELECT comments
-- FROM user_tab_comments
-- WHERE table_name = 'EMP';

-- SELECT obj_description('emp'::regclass, 'pg_class');

SELECT obj_description('emp'::regclass) AS table_comment;
