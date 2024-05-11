SELECT
    Product_no,
    Description,
    Sell_price,
    Sell_price * 1.15 AS New_price
FROM
    product_master
WHERE
    Sell_price > 1500;
