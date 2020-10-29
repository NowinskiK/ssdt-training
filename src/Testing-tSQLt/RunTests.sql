USE tSQLt_Example_2
GO

-- Run all tests
EXEC tSQLt.RunAll

-- Run tests belong to selected class
EXEC tSQLt.Run '[AcceleratorTests]'

-- Run selected test
EXEC tSQLt.Run '[AcceleratorTests].[test a particle is included only if it fits inside the boundaries of the rectangle]'

