CREATE VIEW vw_sales_det AS
SELECT so.order_no, so.order_date, sod.product_no, sod.qty_ordered, so.order_status
FROM sales_order so
JOIN sales_order_details sod ON so.order_no = sod.order_no
WHERE so.order_status = 'Backorder';

------
-- This example assumes there are triggers or rules to handle the insertion properly
-- INSERT INTO
--     vw_sales_det (
--         Order_no,
--         Order_date,
--         Product_no,
--         Qty_ordered,
--         order_status
--     )
-- VALUES
--     ('O123', '2024-08-08', 'P001', 10, 'Backorder');
