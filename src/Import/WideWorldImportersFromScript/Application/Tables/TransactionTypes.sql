CREATE TABLE [Application].[TransactionTypes](
	[TransactionTypeID] [int] NOT NULL,
	[TransactionTypeName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
 CONSTRAINT [PK_Application_TransactionTypes] PRIMARY KEY CLUSTERED 
(
	[TransactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
 CONSTRAINT [UQ_Application_TransactionTypes_TransactionTypeName] UNIQUE NONCLUSTERED 
(
	[TransactionTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[TransactionTypes_Archive] )
)
GO
ALTER TABLE [Application].[TransactionTypes]  WITH CHECK ADD  CONSTRAINT [FK_Application_TransactionTypes_Application_People] FOREIGN KEY([LastEditedBy])
REFERENCES [Application].[People] ([PersonID])
GO

ALTER TABLE [Application].[TransactionTypes] CHECK CONSTRAINT [FK_Application_TransactionTypes_Application_People]
GO
ALTER TABLE [Application].[TransactionTypes] ADD  CONSTRAINT [DF_Application_TransactionTypes_TransactionTypeID]  DEFAULT (NEXT VALUE FOR [Sequences].[TransactionTypeID]) FOR [TransactionTypeID]
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Numeric ID used for reference to a transaction type within the database' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'TransactionTypes', @level2type=N'COLUMN',@level2name=N'TransactionTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of the transaction type' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'TransactionTypes', @level2type=N'COLUMN',@level2name=N'TransactionTypeName'
GO
EXEC sys.sp_addextendedproperty @name=N'Description', @value=N'Types of customer, supplier, or stock transactions (ie: invoice, credit note, etc.)' , @level0type=N'SCHEMA',@level0name=N'Application', @level1type=N'TABLE',@level1name=N'TransactionTypes'