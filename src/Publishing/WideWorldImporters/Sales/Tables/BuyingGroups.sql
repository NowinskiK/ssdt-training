CREATE TABLE [Sales].[BuyingGroups] (
    [BuyingGroupID]   INT                                         CONSTRAINT [DF_Sales_BuyingGroups_BuyingGroupID] DEFAULT (NEXT VALUE FOR [Sequences].[BuyingGroupID]) NOT NULL,
    [BuyingGroupName] NVARCHAR (50)                               NOT NULL,
    [LastEditedBy]    INT                                         NOT NULL,
    [ValidFrom]       DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]         DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Sales_BuyingGroups] PRIMARY KEY CLUSTERED ([BuyingGroupID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Sales_BuyingGroups_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Sales_BuyingGroups_BuyingGroupName] UNIQUE NONCLUSTERED ([BuyingGroupName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Sales].[BuyingGroups_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Customer organizations can be part of groups that exert greater buying power', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'BuyingGroups';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a buying group within the database', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'BuyingGroups', @level2type = N'COLUMN', @level2name = N'BuyingGroupID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of a buying group that customers can be members of', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'BuyingGroups', @level2type = N'COLUMN', @level2name = N'BuyingGroupName';

