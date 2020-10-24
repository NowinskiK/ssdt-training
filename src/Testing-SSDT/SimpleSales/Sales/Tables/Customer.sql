CREATE TABLE [Sales].[Customer] (  
    [CustomerID]   INT           IDENTITY (1, 1) NOT NULL,  
    [CustomerName] NVARCHAR (40) NOT NULL,  
    [YTDOrders]    INT           NOT NULL,  
    [YTDSales]     INT           NOT NULL  
);
GO
ALTER TABLE [Sales].[Customer]  
    ADD CONSTRAINT [Def_Customer_YTDOrders] DEFAULT 0 FOR [YTDOrders];
GO
ALTER TABLE [Sales].[Customer]  
    ADD CONSTRAINT [Def_Customer_YTDSales] DEFAULT 0 FOR [YTDSales];
GO
ALTER TABLE [Sales].[Customer]  
    ADD CONSTRAINT [PK_Customer_CustID] PRIMARY KEY CLUSTERED ([CustomerID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);