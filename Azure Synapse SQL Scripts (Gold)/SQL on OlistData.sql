CREATE SCHEMA GOLD;

CREATE VIEW GOLD.ECOMM AS
    SELECT
     *
    FROM
        OPENROWSET (
        BULK 'https://saolistecommdata.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
        ) AS result;

SELECT * FROM GOLD.ECOMM;

CREATE VIEW GOLD.ECOMM_DELIVERED AS
    SELECT
     *
    FROM
        OPENROWSET (
        BULK 'https://saolistecommdata.dfs.core.windows.net/olistdata/silver/',
        FORMAT = 'PARQUET'
        ) AS result
    WHERE order_status = 'delivered';

SELECT * FROM GOLD.ECOMM_DELIVERED;