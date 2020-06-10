/****** Object:  UserDefinedTableType [Website].[OrderIDList]    Script Date: 10/06/2020 18:14:16 ******/
CREATE TYPE [Website].[OrderIDList] AS TABLE(
	[OrderID] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)