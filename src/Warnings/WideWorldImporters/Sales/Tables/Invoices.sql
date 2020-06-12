CREATE TABLE [Sales].[Invoices] (
    [InvoiceID]                   INT            CONSTRAINT [DF_Sales_Invoices_InvoiceID] DEFAULT (NEXT VALUE FOR [Sequences].[InvoiceID]) NOT NULL,
    [CustomerID]                  INT            NOT NULL,
    [BillToCustomerID]            INT            NOT NULL,
    [OrderID]                     INT            NULL,
    [DeliveryMethodID]            INT            NOT NULL,
    [ContactPersonID]             INT            NOT NULL,
    [AccountsPersonID]            INT            NOT NULL,
    [SalespersonPersonID]         INT            NOT NULL,
    [PackedByPersonID]            INT            NOT NULL,
    [InvoiceDate]                 DATE           NOT NULL,
    [CustomerPurchaseOrderNumber] NVARCHAR (20)  NULL,
    [IsCreditNote]                BIT            NOT NULL,
    [CreditNoteReason]            NVARCHAR (MAX) NULL,
    [Comments]                    NVARCHAR (MAX) NULL,
    [DeliveryInstructions]        NVARCHAR (MAX) NULL,
    [InternalComments]            NVARCHAR (MAX) NULL,
    [TotalDryItems]               INT            NOT NULL,
    [TotalChillerItems]           INT            NOT NULL,
    [DeliveryRun]                 NVARCHAR (5)   NULL,
    [RunPosition]                 NVARCHAR (5)   NULL,
    [ReturnedDeliveryData]        NVARCHAR (MAX) NULL,
    [ConfirmedDeliveryTime]       AS             (TRY_CONVERT([datetime2](7),json_value([ReturnedDeliveryData],N'$.DeliveredWhen'),(126))),
    [ConfirmedReceivedBy]         AS             (json_value([ReturnedDeliveryData],N'$.ReceivedBy')),
    [LastEditedBy]                INT            NOT NULL,
    [LastEditedWhen]              DATETIME2 (7)  CONSTRAINT [DF_Sales_Invoices_LastEditedWhen] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [PK_Sales_Invoices] PRIMARY KEY CLUSTERED ([InvoiceID] ASC) ON [USERDATA],
    CONSTRAINT [CK_Sales_Invoices_ReturnedDeliveryData_Must_Be_Valid_JSON] CHECK ([ReturnedDeliveryData] IS NULL OR isjson([ReturnedDeliveryData])<>(0)),
    CONSTRAINT [FK_Sales_Invoices_AccountsPersonID_Application_People] FOREIGN KEY ([AccountsPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Invoices_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Invoices_BillToCustomerID_Sales_Customers] FOREIGN KEY ([BillToCustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Sales_Invoices_ContactPersonID_Application_People] FOREIGN KEY ([ContactPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Invoices_CustomerID_Sales_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [Sales].[Customers] ([CustomerID]),
    CONSTRAINT [FK_Sales_Invoices_DeliveryMethodID_Application_DeliveryMethods] FOREIGN KEY ([DeliveryMethodID]) REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID]),
    CONSTRAINT [FK_Sales_Invoices_OrderID_Sales_Orders] FOREIGN KEY ([OrderID]) REFERENCES [Sales].[Orders] ([OrderID]),
    CONSTRAINT [FK_Sales_Invoices_PackedByPersonID_Application_People] FOREIGN KEY ([PackedByPersonID]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Sales_Invoices_SalespersonPersonID_Application_People] FOREIGN KEY ([SalespersonPersonID]) REFERENCES [Application].[People] ([PersonID])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_AccountsPersonID]
    ON [Sales].[Invoices]([AccountsPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_BillToCustomerID]
    ON [Sales].[Invoices]([BillToCustomerID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_ContactPersonID]
    ON [Sales].[Invoices]([ContactPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_CustomerID]
    ON [Sales].[Invoices]([CustomerID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_DeliveryMethodID]
    ON [Sales].[Invoices]([DeliveryMethodID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_OrderID]
    ON [Sales].[Invoices]([OrderID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_PackedByPersonID]
    ON [Sales].[Invoices]([PackedByPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_SalespersonPersonID]
    ON [Sales].[Invoices]([SalespersonPersonID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Sales_Invoices_ConfirmedDeliveryTime]
    ON [Sales].[Invoices]([ConfirmedDeliveryTime] ASC)
    INCLUDE([ConfirmedReceivedBy])
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_AccountsPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_BillToCustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_ContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_OrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_PackedByPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'FK_Sales_Invoices_SalespersonPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quick retrieval of invoices confirmed to have been delivered in a given time period', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'INDEX', @level2name = N'IX_Sales_Invoices_ConfirmedDeliveryTime';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Ensures that if returned delivery data is present that it is valid JSON', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'CONSTRAINT', @level2name = N'CK_Sales_Invoices_ReturnedDeliveryData_Must_Be_Valid_JSON';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Details of customer invoices', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to an invoice within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'InvoiceID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer for this invoice', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'CustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Bill to customer for this invoice (invoices might be billed to a head office)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'BillToCustomerID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Sales order (if any) for this invoice', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'OrderID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'How these stock items are beign delivered', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'DeliveryMethodID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer contact for this invoice', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'ContactPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Customer accounts contact for this invoice', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'AccountsPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Salesperson for this invoice', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'SalespersonPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Person who packed this shipment (or checked the packing)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'PackedByPersonID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Date that this invoice was raised', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'InvoiceDate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Purchase Order Number received from customer', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'CustomerPurchaseOrderNumber';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this a credit note (rather than an invoice)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'IsCreditNote';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Reason that this credit note needed to be generated (if applicable)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'CreditNoteReason';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any comments related to this invoice (sent to customer)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'Comments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any comments related to delivery (sent to customer)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'DeliveryInstructions';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Any internal comments related to this invoice (not sent to the customer)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'InternalComments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total number of dry packages (information for the delivery driver)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'TotalDryItems';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Total number of chiller packages (information for the delivery driver)', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'TotalChillerItems';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Delivery run for this shipment', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'DeliveryRun';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Position in the delivery run for this shipment', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'RunPosition';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'JSON-structured data returned from delivery devices for deliveries made directly by the organization', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'ReturnedDeliveryData';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Confirmed delivery date and time promoted from JSON delivery data', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'ConfirmedDeliveryTime';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Confirmed receiver promoted from JSON delivery data', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'Invoices', @level2type = N'COLUMN', @level2name = N'ConfirmedReceivedBy';

