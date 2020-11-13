
-- Read-only user

IF NOT EXISTS (SELECT 1 FROM sys.database_principals dp WHERE dp.name = '$(roUser)')
BEGIN
    CREATE USER [$(roUser)] FROM LOGIN [$(roUser)];
    PRINT 'User [$(roUser)] has been created in [$(DatabaseName)] database.';
END
EXEC sys.sp_addrolemember @rolename = 'db_datareader', @membername = [$(roUser)];
PRINT 'User [$(roUser)] was granted db_datareader role permissions in [$(DatabaseName)] database.';
GO
