CREATE TABLE [Application].[PaymentMethods](
	[PaymentMethodID] [int] NOT NULL,
	[PaymentMethodName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_PaymentMethods_PaymentMethodName] UNIQUE NONCLUSTERED 
(
	[PaymentMethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[PaymentMethods_Archive] )
)
GO
ALTER TABLE [Application].[PaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_Application_PaymentMethods_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[PaymentMethods] CHECK CONSTRAINT [FK_Application_PaymentMethods_Application_People]
GO
ALTER TABLE [Application].[PaymentMethods] ADD  CONSTRAINT [DF_Application_PaymentMethods_PaymentMethodID]  DEFAULT (NEXT VALUE FOR [Sequences].[PaymentMethodID]) FOR [PaymentMethodID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a payment type within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'PaymentMethods', @level2type=N'COLUMN',@level2name=N'PaymentMethodID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of ways that customers can make payments or that suppliers can be paid' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'PaymentMethods', @level2type=N'COLUMN',@level2name=N'PaymentMethodName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Ways that payments can be made (ie: cash, check, EFT, etc.' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'PaymentMethods'