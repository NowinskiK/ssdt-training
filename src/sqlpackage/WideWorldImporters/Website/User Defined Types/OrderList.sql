CREATE TYPE [Website].[OrderList] AS TABLE (
    [OrderReference]              INT            NOT NULL,
    [CustomerID]                  INT            NULL,
    [ContactPersonID]             INT            NULL,
    [ExpectedDeliveryDate]        DATE           NULL,
    [CustomerPurchaseOrderNumber] NVARCHAR (20)  NULL,
    [IsUndersupplyBackordered]    BIT            NULL,
    [Comments]                    NVARCHAR (MAX) NULL,
    [DeliveryInstructions]        NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([OrderReference] ASC));

