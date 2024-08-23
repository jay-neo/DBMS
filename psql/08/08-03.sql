DO $$
DECLARE
    v_name TEXT;
BEGIN
    -- Prompt the user for their name
    v_name := 'John Doe'; -- Replace with actual input method if required
    
    -- Display the greeting
    RAISE NOTICE 'Hello %', v_name;
END;
$$;

