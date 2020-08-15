
-- User for ETL service

IF NOT EXISTS (SELECT 1 FROM sys.database_principals dp WHERE dp.name = '$(svcDatawarehouseETL)')
BEGIN
    CREATE USER [$(svcDatawarehouseETL)] FROM LOGIN [$(svcDatawarehouseETL)];
    PRINT 'User [$(svcDatawarehouseETL)] has been created in [$(DatabaseName)] database.';
END
EXEC sys.sp_addrolemember @rolename = 'db_owner', @membername = [$(svcDatawarehouseETL)];
PRINT 'User [$(svcDatawarehouseETL)] was granted db_owner role permissions in [$(DatabaseName)] database.';
GO


-- Read-only user

IF NOT EXISTS (SELECT 1 FROM sys.database_principals dp WHERE dp.name = '$(roUser)')
BEGIN
    CREATE USER [$(roUser)] FROM LOGIN [$(roUser)];
    PRINT 'User [$(roUser)] has been created in [$(DatabaseName)] database.';
END
EXEC sys.sp_addrolemember @rolename = 'db_datareader', @membername = [$(roUser)];
PRINT 'User [$(roUser)] was granted db_datareader role permissions in [$(DatabaseName)] database.';
GO
