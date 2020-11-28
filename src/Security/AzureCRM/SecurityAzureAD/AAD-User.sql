-- User in Azure SQL Database or Azure Synapse Analytics (SQL Data Warehouse) based on an Azure Active Directory user

-- UserPrincipalName of the Azure AD object for Azure AD Users.
CREATE USER [kamil@nowinski.onmicrosoft.com] FOR EXTERNAL PROVIDER
WITH DEFAULT_SCHEMA = dbo
;
GO

GRANT CONNECT TO [kamil@nowinski.onmicrosoft.com];
GO

-- https://docs.microsoft.com/en-us/sql/t-sql/statements/create-user-transact-sql?view=sql-server-ver15

/* 

=== Potential errors: ===

Msg 33159, Level 16, State 1, Line 1
Principal 'AnalyticalProcessor' could not be created. Only connections established with Active Directory accounts can create other Active Directory users.

Msg 33130, Level 16, State 1, Line 1
Principal 'AnalyticalProcessor' could not be found or this principal type is not supported.

*/
