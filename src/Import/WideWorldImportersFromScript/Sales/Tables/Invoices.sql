CREATE TABLE [Sales].[Invoices](
	[InvoiceID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[BillToCustomerID] [int] NOT NULL,
	[OrderID] [int] NULL,
	[DeliveryMethodID] [int] NOT NULL,
	[ContactPersonID] [int] NOT NULL,
	[AccountsPersonID] [int] NOT NULL,
	[SalespersonPersonID] [int] NOT NULL,
	[PackedByPersonID] [int] NOT NULL,
	[InvoiceDate] [date] NOT NULL,
	[CustomerPurchaseOrderNumber] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[IsCreditNote] [bit] NOT NULL,
	[CreditNoteReason] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[Comments] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[DeliveryInstructions] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[InternalComments] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[TotalDryItems] [int] NOT NULL,
	[TotalChillerItems] [int] NOT NULL,
	[DeliveryRun] [nvarchar](5) COLLATE Latin1_General_100_CI_AS NULL,
	[RunPosition] [nvarchar](5) COLLATE Latin1_General_100_CI_AS NULL,
	[ReturnedDeliveryData] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[ConfirmedDeliveryTime]  AS (TRY_CONVERT([datetime2](7),json_value([ReturnedDeliveryData],N'$.DeliveredWhen'),(126))),
	[ConfirmedReceivedBy]  AS (json_value([ReturnedDeliveryData],N'$.ReceivedBy')),
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Sales_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_AccountsPersonID_Application_People] FOREIGN KEY([AccountsPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_AccountsPersonID_Application_People]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_Application_People]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_BillToCustomerID_Sales_Customers] FOREIGN KEY([BillToCustomerID])
REFERENCES [Sales].[Customers] ([CustomerID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_BillToCustomerID_Sales_Customers]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_ContactPersonID_Application_People] FOREIGN KEY([ContactPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_ContactPersonID_Application_People]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_CustomerID_Sales_Customers] FOREIGN KEY([CustomerID])
REFERENCES [Sales].[Customers] ([CustomerID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_CustomerID_Sales_Customers]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_DeliveryMethodID_Application_DeliveryMethods] FOREIGN KEY([DeliveryMethodID])
REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_DeliveryMethodID_Application_DeliveryMethods]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_OrderID_Sales_Orders] FOREIGN KEY([OrderID])
REFERENCES [Sales].[Orders] ([OrderID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_OrderID_Sales_Orders]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_PackedByPersonID_Application_People] FOREIGN KEY([PackedByPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_PackedByPersonID_Application_People]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Invoices_SalespersonPersonID_Application_People] FOREIGN KEY([SalespersonPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [FK_Sales_Invoices_SalespersonPersonID_Application_People]
GO
ALTER TABLE [Sales].[Invoices] ADD  CONSTRAINT [DF_Sales_Invoices_InvoiceID]  DEFAULT (NEXT VALUE FOR [Sequences].[InvoiceID]) FOR [InvoiceID]
GO
ALTER TABLE [Sales].[Invoices] ADD  CONSTRAINT [DF_Sales_Invoices_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
ALTER TABLE [Sales].[Invoices]  WITH CHECK ADD  CONSTRAINT [CK_Sales_Invoices_ReturnedDeliveryData_Must_Be_Valid_JSON] CHECK  (([ReturnedDeliveryData] IS NULL OR isjson([ReturnedDeliveryData])<>(0)))
GO

ALTER TABLE [Sales].[Invoices] CHECK CONSTRAINT [CK_Sales_Invoices_ReturnedDeliveryData_Must_Be_Valid_JSON]
GO
/****** Object:  Index [FK_Sales_Invoices_AccountsPersonID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_AccountsPersonID] ON [Sales].[Invoices]
(
	[AccountsPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_Invoices_BillToCustomerID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_BillToCustomerID] ON [Sales].[Invoices]
(
	[BillToCustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_Invoices_ContactPersonID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_ContactPersonID] ON [Sales].[Invoices]
(
	[ContactPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_Invoices_CustomerID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_CustomerID] ON [Sales].[Invoices]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_Invoices_DeliveryMethodID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_DeliveryMethodID] ON [Sales].[Invoices]
(
	[DeliveryMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_Invoices_OrderID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_OrderID] ON [Sales].[Invoices]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_Invoices_PackedByPersonID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_PackedByPersonID] ON [Sales].[Invoices]
(
	[PackedByPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Sales_Invoices_SalespersonPersonID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Sales_Invoices_SalespersonPersonID] ON [Sales].[Invoices]
(
	[SalespersonPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [IX_Sales_Invoices_ConfirmedDeliveryTime]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [IX_Sales_Invoices_ConfirmedDeliveryTime] ON [Sales].[Invoices]
(
	[ConfirmedDeliveryTime] ASC
)
INCLUDE([ConfirmedReceivedBy]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to an invoice within the database' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'InvoiceID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer for this invoice' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Bill to customer for this invoice (invoices might be billed to a head office)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'BillToCustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Sales order (if any) for this invoice' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How these stock items are beign delivered' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'DeliveryMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer contact for this invoice' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'ContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Customer accounts contact for this invoice' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'AccountsPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Salesperson for this invoice' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'SalespersonPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Person who packed this shipment (or checked the packing)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'PackedByPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date that this invoice was raised' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'InvoiceDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Purchase Order Number received from customer' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'CustomerPurchaseOrderNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this a credit note (rather than an invoice)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'IsCreditNote'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Reason that this credit note needed to be generated (if applicable)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'CreditNoteReason'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Any comments related to this invoice (sent to customer)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Any comments related to delivery (sent to customer)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'DeliveryInstructions'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Any internal comments related to this invoice (not sent to the customer)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'InternalComments'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Total number of dry packages (information for the delivery driver)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'TotalDryItems'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Total number of chiller packages (information for the delivery driver)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'TotalChillerItems'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Delivery run for this shipment' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'DeliveryRun'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Position in the delivery run for this shipment' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'RunPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'JSON-structured data returned from delivery devices for deliveries made directly by the organization' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'ReturnedDeliveryData'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Confirmed delivery date and time promoted from JSON delivery data' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'ConfirmedDeliveryTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Confirmed receiver promoted from JSON delivery data' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'ConfirmedReceivedBy'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_AccountsPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_BillToCustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_ContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_DeliveryMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_PackedByPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'FK_Sales_Invoices_SalespersonPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Allows quick retrieval of invoices confirmed to have been delivered in a given time period' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'IX_Sales_Invoices_ConfirmedDeliveryTime'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Details of customer invoices' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ensures that if returned delivery data is present that it is valid JSON' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'CONSTRAINT',@level2name=N'CK_Sales_Invoices_ReturnedDeliveryData_Must_Be_Valid_JSON'