CREATE USER [UserWithPassword1]
	WITH PASSWORD = '~dut5snmmgqgll_yusokxriomsFT7_&#$!~<pl6yay5&ih8U'
GO

GRANT CONNECT TO [UserWithPassword1]

/*
Msg 33233, Level 16, State 1, Line 47
You can only create a user with a password in a contained database.
https://docs.microsoft.com/en-us/sql/relational-databases/databases/contained-databases
*/
