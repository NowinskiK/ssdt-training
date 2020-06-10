CREATE TABLE [Purchasing].[PurchaseOrders] (
    [PurchaseOrderID]      INT            CONSTRAINT [DF_Purchasing_PurchaseOrders_PurchaseOrderID] DEFAULT (NEXT VALUE FOR [Sequences].[PurchaseOrderID]) NOT NULL,
    [SupplierID]           INT            NOT NULL,
    [OrderDate]            DATE           NOT NULL,
    [DeliveryMethodID]     INT            NOT NULL,
    [ContactPersonID]      INT            NOT NULL,
    [ExpectedDeliveryDate] DATE           NULL,
    [SupplierReference]    NVARCHAR (20)  NULL,
    [IsOrderFinalized]     BIT            NOT NULL,
    [Comments]             NVARCHAR (MAX) NULL,
    [InternalComments]     NVARCHAR (MAX) NULL,
    [LastEditedBy]         INT            NOT NULL,
    [LastEditedWhen]       DATETIME2 (7)  CONSTRAINT [DF_Purchasing_PurchaseOrders_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Purchasing_PurchaseOrders] PRIMARY KEY CLUSTERED ([PurchaseOrderID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Purchasing_PurchaseOrders_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Purchasing_PurchaseOrders_ContactPersonID_Application_People] FOREIGN KEY ([ContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Purchasing_PurchaseOrders_DeliveryMethodID_Application_DeliveryMethods] FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]),
    CONSTRAINT [FK_Purchasing_PurchaseOrders_SupplierID_Purchasing_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrders_ContactPersonID]
    ON [Purchasing].[PurchaseOrders]([ContactPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrders_DeliveryMethodID]
    ON [Purchasing].[PurchaseOrders]([DeliveryMethodID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrders_SupplierID]
    ON [Purchasing].[PurchaseOrders]([SupplierID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'INDEX', @level2name = N'FK_Purchasing_PurchaseOrders_ContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'INDEX', @level2name = N'FK_Purchasing_PurchaseOrders_DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'INDEX', @level2name = N'FK_Purchasing_PurchaseOrders_SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Details of supplier purchase orders', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a purchase order within the database', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'PurchaseOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier for this purchase order', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that this purchase order was raised', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'OrderDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'How this purchase order should be delivered', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'The person who is the primary contact for this purchase order', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'ContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Expected delivery date for this purchase order', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'ExpectedDeliveryDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Supplier reference for our organization (might be our account number at the supplier)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'SupplierReference';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this purchase order now considered finalized?', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'IsOrderFinalized';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any comments related this purchase order (comments sent to the supplier)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'Comments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any internal comments related this purchase order (comments for internal reference only and not sent to the supplier)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'PurchaseOrders', @level2type = N'COLUMN', @level2name = N'InternalComments';

