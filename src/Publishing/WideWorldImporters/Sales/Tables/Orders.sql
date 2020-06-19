CREATE TABLE [Sales].[Orders] (
    [OrderID]                     INT            CONSTRAINT [DF_Sales_Orders_OrderID] DEFAULT (NEXT VALUE FOR [Sequences].[OrderID]) NOT NULL,
    [CustomerID]                  INT            NOT NULL,
    [SalespersonPersonID]         INT            NOT NULL,
    [PickedByPersonID]            INT            NULL,
    [ContactPersonID]             INT            NOT NULL,
    [BackorderOrderID]            INT            NULL,
    [OrderDate]                   DATE           NOT NULL,
    [ExpectedDeliveryDate]        DATE           NOT NULL,
    [CustomerPurchaseOrderNumber] NVARCHAR (20)  NULL,
    [IsUndersupplyBackordered]    BIT            NOT NULL,
    [Comments]                    NVARCHAR (MAX) NULL,
    [DeliveryInstructions]        NVARCHAR (MAX) NULL,
    [InternalComments]            NVARCHAR (MAX) NULL,
    [PickingCompletedWhen]        DATETIME2 (7)  NULL,
    [LastEditedBy]                INT            NOT NULL,
    [LastEditedWhen]              DATETIME2 (7)  CONSTRAINT [DF_Sales_Orders_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Sales_Orders_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Orders_BackorderOrderID_Sales_Orders] FOREIGN KEY ([BackorderOrderID]) REFERENCES [Sales].[Orders] ([OrderID]),
    CONSTRAINT [FK_Sales_Orders_ContactPersonID_Application_People] FOREIGN KEY ([ContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Orders_CustomerID_Sales_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Sales_Orders_PickedByPersonID_Application_People] FOREIGN KEY ([PickedByPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Orders_SalespersonPersonID_Application_People] FOREIGN KEY ([SalespersonPersonID]) REFERENCES [Application].[People] ([PersonID])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Orders_ContactPersonID]
    ON [Sales].[Orders]([ContactPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Orders_CustomerID]
    ON [Sales].[Orders]([CustomerID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Orders_PickedByPersonID]
    ON [Sales].[Orders]([PickedByPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Orders_SalespersonPersonID]
    ON [Sales].[Orders]([SalespersonPersonID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'INDEX', @level2name = N'FK_Sales_Orders_ContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'INDEX', @level2name = N'FK_Sales_Orders_CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'INDEX', @level2name = N'FK_Sales_Orders_PickedByPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'INDEX', @level2name = N'FK_Sales_Orders_SalespersonPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Detail of customer orders', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to an order within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'OrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer for this order', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Salesperson for this order', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'SalespersonPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Person who picked this shipment', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'PickedByPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer contact for this order', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'ContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'If this order is a backorder, this column holds the original order number', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'BackorderOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that this order was raised', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'OrderDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Expected delivery date', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'ExpectedDeliveryDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase Order Number received from customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'CustomerPurchaseOrderNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'If items cannot be supplied are they backordered?', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'IsUndersupplyBackordered';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any comments related to this order (sent to customer)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'Comments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any comments related to order delivery (sent to customer)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'DeliveryInstructions';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any internal comments related to this order (not sent to the customer)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'InternalComments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'When was picking of the entire order completed?', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Orders', @level2type = N'COLUMN', @level2name = N'PickingCompletedWhen';

