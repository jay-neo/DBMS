SELECT
    Name,
    City,
    State
FROM
    client_master
WHERE
    (
        State != 'Maharashtra'
    );
