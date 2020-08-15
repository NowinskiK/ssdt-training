CREATE PROCEDURE [data].[Populate_All]
AS

EXEC [data].[Populate_dbo_DimDate];
EXEC [data].[Populate_dbo_DimPromotion];
EXEC [data].[Populate_dbo_DimProductCategory];
EXEC [data].[Populate_dbo_DimProductSubcategory];
EXEC [data].[Populate_dbo_DimProduct];

RETURN 0
