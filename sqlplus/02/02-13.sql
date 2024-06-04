SELECT
    Order_date + INTERVAL '15 days' AS date_after_15_days
FROM
    sales_order;
