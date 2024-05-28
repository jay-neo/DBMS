CREATE OR REPLACE FUNCTION vw_sales_det_insert_trigger() RETURNS TRIGGER AS $$
BEGIN
    -- Insert into sales_order
    INSERT INTO sales_order (order_no, order_date, order_status)
    VALUES (NEW.order_no, NEW.order_date, 'Backorder');

    -- Insert into sales_order_details
    INSERT INTO sales_order_details (order_no, product_no, qty_ordered)
    VALUES (NEW.order_no, NEW.product_no, NEW.qty_ordered);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insert_vw_sales_det
INSTEAD OF INSERT ON vw_sales_det
FOR EACH ROW EXECUTE FUNCTION vw_sales_det_insert_trigger();



INSERT INTO
    vw_sales_det (
        order_no,
        order_date,
        product_no,
        qty_ordered,
        order_status
    )
VALUES
    (
        'ORD001',
        '2024-08-23',
        'PROD001',
        10,
        'Backorder'
    );


SELECT * FROM sales_order;
SELECT * FROM sales_order_details;
SELECT * FROM vw_sales_det;
