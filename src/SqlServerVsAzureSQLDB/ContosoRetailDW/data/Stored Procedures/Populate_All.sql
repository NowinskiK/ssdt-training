CREATE PROCEDURE [data].[Populate_All]
AS

EXEC [data].[Populate_dbo_DimDate];
EXEC [data].[Populate_dbo_DimEmployee];
EXEC [data].[Populate_dbo_DimEntity];

RETURN 0
