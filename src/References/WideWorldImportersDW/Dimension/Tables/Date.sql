CREATE TABLE [Dimension].[Date] (
    [Date]                  DATE          NOT NULL,
    [Day Number]            INT           NOT NULL,
    [Day]                   NVARCHAR (10) NOT NULL,
    [Month]                 NVARCHAR (10) NOT NULL,
    [Short Month]           NVARCHAR (3)  NOT NULL,
    [Calendar Month Number] INT           NOT NULL,
    [Calendar Month Label]  NVARCHAR (20) NOT NULL,
    [Calendar Year]         INT           NOT NULL,
    [Calendar Year Label]   NVARCHAR (10) NOT NULL,
    [Fiscal Month Number]   INT           NOT NULL,
    [Fiscal Month Label]    NVARCHAR (20) NOT NULL,
    [Fiscal Year]           INT           NOT NULL,
    [Fiscal Year Label]     NVARCHAR (10) NOT NULL,
    [ISO Week Number]       INT           NOT NULL,
    CONSTRAINT [PK_Dimension_Date] PRIMARY KEY CLUSTERED ([Date] ASC) ON [USERDATA]
) ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Date dimension', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'DW key for date dimension (actual date is used for key)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Date';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Day of the month', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Day Number';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Day name', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Day';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Month name (ie September)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Month';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Short month name (ie Sep)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Short Month';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Calendar month number', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Calendar Month Number';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Calendar month label (ie CY2015Jun)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Calendar Month Label';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Calendar year (ie 2015)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Calendar Year';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Calendar year label (ie CY2015)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Calendar Year Label';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Fiscal month number', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Fiscal Month Number';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Fiscal month label (ie FY2015Feb)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Fiscal Month Label';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Fiscal year (ie 2016)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Fiscal Year';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Fiscal year label (ie FY2015)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'Fiscal Year Label';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'ISO week number (ie 25)', @level0type = N'SCHEMA', @level0name = N'Dimension', @level1type = N'TABLE', @level1name = N'Date', @level2type = N'COLUMN', @level2name = N'ISO Week Number';

