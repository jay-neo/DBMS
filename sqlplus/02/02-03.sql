SELECT
    Name,
    City
FROM
    client_master
WHERE
    (
        LENGTH(Name) = 12
        AND Name LIKE 'I%'
    );
