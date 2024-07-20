SET SERVEROUTPUT ON

DECLARE
    qtyoh item_master.qoh%TYPE;
    INSUFFICIENT_STOCK EXCEPTION;

BEGIN
    SELECT qoh INTO qtyoh
    FROM item_master
    WHERE <condition>; -- Add a condition to select a specific item or items

    IF qtyoh < 1 THEN
        RAISE INSUFFICIENT_STOCK;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Quantity on hand is: ' || qtyoh);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for the specified condition.');
    WHEN INSUFFICIENT_STOCK THEN
        DBMS_OUTPUT.PUT_LINE('INSUFFICIENT STOCK');
END;
/
