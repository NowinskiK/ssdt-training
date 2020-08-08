CREATE TABLE [Integration].[Employee_Staging] (
    [Employee Staging Key] INT             IDENTITY (1, 1) NOT NULL,
    [WWI Employee ID]      INT             NOT NULL,
    [Employee]             NVARCHAR (50)   NOT NULL,
    [Preferred Name]       NVARCHAR (50)   NOT NULL,
    [Is Salesperson]       BIT             NOT NULL,
    [Photo]                VARBINARY (MAX) NULL,
    [Valid From]           DATETIME2 (7)   NOT NULL,
    [Valid To]             DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_Integration_Employee_Staging] PRIMARY KEY CLUSTERED ([Employee Staging Key] ASC) ON [USERDATA]
) ON [USERDATA] TEXTIMAGE_ON [USERDATA];


GO
CREATE NONCLUSTERED INDEX [IX_Integration_Employee_Staging_WWI_Employee_ID]
    ON [Integration].[Employee_Staging]([WWI Employee ID] ASC)
    ON [USERDATA];


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Allows quickly locating by WWI Employee ID', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'INDEX', @level2name = N'IX_Integration_Employee_Staging_WWI_Employee_ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Employee staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Row ID within the staging table', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'Employee Staging Key';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Numeric ID (PersonID) in the WWI database', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'WWI Employee ID';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Full name for this person', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'Employee';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Name that this person prefers to be called', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'Preferred Name';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Is this person a staff salesperson?', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'Is Salesperson';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Photo of this person', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'Photo';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid from this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'Valid From';


GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = 'Valid until this date and time', @level0type = N'SCHEMA', @level0name = N'Integration', @level1type = N'TABLE', @level1name = N'Employee_Staging', @level2type = N'COLUMN', @level2name = N'Valid To';

