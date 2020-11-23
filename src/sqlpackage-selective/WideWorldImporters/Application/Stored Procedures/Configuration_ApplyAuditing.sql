
CREATE PROCEDURE [Application].Configuration_ApplyAuditing
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    DECLARE @AreDatabaseAuditSpecificationsSupported bit = 0;
    DECLARE @SQL nvarchar(max);

    -- TODO !! - currently no separate test for audit
    -- but same editions with XTP support database audit specs
    IF SERVERPROPERTY(N'IsXTPSupported') <> 0 SET @AreDatabaseAuditSpecificationsSupported = 1;

    BEGIN TRY;

        IF NOT EXISTS (SELECT 1 FROM sys.server_audits WHERE name = N'WWI_Audit')
        BEGIN
            SET @SQL = N'
USE master;

CREATE SERVER AUDIT [WWI_Audit]
TO APPLICATION_LOG
WITH
(
    QUEUE_DELAY = 1000,
	ON_FAILURE = CONTINUE
);';
            EXECUTE (@SQL);

            PRINT N'Server audit WWI_Audit created with Application Log as a target.';
            PRINT N'For stronger security, redirect the audit to the security log or a text file in a secure folder.';
            PRINT N'Additional configuration is required when using the security log.';
            PRINT N'For more information see: https://technet.microsoft.com/en-us/library/cc645889.aspx.';
        END;

        IF NOT EXISTS (SELECT 1 FROM sys.server_audit_specifications WHERE name = N'WWI_ServerAuditSpecification')
        BEGIN
            SET @SQL = N'
USE master;

CREATE SERVER AUDIT SPECIFICATION [WWI_ServerAuditSpecification]
FOR SERVER AUDIT [WWI_Audit]
ADD (AUDIT_CHANGE_GROUP),
ADD (DATABASE_CHANGE_GROUP),
ADD (DATABASE_OWNERSHIP_CHANGE_GROUP),
ADD (DATABASE_ROLE_MEMBER_CHANGE_GROUP),
ADD (FAILED_LOGIN_GROUP),
ADD (TRACE_CHANGE_GROUP);';
            EXECUTE (@SQL);
        END;

        IF @AreDatabaseAuditSpecificationsSupported <> 0
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM sys.database_audit_specifications WHERE name = N'WWI_DatabaseAuditSpecification')
            BEGIN
                SET @SQL = N'
CREATE DATABASE AUDIT SPECIFICATION [WWI_DatabaseAuditSpecification]
FOR SERVER AUDIT [WWI_Audit]
ADD (AUDIT_CHANGE_GROUP),
ADD (DATABASE_CHANGE_GROUP),
ADD (DATABASE_OWNERSHIP_CHANGE_GROUP),
ADD (DATABASE_PRINCIPAL_CHANGE_GROUP),
ADD (DATABASE_ROLE_MEMBER_CHANGE_GROUP),
ADD (DATABASE_OBJECT_CHANGE_GROUP),
ADD (SELECT ON OBJECT::[Sales].[CustomerTransactions] BY [public]),
ADD (SELECT ON OBJECT::[Purchasing].[SupplierTransactions] BY [public]);';
                EXECUTE (@SQL);
            END;
        END;

    END TRY
    BEGIN CATCH
        PRINT N'Unable to apply audit';
        THROW;
    END CATCH;
END;