CREATE TABLE [dbo].[FactITSLA] (
    [ITSLAkey]        INT      IDENTITY (1, 1) NOT NULL,
    [DateKey]         DATETIME NOT NULL,
    [StoreKey]        INT      NOT NULL,
    [MachineKey]      INT      NOT NULL,
    [OutageKey]       INT      NOT NULL,
    [OutageStartTime] DATETIME NOT NULL,
    [OutageEndTime]   DATETIME NOT NULL,
    [DownTime]        INT      NOT NULL,
    [ETLLoadID]       INT      NULL,
    [LoadDate]        DATETIME NULL,
    [UpdateDate]      DATETIME NULL,
    CONSTRAINT [PK_FactITSLA_ITSLAKey] PRIMARY KEY CLUSTERED ([ITSLAkey] ASC),
    CONSTRAINT [FK_FactITSLA_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([Datekey]),
    CONSTRAINT [FK_FactITSLA_DimMachine] FOREIGN KEY ([MachineKey]) REFERENCES [dbo].[DimMachine] ([MachineKey]),
    CONSTRAINT [FK_FactITSLA_DimOutage] FOREIGN KEY ([OutageKey]) REFERENCES [dbo].[DimOutage] ([OutageKey]),
    CONSTRAINT [FK_FactITSLA_DimStore] FOREIGN KEY ([StoreKey]) REFERENCES [dbo].[DimStore] ([StoreKey])
);

