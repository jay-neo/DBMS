SELECT
    TO_CHAR(delivery_date, 'DD-Month-YY') AS formatted_delivery_date
FROM
    sales_order;
