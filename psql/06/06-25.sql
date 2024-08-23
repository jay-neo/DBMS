-- How can we display the marked unused columns of a emp_new table (Skipped as PostgreSQL doesn't directly support this)
-- PostgreSQL does not support the UNUSED column concept. Instead, use table definition inspection.

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'emp_new1';

