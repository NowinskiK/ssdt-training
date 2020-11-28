
-- WITH PASSWORD
-- Specifies the password for the user that is being created. 
-- Can only be used in a contained database. 

CREATE USER [UserWithPassword1]
	WITH PASSWORD = '~dut5snmmgqgll_yusokxriomsFT7_&#$!~<pl6yay5&ih8U'
GO

GRANT CONNECT TO [UserWithPassword1]

-- https://docs.microsoft.com/en-us/sql/t-sql/statements/create-user-transact-sql?view=sql-server-ver15