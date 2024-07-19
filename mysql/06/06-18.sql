SELECT
    TABLE_NAME,
    TABLE_COMMENT
FROM
    information_schema.TABLES
WHERE
    (
        TABLE_SCHEMA = 'jay_neo'
        AND TABLE_NAME = 'emp'
    );
