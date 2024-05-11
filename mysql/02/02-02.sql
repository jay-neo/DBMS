SELECT
    Name
FROM
    client_master
WHERE
    (
        Name NOT LIKE 'B%'
    );
