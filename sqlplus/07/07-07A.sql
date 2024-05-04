CREATE VIEW vw_client_master AS
SELECT
    Client_no,
    name,
    address1,
    bal_due
FROM
    Client_Master;