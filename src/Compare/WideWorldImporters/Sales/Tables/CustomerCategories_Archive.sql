CREATE TABLE [Sales].[CustomerCategories_Archive] (
    [CustomerCategoryID]   INT           NOT NULL,
    [CustomerCategoryName] NVARCHAR (50) NOT NULL,
    [LastEditedBy]         INT           NOT NULL,
    [ValidFrom]            DATETIME2 (7) NOT NULL,
    [ValidTo]              DATETIME2 (7) NOT NULL
) ON [USERDATA];


GO
CREATE CLUSTERED INDEX [ix_CustomerCategories_Archive]
    ON [Sales].[CustomerCategories_Archive]([ValidTo] ASC, [ValidFrom] ASC)
    ON [USERDATA];

