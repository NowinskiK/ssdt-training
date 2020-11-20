CREATE TABLE [dbo].[DimPromotion] (
    [PromotionKey]         INT            IDENTITY (1, 1) NOT NULL,
    [PromotionLabel]       NVARCHAR (100) NULL,
    [PromotionName]        NVARCHAR (100) NULL,
    [PromotionDescription] NVARCHAR (255) NULL,
    [DiscountPercent]      FLOAT (53)     NULL,
    [PromotionType]        NVARCHAR (50)  NULL,
    [PromotionCategory]    NVARCHAR (50)  NULL,
    [StartDate]            DATETIME       NOT NULL,
    [EndDate]              DATETIME       NULL,
    [MinQuantity]          INT            NULL,
    [MaxQuantity]          INT            NULL,
    [ETLLoadID]            INT            NULL,
    [LoadDate]             DATETIME       NULL,
    [UpdateDate]           DATETIME       NULL,
    CONSTRAINT [PK_DimPromotion_PromotionKey] PRIMARY KEY CLUSTERED ([PromotionKey] ASC),
    CONSTRAINT [AK_DimPromotion_PromotionLabel] UNIQUE NONCLUSTERED ([PromotionLabel] ASC)
);

