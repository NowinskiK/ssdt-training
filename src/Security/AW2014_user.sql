USE AdventureWorks2014
GO

CREATE USER extROUser
	WITH PASSWORD = 'ReeA1frejgiWeZjg'
GO

-- Add user to the database owner role
--EXEC sp_addrolemember N'db_owner', N'extROUser'
EXEC sp_addrolemember 'db_datareader', 'extROUser'
