CREATE USER extROUser
	WITH PASSWORD = 'ReeA1frejgiWeZjg'
GO

-- Add user to the database owner role
EXEC sp_addrolemember N'db_owner', N'extROUser'
GO
