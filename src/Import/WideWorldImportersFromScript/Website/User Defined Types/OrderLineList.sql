/****** Object:  UserDefinedTableType [Website].[OrderLineList]    Script Date: 10/06/2020 18:14:16 ******/
CREATE TYPE [Website].[OrderLineList] AS TABLE(
	[OrderReference] [int] NULL,
	[StockItemID] [int] NULL,
	[Description] [nvarchar](100) COLLATE Latin1_General_100_CI_AS NULL,
	[Quantity] [int] NULL
)