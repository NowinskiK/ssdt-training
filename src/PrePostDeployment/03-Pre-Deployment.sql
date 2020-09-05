
--Pre
UPDATE [dbo].[DimProduct]
SET [StockTypeID] = -1
WHERE [StockTypeID] IS NULL;
GO

WITH cteStockTypes as (
	SELECT 1 as [Id], 'High' as [Name] UNION ALL
	SELECT 2, 'Mid' UNION ALL
	SELECT 3, 'Low' UNION ALL
	SELECT -1, 'Unknown' 
)
SELECT * FROM cteStockTypes

UPDATE P
SET [StockTypeName] = ST.[Name]
FROM [dbo].[DimProduct] as P 
JOIN cteStockTypes ST ON P.StockTypeID = ST.Id
WHERE P.[StockTypeName] IS NULL
GO


