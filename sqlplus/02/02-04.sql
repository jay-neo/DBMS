SELECT
    Name
FROM
    client_master
WHERE
    (
        City LIKE 'BOMBAY'
        OR City LIKE 'Delhi'
    );
