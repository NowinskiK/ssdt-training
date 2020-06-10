CREATE TABLE [Purchasing].[SupplierCategories] (
    [SupplierCategoryID]   INT                                         CONSTRAINT [DF_Purchasing_SupplierCategories_SupplierCategoryID] DEFAULT (NEXT VALUE FOR [Sequences].[SupplierCategoryID]) NOT NULL,
    [SupplierCategoryName] NVARCHAR (50)                               NOT NULL,
    [LastEditedBy]         INT                                         NOT NULL,
    [ValidFrom]            DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]              DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Purchasing_SupplierCategories] PRIMARY KEY CLUSTERED ([SupplierCategoryID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Purchasing_SupplierCategories_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Purchasing_SupplierCategories_SupplierCategoryName] UNIQUE NONCLUSTERED ([SupplierCategoryName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Purchasing].[SupplierCategories_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Categories for suppliers (ie novelties, toys, clothing, packaging, etc.)', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierCategories';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a supplier category within the database', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierCategories', @level2type = N'COLUMN', @level2name = N'SupplierCategoryID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of the category that suppliers can be assigned to', @level0type = N'SCHEMA', @level0name = N'Purchasing', @level1type = N'TABLE', @level1name = N'SupplierCategories', @level2type = N'COLUMN', @level2name = N'SupplierCategoryName';

