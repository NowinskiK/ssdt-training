CREATE TABLE [dbo].[DimProductCategory] (
    [ProductCategoryKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ProductCategoryLabel]       NVARCHAR (100) NULL,
    [ProductCategoryName]        NVARCHAR (30)  NOT NULL,
    [ProductCategoryDescription] NVARCHAR (50)  NOT NULL,
    [ETLLoadID]                  INT            NULL,
    [LoadDate]                   DATETIME       NULL,
    [UpdateDate]                 DATETIME       NULL,
    CONSTRAINT [PK_DimProductCategory_ProductCategoryKey] PRIMARY KEY CLUSTERED ([ProductCategoryKey] ASC),
    CONSTRAINT [AK_DimProductCategory_ProductCategoryLabel] UNIQUE NONCLUSTERED ([ProductCategoryLabel] ASC)
);

