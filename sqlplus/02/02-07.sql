SELECT
    *
FROM
    sales_order
WHERE
    (
        client_no IN ('C001', 'C002')
    );
