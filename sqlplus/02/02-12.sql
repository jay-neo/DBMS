SELECT
    TO_CHAR(Order_date, 'DD-Month-YY') AS Formatted_Order_date
FROM
    sales_order;
