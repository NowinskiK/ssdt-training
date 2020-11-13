CREATE TABLE [dbo].[DimMachine] (
    [MachineKey]         INT            NOT NULL,
    [MachineLabel]       NVARCHAR (100) NULL,
    [StoreKey]           INT            NOT NULL,
    [MachineType]        NVARCHAR (50)  NOT NULL,
    [MachineName]        NVARCHAR (100) NOT NULL,
    [MachineDescription] NVARCHAR (200) NOT NULL,
    [VendorName]         NVARCHAR (50)  NOT NULL,
    [MachineOS]          NVARCHAR (50)  NOT NULL,
    [MachineSource]      NVARCHAR (100) NOT NULL,
    [MachineHardware]    NVARCHAR (100) NULL,
    [MachineSoftware]    NVARCHAR (100) NOT NULL,
    [Status]             NVARCHAR (50)  NOT NULL,
    [ServiceStartDate]   DATETIME       NOT NULL,
    [DecommissionDate]   DATETIME       NULL,
    [LastModifiedDate]   DATETIME       NULL,
    [ETLLoadID]          INT            NULL,
    [LoadDate]           DATETIME       NULL,
    [UpdateDate]         DATETIME       NULL,
    CONSTRAINT [PK_DimMachine_MachineKey] PRIMARY KEY CLUSTERED ([MachineKey] ASC),
    CONSTRAINT [FK_DimMachine_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
);

