CREATE TYPE [Website].[OrderLineList] AS TABLE (
    [OrderReference] INT            NULL,
    [StockItemID]    INT            NULL,
    [Description]    NVARCHAR (100) NULL,
    [Quantity]       INT            NULL);

