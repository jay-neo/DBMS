CREATE FUNCTION vw_sales_det_delete_trigger() RETURNS TRIGGER AS $$
BEGIN
    DELETE FROM sales_order_details
    WHERE order_no = OLD.order_no
    AND product_no = OLD.product_no;

    DELETE FROM sales_order
    WHERE order_no = OLD.order_no;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_vw_sales_det
INSTEAD OF DELETE ON vw_sales_det
FOR EACH ROW EXECUTE FUNCTION vw_sales_det_delete_trigger();



DELETE FROM vw_sales_det
WHERE order_no = 'ORD001'
AND product_no = 'PROD001';



SELECT * FROM sales_order;
SELECT * FROM sales_order_details;
SELECT * FROM vw_sales_det;
