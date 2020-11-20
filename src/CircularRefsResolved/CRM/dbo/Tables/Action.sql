CREATE TABLE [dbo].[Action] (
    [ActionId]   TINYINT      IDENTITY (1, 1) NOT NULL,
    [ActionName] VARCHAR (50) NULL,
    [UpdatedOn]  DATETIME     NULL,
    [UpdatedBy]  VARCHAR (50) NULL,
    CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED ([ActionId] ASC)
);

