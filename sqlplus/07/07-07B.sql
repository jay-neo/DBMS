CREATE VIEW vw_sales_det AS
SELECT
    t1.Order_no,
    Order_date,
    Product_no,
    Qty_ordered,
    Order_status
FROM
    Sales_Order t1
    JOIN Sales_order_details t2 ON t1.Order_no = t2.Order_No;

------
INSERT INTO
    Sales_Order
VALUES
    (
        '019001',
        TO_DATE('12-Jan-96', 'DD-Mon-YY'),
        'C001',
        'S001',
        'F',
        'N',
        TO_DATE('20-Jan-96', 'DD-Mon-YY'),
        'InProcess'
    );