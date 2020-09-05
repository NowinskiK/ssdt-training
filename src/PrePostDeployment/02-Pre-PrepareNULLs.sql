SELECT top 100 *
FROM [ContosoRetailDW_DEV].[dbo].[DimProduct]
WHERE ProductLabel like '%07'


ALTER TABLE [dbo].[DimProduct] ALTER COLUMN [StockTypeID] NVARCHAR(10) NULL;
ALTER TABLE [dbo].[DimProduct] ALTER COLUMN [StockTypeName] NVARCHAR(40) NULL;

UPDATE [ContosoRetailDW_DEV].[dbo].[DimProduct]
SET [StockTypeName] = null
WHERE ProductLabel like '%07'

UPDATE [ContosoRetailDW_DEV].[dbo].[DimProduct]
SET [StockTypeID] = null
WHERE ProductLabel like '%3007'
