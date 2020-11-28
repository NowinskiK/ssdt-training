-- User in Azure SQL Database or Azure Synapse Analytics (SQL Data Warehouse) based on an Azure Active Directory user

-- DisplayName of Azure AD object for Azure AD Groups and Azure AD Applications. If you had the Nurses security group, you would use:
CREATE USER [Group1] FOR EXTERNAL PROVIDER
WITH DEFAULT_SCHEMA = dbo
;
GO

-- https://docs.microsoft.com/en-us/sql/t-sql/statements/create-user-transact-sql?view=sql-server-ver15

