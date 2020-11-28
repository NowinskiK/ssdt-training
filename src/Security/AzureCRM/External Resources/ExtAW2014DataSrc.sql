CREATE EXTERNAL DATA SOURCE [ExtAW2014DataSrc]
    WITH (
    TYPE = RDBMS,
    LOCATION = N'sqlplayer.database.windows.net',
    DATABASE_NAME = N'AdventureWorks2014',
    CREDENTIAL = [AW2014_Credential]
    );

