CREATE TABLE [dbo].[DimProductSubcategory] (
    [ProductSubcategoryKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ProductSubcategoryLabel]       NVARCHAR (100) NULL,
    [ProductSubcategoryName]        NVARCHAR (50)  NOT NULL,
    [ProductSubcategoryDescription] NVARCHAR (100) NULL,
    [ProductCategoryKey]            INT            NULL,
    [ETLLoadID]                     INT            NULL,
    [LoadDate]                      DATETIME       NULL,
    [UpdateDate]                    DATETIME       NULL,
    CONSTRAINT [PK_DimProductSubcategory_ProductSubcategoryKey] PRIMARY KEY CLUSTERED ([ProductSubcategoryKey] ASC),
    CONSTRAINT [FK_DimProductSubcategory_DimProductCategory] FOREIGN KEY ([ProductCategoryKey]) REFERENCES [dbo].[DimProductCategory] ([ProductCategoryKey]),
    CONSTRAINT [AK_DimProductSubcategory_ProductSubcategoryLabel] UNIQUE NONCLUSTERED ([ProductSubcategoryLabel] ASC)
);

