
--EXEC P_FactSalesQuota 0.25,0.45,0.35,0.25,0.35,0.3,0.2,0.25,0.2,0.15,0.05,0.05,0.2,0.05,0.05,0.1,0.05,0.05

CREATE PROC [dbo].[P_FactSalesQuota]
(
	@NAmerican2007 float,-----The forecast parameter
	@NAmerican2008 float,
	@NAmerican2009 float,
	@Europe2007 float,
	@Europe2008 float,
	@Europe2009 float,
	@Asia2007 float,
	@Asia2008 float,
	@Asia2009 float,
	@NAmerican2007Budget float,
	@NAmerican2008Budget float,
	@NAmerican2009Budget float,
	@Europe2007Budget float,
	@Europe2008Budget float,
	@Europe2009Budget float,
	@Asia2007Budget float,
	@Asia2008Budget float,
	@Asia2009Budget float	
)
AS
BEGIN
---Generate Basic Data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
 
SELECT      S.channelKey,S.StoreKey,S.ProductKey,
            DATEADD(d,-DAY(S.DateKey)+1,S.DateKey) AS DateKey,
            S.CurrencyKey,1 AS ScenarioKey,--Actual
            SUM(S.SalesQuantity) AS SalesQuantityQuota,
            SUM(S.SalesAmount) AS SalesAmount,
            SUM(S.SalesAmount)-SUM(S.ReturnAmount)-SUM(S.TotalCost) AS GrossMarginQuota,
            1 AS ETLLoadID,GETDATE() AS LoadDate,GETDATE() AS UpdateDate
FROM		FactSales S
GROUP BY    S.StoreKey,DATEADD(d,-DAY(S.DateKey)+1,S.DateKey),
			S.channelKey,S.ProductKey,S.CurrencyKey

                  
---Update the Basic Data
---NAmerican
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2007 + 0.9)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2007 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2007 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE	s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' 
		and SubString(e.EntityLabel,1,2) = '01'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2008 + 1)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2008 + 1) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2008 + 1) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '01'


INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '01'

---Europe
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2007 + 0.9)) ,
            s.SalesAmountQuota * (RAND()*@Europe2007 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@Europe2007 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2008 + 1)) ,
            s.SalesAmountQuota * (RAND()*@Europe2008 + 1) , 
            s.GrossMarginQuota * (RAND()*@Europe2008 + 1) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '02'

---Asia
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2007 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2007 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2007 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2008 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2008 + 0.9) , 
            s.GrossMarginQuota * (RAND()*@Asia2008 + 0.9) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 3 AS ScenarioKey, 
           Convert(int, s.SalesQuantityQuota * (RAND()*@Asia2009 + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2009 + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2009 + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '03'


---NAmerican budget data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '01'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '01'


INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@NAmerican2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@NAmerican2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@NAmerican2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '01'

---Europe budget data
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '02'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Europe2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Europe2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Europe2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '02'

---Asia budget
INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2007Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2007Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2007Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20070101' and s.DateKey<='20080630' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
            Convert(int,s.SalesQuantityQuota * (RAND()*@Asia2008Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2008Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2008Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20080701' and s.DateKey<='20081231' and SubString(e.EntityLabel,1,2) = '03'

INSERT      FactSalesQuota(
            ChannelKey,StoreKey,ProductKey, 
            DateKey, CurrencyKey, ScenarioKey, 
            SalesQuantityQuota,SalesAmountQuota, GrossMarginQuota, 
            ETLLoadID, LoadDate, UpdateDate)
SELECT      s.ChannelKey,s.StoreKey, s.ProductKey, 
            s.DateKey, s.CurrencyKey, 2 AS ScenarioKey, 
           Convert(int, s.SalesQuantityQuota * (RAND()*@Asia2009Budget + 0.8)) ,
            s.SalesAmountQuota * (RAND()*@Asia2009Budget + 0.8) , 
            s.GrossMarginQuota * (RAND()*@Asia2009Budget + 0.8) , 
            s.ETLLoadID, s.LoadDate, s.UpdateDate
FROM  FactSalesQuota s left join DimStore d
on s.StoreKey = d.StoreKey left join DimEntity e
on d.EntityKey = e.EntityKey
WHERE s.ScenarioKey = 1 and s.DateKey>='20090101' and s.DateKey<='20091231' and SubString(e.EntityLabel,1,2) = '03'

--End
End



