SELECT
    *
FROM
    sales_order
WHERE
    (
        TO_CHAR(Order_date, 'MON') LIKE 'JAN'
    );
