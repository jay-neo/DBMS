SELECT
    COLUMN_NAME,
    COLUMN_COMMENT
FROM
    information_schema.COLUMNS
WHERE
    (
        TABLE_SCHEMA = 'jay_neo'
        AND TABLE_NAME = 'emp'
        AND COLUMN_NAME = 'ename'
    );
