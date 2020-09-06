/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF EXISTS (
  SELECT *
	FROM sys.tables
	JOIN sys.schemas
	  ON sys.tables.schema_id = sys.schemas.schema_id
   WHERE sys.schemas.name = N'dbo'
	 AND sys.tables.name = N'DimProduct'
)
BEGIN
	UPDATE [dbo].[DimProduct]
	SET [StockTypeID] = -1
	WHERE [StockTypeID] IS NULL;

	WITH cteStockTypes as (
		SELECT 1 as [Id], 'High' as [Name] UNION ALL
		SELECT 2, 'Mid' UNION ALL
		SELECT 3, 'Low' UNION ALL
		SELECT -1, 'Unknown' 
	)

	UPDATE P
	SET [StockTypeName] = ST.[Name]
	FROM [dbo].[DimProduct] as P 
	JOIN cteStockTypes ST ON P.StockTypeID = ST.Id
	WHERE P.[StockTypeName] IS NULL
END


GO


-------------------------This is the end of Pre-Deployment script --------------------