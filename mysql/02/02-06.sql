SELECT
    *
FROM
    sales_order
WHERE
    (
        DATE_FORMAT (Order_date, '%b') LIKE 'Jan'
    );
