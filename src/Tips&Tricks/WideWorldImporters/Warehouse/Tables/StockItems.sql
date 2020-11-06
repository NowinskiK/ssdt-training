CREATE TABLE [Warehouse].[StockItems] (
    [StockItemID]            INT                                         CONSTRAINT [DF_Warehouse_StockItems_StockItemID] DEFAULT (NEXT VALUE FOR [Sequences].[StockItemID]) NOT NULL,
    [StockItemName]          NVARCHAR (100)                              NOT NULL,
    [SupplierID]             INT                                         NOT NULL,
    [ColorID]                INT                                         NULL,
    [UnitPackageID]          INT                                         NOT NULL,
    [OuterPackageID]         INT                                         NOT NULL,
    [Brand]                  NVARCHAR (50)                               NULL,
    [Size]                   NVARCHAR (20)                               NULL,
    [LeadTimeDays]           INT                                         NOT NULL,
    [QuantityPerOuter]       INT                                         NOT NULL,
    [IsChillerStock]         BIT                                         NOT NULL,
    [Barcode]                NVARCHAR (50)                               NULL,
    [TaxRate]                DECIMAL (18, 3)                             NOT NULL,
    [UnitPrice]              DECIMAL (18, 2)                             NOT NULL,
    [RecommendedRetailPrice] DECIMAL (18, 2)                             NULL,
    [TypicalWeightPerUnit]   DECIMAL (18, 3)                             NOT NULL,
    [MarketingComments]      NVARCHAR (MAX)                              NULL,
    [InternalComments]       NVARCHAR (MAX)                              NULL,
    [Photo]                  VARBINARY (MAX)                             NULL,
    [CustomFields]           NVARCHAR (MAX)                              NULL,
    [Tags]                   AS                                          (json_query([CustomFields],N'$.Tags')),
    [SearchDetails]          AS                                          (concat([StockItemName],N' ',[MarketingComments])),
    [LastEditedBy]           INT                                         NOT NULL,
    [ValidFrom]              DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]                DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Warehouse_StockItems] PRIMARY KEY CLUSTERED ([StockItemID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Warehouse_StockItems_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [FK_Warehouse_StockItems_ColorID_Warehouse_Colors] FOREIGN KEY ([ColorID]) REFERENCES [Warehouse].[Colors] ([ColorID]),
    CONSTRAINT [FK_Warehouse_StockItems_OuterPackageID_Warehouse_PackageTypes] FOREIGN KEY ([OuterPackageID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]),
    CONSTRAINT [FK_Warehouse_StockItems_SupplierID_Purchasing_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [Purchasing].[Suppliers] ([SupplierID]),
    CONSTRAINT [FK_Warehouse_StockItems_UnitPackageID_Warehouse_PackageTypes] FOREIGN KEY ([UnitPackageID]) REFERENCES [Warehouse].[PackageTypes] ([PackageTypeID]),
    CONSTRAINT [UQ_Warehouse_StockItems_StockItemName] UNIQUE NONCLUSTERED ([StockItemName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA] TEXTIMAGE_ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Warehouse].[StockItems_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_ColorID]
    ON [Warehouse].[StockItems]([ColorID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_OuterPackageID]
    ON [Warehouse].[StockItems]([OuterPackageID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_SupplierID]
    ON [Warehouse].[StockItems]([SupplierID] ASC)
    ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [FK_Warehouse_StockItems_UnitPackageID]
    ON [Warehouse].[StockItems]([UnitPackageID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItems_ColorID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItems_OuterPackageID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItems_SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Auto-created to support a foreign key', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'INDEX', @level2name = N'FK_Warehouse_StockItems_UnitPackageID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Main entity table for stock items', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a stock item within the database', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'StockItemID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of a stock item (but not a full description)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'StockItemName';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Usual supplier for this stock item', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'SupplierID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Color (optional) for this stock item', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'ColorID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Usual package for selling units of this stock item', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'UnitPackageID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Usual package for selling outers of this stock item (ie cartons, boxes, etc.)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'OuterPackageID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Brand for the stock item (if the item is branded)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'Brand';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Size of this item (eg: 100mm)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'Size';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Number of days typically taken from order to receipt of this stock item', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'LeadTimeDays';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Quantity of the stock item in an outer package', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'QuantityPerOuter';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Does this stock item need to be in a chiller?', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'IsChillerStock';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Barcode for this stock item', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'Barcode';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Tax rate to be applied', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'TaxRate';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Selling price (ex-tax) for one unit of this product', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'UnitPrice';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Recommended retail price for this stock item', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'RecommendedRetailPrice';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Typical weight for one unit of this product (packaged)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'TypicalWeightPerUnit';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Marketing comments for this stock item (shared outside the organization)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'MarketingComments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Internal comments (not exposed outside organization)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'InternalComments';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Photo of the product', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'Photo';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Custom fields added by system users', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'CustomFields';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Advertising tags associated with this stock item (JSON array retrieved from CustomFields)', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'Tags';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Combination of columns used by full text search', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'StockItems', @level2type = N'COLUMN', @level2name = N'SearchDetails';

