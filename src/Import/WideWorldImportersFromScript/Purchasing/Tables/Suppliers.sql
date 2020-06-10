CREATE TABLE [Purchasing].[Suppliers](
	[SupplierID] [int] NOT NULL,
	[SupplierName] [nvarchar](100) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[SupplierCategoryID] [int] NOT NULL,
	[PrimaryContactPersonID] [int] NOT NULL,
	[AlternateContactPersonID] [int] NOT NULL,
	[DeliveryMethodID] [int] NULL,
	[DeliveryCityID] [int] NOT NULL,
	[PostalCityID] [int] NOT NULL,
	[SupplierReference] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NULL,
	[BankAccountName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS MASKED WITH (FUNCTION = 'default()') NULL,
	[BankAccountBranch] [nvarchar](50) COLLATE Latin1_General_100_CI_AS MASKED WITH (FUNCTION = 'default()') NULL,
	[BankAccountCode] [nvarchar](20) COLLATE Latin1_General_100_CI_AS MASKED WITH (FUNCTION = 'default()') NULL,
	[BankAccountNumber] [nvarchar](20) COLLATE Latin1_General_100_CI_AS MASKED WITH (FUNCTION = 'default()') NULL,
	[BankInternationalCode] [nvarchar](20) COLLATE Latin1_General_100_CI_AS MASKED WITH (FUNCTION = 'default()') NULL,
	[PaymentDays] [int] NOT NULL,
	[InternalComments] [nvarchar](max) COLLATE Latin1_General_100_CI_AS NULL,
	[PhoneNumber] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[FaxNumber] [nvarchar](20) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[WebsiteURL] [nvarchar](256) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[DeliveryAddressLine1] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[DeliveryAddressLine2] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NULL,
	[DeliveryPostalCode] [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[DeliveryLocation] [geography] NULL,
	[PostalAddressLine1] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[PostalAddressLine2] [nvarchar](60) COLLATE Latin1_General_100_CI_AS NULL,
	[PostalPostalCode] [nvarchar](10) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Purchasing_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Purchasing_Suppliers_SupplierName] UNIQUE NONCLUSTERED 
(
	[SupplierName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Purchasing].[Suppliers_Archive] )
)
GO
ALTER TABLE [Purchasing].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Suppliers_AlternateContactPersonID_Application_People] FOREIGN KEY([AlternateContactPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[Suppliers] CHECK CONSTRAINT [FK_Purchasing_Suppliers_AlternateContactPersonID_Application_People]
GO
ALTER TABLE [Purchasing].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Suppliers_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[Suppliers] CHECK CONSTRAINT [FK_Purchasing_Suppliers_Application_People]
GO
ALTER TABLE [Purchasing].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Suppliers_DeliveryCityID_Application_Cities] FOREIGN KEY([DeliveryCityID])
REFERENCES [Application].[Cities] ([CityID])
GO

ALTER TABLE [Purchasing].[Suppliers] CHECK CONSTRAINT [FK_Purchasing_Suppliers_DeliveryCityID_Application_Cities]
GO
ALTER TABLE [Purchasing].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Suppliers_DeliveryMethodID_Application_DeliveryMethods] FOREIGN KEY([DeliveryMethodID])
REFERENCES [Application].[DeliveryMethods] ([DeliveryMethodID])
GO

ALTER TABLE [Purchasing].[Suppliers] CHECK CONSTRAINT [FK_Purchasing_Suppliers_DeliveryMethodID_Application_DeliveryMethods]
GO
ALTER TABLE [Purchasing].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Suppliers_PostalCityID_Application_Cities] FOREIGN KEY([PostalCityID])
REFERENCES [Application].[Cities] ([CityID])
GO

