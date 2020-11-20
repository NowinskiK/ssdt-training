CREATE TABLE [dbo].[FactITMachine] (
    [ITMachinekey] INT            IDENTITY (1, 1) NOT NULL,
    [MachineKey]   INT            NOT NULL,
    [Datekey]      DATETIME       NOT NULL,
    [CostAmount]   MONEY          NULL,
    [CostType]     NVARCHAR (200) NOT NULL,
    [ETLLoadID]    INT            NULL,
    [LoadDate]     DATETIME       NULL,
    [UpdateDate]   DATETIME       NULL,
    CONSTRAINT [PK_FactITMachine] PRIMARY KEY CLUSTERED ([ITMachinekey] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_FactITMachine_DimDate] FOREIGN KEY ([Datekey]) REFERENCES [dbo].[DimDate] ([Datekey]),
    CONSTRAINT [FK_FactITMachine_DimMachine] FOREIGN KEY ([MachineKey]) REFERENCES [dbo].[DimMachine] ([MachineKey])
);

