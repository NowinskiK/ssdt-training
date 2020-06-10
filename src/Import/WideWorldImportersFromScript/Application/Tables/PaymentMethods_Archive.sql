CREATE TABLE [Application].[PaymentMethods_Archive](
	[PaymentMethodID] [int] NOT NULL,
	[PaymentMethodName] [nvarchar](50) COLLATE Latin1_General_100_CI_AS NOT NULL,
	[LastEditedBy] [int] NOT NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTo] [datetime2](7) NOT NULL
) ON [USERDATA]
GO
/****** Object:  Index [ix_PaymentMethods_Archive]    Script Date: 10/06/2020 18:14:16 ******/
CREATE CLUSTERED INDEX [ix_PaymentMethods_Archive] ON [Application].[PaymentMethods_Archive]
(
	[ValidTo] ASC,
	[ValidFrom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [USERDATA]