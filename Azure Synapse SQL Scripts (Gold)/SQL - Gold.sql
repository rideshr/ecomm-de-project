CREATE DATABASE SCOPED CREDENTIAL olistusersql WITH IDENTITY = 'Managed Identity';
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Spider-Man@12345';

SELECT * FROM sys.database_credentials;

CREATE EXTERNAL FILE FORMAT extfileformat WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

CREATE EXTERNAL DATA SOURCE goldlayer WITH (
    LOCATION = 'https://saolistecommdata.dfs.core.windows.net/olistdata/gold/',
    CREDENTIAL = olistusersql
);


CREATE EXTERNAL TABLE gold.T_ECOMM_DELIVERED WITH (
LOCATION = 'Serving',
DATA_SOURCE = goldlayer,
FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.ECOMM_DELIVERED;

SELECT * From gold.T_ECOMM_DELIVERED;

CREATE EXTERNAL TABLE gold.T_ECOMM WITH (
LOCATION = 'Overall',
DATA_SOURCE = goldlayer,
FILE_FORMAT = extfileformat
) AS
SELECT * FROM gold.ECOMM;

SELECT * From gold.T_ECOMM;