SELECT pg_get_triggerdef(t.oid)
FROM pg_trigger t
WHERE t.tgname = 'TOTAL_SALARY';