ALTER TABLE [Purchasing].[Suppliers] CHECK CONSTRAINT [FK_Purchasing_Suppliers_PostalCityID_Application_Cities]
GO
ALTER TABLE [Purchasing].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Suppliers_PrimaryContactPersonID_Application_People] FOREIGN KEY([PrimaryContactPersonID])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Purchasing].[Suppliers] CHECK CONSTRAINT [FK_Purchasing_Suppliers_PrimaryContactPersonID_Application_People]
GO
ALTER TABLE [Purchasing].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Purchasing_Suppliers_SupplierCategoryID_Purchasing_SupplierCategories] FOREIGN KEY([SupplierCategoryID])
REFERENCES [Purchasing].[SupplierCategories] ([SupplierCategoryID])
GO

ALTER TABLE [Purchasing].[Suppliers] CHECK CONSTRAINT [FK_Purchasing_Suppliers_SupplierCategoryID_Purchasing_SupplierCategories]
GO
ALTER TABLE [Purchasing].[Suppliers] ADD  CONSTRAINT [DF_Purchasing_Suppliers_SupplierID]  DEFAULT (NEXT VALUE FOR [Sequences].[SupplierID]) FOR [SupplierID]
GO
/****** Object:  Index [FK_Purchasing_Suppliers_AlternateContactPersonID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_AlternateContactPersonID] ON [Purchasing].[Suppliers]
(
	[AlternateContactPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_Suppliers_DeliveryCityID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_DeliveryCityID] ON [Purchasing].[Suppliers]
(
	[DeliveryCityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_Suppliers_DeliveryMethodID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_DeliveryMethodID] ON [Purchasing].[Suppliers]
(
	[DeliveryMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_Suppliers_PostalCityID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_PostalCityID] ON [Purchasing].[Suppliers]
(
	[PostalCityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_Suppliers_PrimaryContactPersonID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_PrimaryContactPersonID] ON [Purchasing].[Suppliers]
(
	[PrimaryContactPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
/****** Object:  Index [FK_Purchasing_Suppliers_SupplierCategoryID]    Script Date: 10/06/2020 18:14:17 ******/
CREATE NONCLUSTERED INDEX [FK_Purchasing_Suppliers_SupplierCategoryID] ON [Purchasing].[Suppliers]
(
	[SupplierCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a supplier within the database' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier''s full name (usually a trading name)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'SupplierName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier''s category' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'SupplierCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Primary contact' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'PrimaryContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Alternate contact' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'AlternateContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Standard delivery method for stock items received from this supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'DeliveryMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the delivery city for this address' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'DeliveryCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'ID of the mailing city for this address' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'PostalCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier reference for our organization (might be our account number at the supplier)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'SupplierReference'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier''s bank account name (ie name on the account)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'BankAccountName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier''s bank branch' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'BankAccountBranch'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier''s bank account code (usually a numeric reference for the bank branch)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'BankAccountCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier''s bank account number' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'BankAccountNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Supplier''s bank''s international code (such as a SWIFT code)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'BankInternationalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Number of days for payment of an invoice (ie payment terms)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'PaymentDays'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Internal comments (not exposed outside organization)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'InternalComments'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Phone number' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'PhoneNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Fax number  ' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'FaxNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'URL for the website for this supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'WebsiteURL'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First delivery address line for the supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'DeliveryAddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Second delivery address line for the supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'DeliveryAddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Delivery postal code for the supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'DeliveryPostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Geographic location for the supplier''s office/warehouse' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'DeliveryLocation'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'First postal address line for the supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'PostalAddressLine1'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Second postal address line for the supplier' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'PostalAddressLine2'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Postal code for the supplier when sending by mail' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'PostalPostalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'FK_Purchasing_Suppliers_AlternateContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'FK_Purchasing_Suppliers_DeliveryCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'FK_Purchasing_Suppliers_DeliveryMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'FK_Purchasing_Suppliers_PostalCityID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'FK_Purchasing_Suppliers_PrimaryContactPersonID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Auto-created to support a foreign key' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'FK_Purchasing_Suppliers_SupplierCategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Main entity table for suppliers (organizations)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Suppliers'