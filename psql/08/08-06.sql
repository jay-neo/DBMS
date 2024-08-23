DO $$
BEGIN
    FOR i IN 1..10 LOOP
        IF i % 2 = 0 THEN
            RAISE NOTICE '%', i;
        END IF;
    END LOOP;
END;
$$;
