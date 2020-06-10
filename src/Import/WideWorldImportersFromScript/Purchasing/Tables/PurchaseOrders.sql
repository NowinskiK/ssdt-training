CREATE TABLE [Purchasing].[PurchaseOrders](
	[PurchaseOrderID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveryMethodID] [int] NOT NULL,
	[ContactPersonID] [int] NOT NULL,
	[ExpectedDeliveryDate] [date] NULL,
	[SupplierReference] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[IsOrderFinalized] [bit] NOT NULL,
	[Comments] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[InternalComments] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[LastEditedBy] [int] NOT NULL,
	[LastEditedWhen] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Purchasing_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
GO
ALTER TABLE [Purchasing].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrders_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[PurchaseOrders] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrders_Application_People]
GO
ALTER TABLE [Purchasing].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrders_ContactPersonID_Application_People] FOREIGN KEY([ContactPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[PurchaseOrders] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrders_ContactPersonID_Application_People]
GO
ALTER TABLE [Purchasing].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrders_DeliveryMethodID_Application_DeliveryMethods] FOREIGN KEY([DeliveryMethodID])
REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID])
GO

ALTER TABLE [Purchasing].[PurchaseOrders] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrders_DeliveryMethodID_Application_DeliveryMethods]
GO
ALTER TABLE [Purchasing].[PurchaseOrders]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_PurchaseOrders_SupplierID_Purchasing_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [Purchasing].[Suppliers] ([SupplierID])
GO

ALTER TABLE [Purchasing].[PurchaseOrders] CHECK CONSTRAINT [FK_Purchasing_PurchaseOrders_SupplierID_Purchasing_Suppliers]
GO
ALTER TABLE [Purchasing].[PurchaseOrders] ADD  CONSTRAINT [DF_Purchasing_PurchaseOrders_PurchaseOrderID]  DEFAULT (NEXT VALUE FOR [Sequences].[PurchaseOrderID]) FOR [PurchaseOrderID]
GO
ALTER TABLE [Purchasing].[PurchaseOrders] ADD  CONSTRAINT [DF_Purchasing_PurchaseOrders_LastEditedWhen]  DEFAULT (sysdatetime()) FOR [LastEditedWhen]
GO
/****** Object:  Index [FK_Purchasing_PurchaseOrders_ContactPersonID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrders_ContactPersonID] ON [Purchasing].[PurchaseOrders]
(
	[ContactPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_PurchaseOrders_DeliveryMethodID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrders_DeliveryMethodID] ON [Purchasing].[PurchaseOrders]
(
	[DeliveryMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_PurchaseOrders_SupplierID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_PurchaseOrders_SupplierID] ON [Purchasing].[PurchaseOrders]
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a purchase order within the database' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'PurchaseOrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier for this purchase order' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Date that this purchase order was raised' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'OrderDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'How this purchase order should be delivered' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'DeliveryMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'The person who is the primary contact for this purchase order' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'ContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Expected delivery date for this purchase order' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'ExpectedDeliveryDate'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier reference for our organization (might be our account number at the supplier)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'SupplierReference'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Is this purchase order now considered finalized?' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'IsOrderFinalized'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Any comments related this purchase order (comments sent to the supplier)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'Comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Any internal comments related this purchase order (comments for internal reference only and not sent to the supplier)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'COLUMN',@level2name=N'InternalComments'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'INDEX',@level2name=N'FK_Purchasing_PurchaseOrders_ContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'INDEX',@level2name=N'FK_Purchasing_PurchaseOrders_DeliveryMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders', @level2type=N'INDEX',@level2name=N'FK_Purchasing_PurchaseOrders_SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Details of supplier purchase orders' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'PurchaseOrders'