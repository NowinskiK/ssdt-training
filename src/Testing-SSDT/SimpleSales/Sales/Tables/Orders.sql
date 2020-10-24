CREATE TABLE [Sales].[Orders] (  
    [CustomerID] INT      NOT NULL,  
    [OrderID]    INT      IDENTITY (1, 1) NOT NULL,  
    [OrderDate]  DATETIME NOT NULL,  
    [FilledDate] DATETIME NULL,  
    [Status]     CHAR (1) NOT NULL,  
    [Amount]     INT      NOT NULL  
);
GO
ALTER TABLE [Sales].[Orders]  
    ADD CONSTRAINT [FK_Orders_Customer_CustID] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customer] ([CustomerID]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [Sales].[Orders]  
    ADD CONSTRAINT [Def_Orders_OrderDate] DEFAULT GetDate() FOR [OrderDate];
GO
ALTER TABLE [Sales].[Orders]  
    ADD CONSTRAINT [Def_Orders_Status] DEFAULT 'O' FOR [Status];
GO
ALTER TABLE [Sales].[Orders]  
    ADD CONSTRAINT [CK_Orders_FilledDate] CHECK ((FilledDate >= OrderDate) AND (FilledDate < '01/01/2030'));
GO
ALTER TABLE [Sales].[Orders]  
    ADD CONSTRAINT [CK_Orders_OrderDate] CHECK ((OrderDate > '01/01/2005') and (OrderDate < '01/01/2030'));
GO
ALTER TABLE [Sales].[Orders]  
    ADD CONSTRAINT [PK_Orders_OrderID] PRIMARY KEY CLUSTERED ([OrderID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);