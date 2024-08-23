DO $$
DECLARE
    CURSOR item_cursor IS
        SELECT item_id, qoh
        FROM item_master;

    v_item_id item_master.item_id%TYPE;
    v_qoh item_master.qoh%TYPE;

    insufficient_stock EXCEPTION;
BEGIN
    OPEN item_cursor;
    LOOP
        FETCH item_cursor INTO v_item_id, v_qoh;
        EXIT WHEN item_cursor%NOTFOUND;

        IF v_qoh < 1 THEN
            RAISE insufficient_stock;
        END IF;
    END LOOP;
    CLOSE item_cursor;
END;
$$
