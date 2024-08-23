DO $$
BEGIN
    FOR i IN 0..49 LOOP
        RAISE NOTICE '%', i;
    END LOOP;
END;
$$;
