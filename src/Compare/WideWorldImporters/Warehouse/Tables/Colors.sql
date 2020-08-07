CREATE TABLE [Warehouse].[Colors] (
    [ColorID]      INT                                         CONSTRAINT [DF_Warehouse_Colors_ColorID] DEFAULT (NEXT VALUE FOR [Sequences].[ColorID]) NOT NULL,
    [ColorName]    NVARCHAR (20)                               NOT NULL,
    [LastEditedBy] INT                                         NOT NULL,
    [ValidFrom]    DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]      DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Warehouse_Colors] PRIMARY KEY CLUSTERED ([ColorID] ASC) ON [USERDATA],
    CONSTRAINT [FK_Warehouse_Colors_Application_People] FOREIGN KEY ([LastEditedBy]) REFERENCES [Application].[People] ([PersonID]),
    CONSTRAINT [UQ_Warehouse_Colors_ColorName] UNIQUE NONCLUSTERED ([ColorName] ASC) ON [USERDATA],
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [USERDATA]
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Warehouse].[Colors_Archive], DATA_CONSISTENCY_CHECK=ON));


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Stock items can (optionally) have colors', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'Colors';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID used for reference to a color within the database', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'Colors', @level2type = N'COLUMN', @level2name = N'ColorID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name of a color that can be used to describe stock items', @level0type = N'SCHEMA', @level0name = N'Warehouse', @level1type = N'TABLE', @level1name = N'Colors', @level2type = N'COLUMN', @level2name = N'ColorName';

