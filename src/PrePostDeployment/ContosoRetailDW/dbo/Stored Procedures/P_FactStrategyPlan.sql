


CREATE PROC [dbo].[P_FactStrategyPlan]
(
	@AdminCost float,----The percentage of the account
	@ITCost float,
	@HRCost float,
	@EnergyCost float,
	@FixedCost float,
	@VariableCost float,
	@AdCost float,
	@SpringAdCost float,
	@BackSchool float,
	@HolidayAdCost float,
	@CostofGoodsSold float,
	@SellCost float
)
AS
Begin
---Basic Data
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 2 as ScenarioKey, 8 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,
SUM(SalesAmount)*(RAND()*0.2+0.95) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY a.CalendarMonth,a.EntityKey,a.ProductCategoryKey

---Generate data for different account.
---AdminCost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 1 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@AdminCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---ITCost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 2 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@ITCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---HR Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 3 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@HRCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
from FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Energy Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 4 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@EnergyCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Fixed Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 5 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@FixedCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Variable Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 6 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@VariableCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 7 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@AdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Total Product Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 9 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(a.TotalCost)) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey


---Spring / Back to Business Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 10 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@SpringAdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Back-to-School Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 11 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@BackSchool) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
from FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Holiday Ad Cost
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 12 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@HolidayAdCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Cost of Goods Sold 
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 13 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@CostofGoodsSold) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

---Selling, General & Administrative Expenses  
INSERT FactStrategyPlan 
(
	Datekey,EntityKey,ScenarioKey,AccountKey,CurrencyKey,ProductCategoryKey,Amount,ETLLoadID,LoadDate,UpdateDate
) 
SELECT 
CONVERT(int,CAST(CalendarMonth as nvarchar(6))+'01') as DateKey,
EntityKey, 3 as Scenario, 14 as AccountKey,
1 as CurrencyKey , a.ProductCategoryKey as  ProductCategoryKey,Convert(decimal(10,2),SUM(SalesAmount)*@SellCost) as Amount,
1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM 
(
SELECT a.DateKey as DateKey, a.StoreKey as StoreKey, TotalCost,SalesAmount,ReturnAmount,EntityKey,c.CalendarMonth as CalendarMonth, e.ProductCategoryKey as ProductCategoryKey
FROM FactSales a left join DimStore b
on a.StoreKey = b.StoreKey left join DimDate c
on a.DateKey = c.Datekey left join DimProduct d
on a.ProductKey = d.ProductKey left join DimProductSubcategory e
on d.ProductSubcategoryKey = e.ProductSubcategoryKey
) a
GROUP BY CalendarMonth,EntityKey,a.ProductCategoryKey

End


