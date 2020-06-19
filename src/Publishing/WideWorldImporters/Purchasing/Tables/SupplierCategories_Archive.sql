CREATE TABLE [Purchasing].[SupplierCategories_Archive] (
    [SupplierCategoryID]   INT           NOT NULL,
    [SupplierCategoryName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]         INT           NOT NULL,
    [ValidFrom]            DATETIME2 (7) NOT NULL,
    [ValidTo]              DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_SupplierCategories_Archive]
    ON [Purchasing].[SupplierCategories_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

