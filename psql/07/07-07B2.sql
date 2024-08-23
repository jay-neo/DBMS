UPDATE sales_order
SET
    client_no = 'NEW_CLIENT'
WHERE
    order_no = 'ORD001';


SELECT * FROM sales_order;
SELECT * FROM sales_order_details;
SELECT * FROM vw_sales_det;
