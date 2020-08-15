CREATE PROCEDURE [data].[Populate_dbo_DimPromotion]
AS
BEGIN
/*
	Table's data:    [dbo].[DimPromotion]
	Data Source:     [DEV19].[ContosoRetailDW]
	Created on:      16/08/2020 00:33:45
	Scripted by:     DEV19\Administrator
	Generated by:    Data Script Writer - ver. 2.2.0.0
	GitHub repo URL: https://github.com/SQLPlayer/DataScriptWriter/
*/
PRINT 'Populating data into [dbo].[DimPromotion]';

IF OBJECT_ID('tempdb.dbo.#dbo_DimPromotion') IS NOT NULL DROP TABLE #dbo_DimPromotion;
SELECT * INTO #dbo_DimPromotion FROM [dbo].[DimPromotion] WHERE 0=1;

SET IDENTITY_INSERT #dbo_DimPromotion ON;

INSERT INTO #dbo_DimPromotion 
 ([PromotionKey], [PromotionLabel], [PromotionName], [PromotionDescription], [DiscountPercent], [PromotionType], [PromotionCategory], [StartDate], [EndDate], [MinQuantity], [MaxQuantity], [ETLLoadID], [LoadDate], [UpdateDate])
SELECT CAST([PromotionKey] AS int) AS [PromotionKey], [PromotionLabel], [PromotionName], [PromotionDescription], [DiscountPercent], [PromotionType], [PromotionCategory], [StartDate], [EndDate], [MinQuantity], [MaxQuantity], [ETLLoadID], [LoadDate], [UpdateDate] FROM 
(VALUES
	  (1,	N'001',	N'No Discount',	N'No Discount',	0,	N'No Discount',	N'No Discount',	'20030101 00:00:00.000',	'20101231 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (2,	N'002',	N'North America Spring Promotion',	N'North America Spring Promotion',	0.05,	N'Seasonal Discount',	N'Store',	'20070101 00:00:00.000',	'20070331 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (3,	N'003',	N'North America Back-to-School Promotion',	N'North America Back-to-School Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20070701 00:00:00.000',	'20070930 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (4,	N'004',	N'North America Holiday Promotion',	N'North America Holiday Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20071101 00:00:00.000',	'20071231 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (5,	N'005',	N'Asian Holiday Promotion',	N'Asian Holiday Promotion',	0.15,	N'Seasonal Discount',	N'Store',	'20071101 00:00:00.000',	'20080131 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (6,	N'006',	N'Asian Spring Promotion',	N'Asian Spring Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20070201 00:00:00.000',	'20070430 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (7,	N'007',	N'Asian Summer Promotion',	N'Asian Summer Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20070501 00:00:00.000',	'20070630 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (8,	N'008',	N'European Spring Promotion',	N'European Spring Promotion',	0.07,	N'Seasonal Discount',	N'Store',	'20070201 00:00:00.000',	'20070430 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (9,	N'009',	N'European Back-to-Scholl Promotion',	N'European Back-to-Scholl Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20070801 00:00:00.000',	'20070930 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (10,	N'010',	N'European Holiday Promotion',	N'European Holiday Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20071001 00:00:00.000',	'20080131 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (11,	N'011',	N'North America Spring Promotion',	N'North America Spring Promotion',	0.05,	N'Seasonal Discount',	N'Store',	'20080101 00:00:00.000',	'20080331 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (12,	N'012',	N'North America Back-to-School Promotion',	N'North America Back-to-School Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20080701 00:00:00.000',	'20080930 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (13,	N'013',	N'North America Holiday Promotion',	N'North America Holiday Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20081101 00:00:00.000',	'20081231 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (14,	N'014',	N'Asian Holiday Promotion',	N'Asian Holiday Promotion',	0.15,	N'Seasonal Discount',	N'Store',	'20081101 00:00:00.000',	'20090131 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (15,	N'015',	N'Asian Spring Promotion',	N'Asian Spring Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20080201 00:00:00.000',	'20080430 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (16,	N'016',	N'Asian Summer Promotion',	N'Asian Summer Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20080501 00:00:00.000',	'20080630 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (17,	N'017',	N'European Spring Promotion',	N'European Spring Promotion',	0.07,	N'Seasonal Discount',	N'Store',	'20080201 00:00:00.000',	'20080430 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (18,	N'018',	N'European Back-to-Scholl Promotion',	N'European Back-to-Scholl Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20080801 00:00:00.000',	'20080930 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (19,	N'019',	N'European Holiday Promotion',	N'European Holiday Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20081001 00:00:00.000',	'20090131 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (20,	N'020',	N'North America Spring Promotion',	N'North America Spring Promotion',	0.05,	N'Seasonal Discount',	N'Store',	'20090101 00:00:00.000',	'20100331 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (21,	N'021',	N'North America Back-to-School Promotion',	N'North America Back-to-School Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20090701 00:00:00.000',	'20090930 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (22,	N'022',	N'North America Holiday Promotion',	N'North America Holiday Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20091101 00:00:00.000',	'20091231 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (23,	N'023',	N'Asian Holiday Promotion',	N'Asian Holiday Promotion',	0.15,	N'Seasonal Discount',	N'Store',	'20091101 00:00:00.000',	'20100131 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (24,	N'024',	N'Asian Spring Promotion',	N'Asian Spring Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20090201 00:00:00.000',	'20090430 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (25,	N'025',	N'Asian Summer Promotion',	N'Asian Summer Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20090501 00:00:00.000',	'20090630 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (26,	N'026',	N'European Spring Promotion',	N'European Spring Promotion',	0.07,	N'Seasonal Discount',	N'Store',	'20090201 00:00:00.000',	'20090430 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (27,	N'027',	N'European Back-to-Scholl Promotion',	N'European Back-to-Scholl Promotion',	0.1,	N'Seasonal Discount',	N'Store',	'20090801 00:00:00.000',	'20090930 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
	, (28,	N'028',	N'European Holiday Promotion',	N'European Holiday Promotion',	0.2,	N'Seasonal Discount',	N'Store',	'20091001 00:00:00.000',	'20100131 00:00:00.000',	null,	null,	1,	'20090901 00:00:00.000',	'20090901 00:00:00.000')
) as v ([PromotionKey], [PromotionLabel], [PromotionName], [PromotionDescription], [DiscountPercent], [PromotionType], [PromotionCategory], [StartDate], [EndDate], [MinQuantity], [MaxQuantity], [ETLLoadID], [LoadDate], [UpdateDate]);


SET IDENTITY_INSERT #dbo_DimPromotion OFF;

SET IDENTITY_INSERT [dbo].[DimPromotion] ON;


WITH cte_data as (SELECT CAST([PromotionKey] AS int) AS [PromotionKey], [PromotionLabel], [PromotionName], [PromotionDescription], [DiscountPercent], [PromotionType], [PromotionCategory], [StartDate], [EndDate], [MinQuantity], [MaxQuantity], [ETLLoadID], [LoadDate], [UpdateDate] FROM [#dbo_DimPromotion])
MERGE [dbo].[DimPromotion] as t
USING cte_data as s
	ON t.[PromotionKey] = s.[PromotionKey]
WHEN NOT MATCHED BY target THEN
	INSERT ([PromotionKey], [PromotionLabel], [PromotionName], [PromotionDescription], [DiscountPercent], [PromotionType], [PromotionCategory], [StartDate], [EndDate], [MinQuantity], [MaxQuantity], [ETLLoadID], [LoadDate], [UpdateDate])
	VALUES (s.[PromotionKey], s.[PromotionLabel], s.[PromotionName], s.[PromotionDescription], s.[DiscountPercent], s.[PromotionType], s.[PromotionCategory], s.[StartDate], s.[EndDate], s.[MinQuantity], s.[MaxQuantity], s.[ETLLoadID], s.[LoadDate], s.[UpdateDate])
;

SET IDENTITY_INSERT [dbo].[DimPromotion] OFF;

DROP TABLE #dbo_DimPromotion;

-- End data of table: [dbo].[DimPromotion] --
END
GO
