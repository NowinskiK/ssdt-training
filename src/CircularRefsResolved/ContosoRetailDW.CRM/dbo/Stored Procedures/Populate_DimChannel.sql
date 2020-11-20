-- =============================================
-- Author:		Kamil Nowinski
-- Create date: 30/09/2017
-- Description:	Populate DimChannel from OLTP.
-- =============================================
CREATE PROCEDURE dbo.Populate_DimChannel
AS
BEGIN
	SET NOCOUNT ON;

-- ==================================================
-- Slowly Changing Dimension script by SCD Merge Wizard
-- Author: Miljan Radovic
-- Official web site: https://github.com/SQLPlayer/SCD-Merge-Wizard/
-- Version: 4.2.0.0
-- Publish date: 13/08/2017 02:40:56
-- Script creation date: 30/09/2017 23:41:29
-- ==================================================

-- ==================================================
-- USER VARIABLES
-- ==================================================
DECLARE @CurrentDateTime datetime

SELECT
	@CurrentDateTime = cast(getdate() as datetime)

--ALTER TABLE dbo.DimChannel DISABLE TRIGGER [Trigger_DimChannel];
-- ==================================================
-- SCD1
-- ==================================================
MERGE [dbo].[DimChannel] as [target]
USING
(
	SELECT
		[Description],
		[ChannelId],
		[Label],
		[Name]
	FROM [$(CRM)].[dbo].[Channel]
) as [source]
ON
(
	[source].[ChannelId] = [target].[ChannelKey]
)

WHEN MATCHED AND
(
	([source].[Description] <> [target].[ChannelDescription] OR ([source].[Description] IS NULL AND [target].[ChannelDescription] IS NOT NULL) OR ([source].[Description] IS NOT NULL AND [target].[ChannelDescription] IS NULL)) OR
	([source].[Label] <> [target].[ChannelLabel] OR ([source].[Label] IS NULL AND [target].[ChannelLabel] IS NOT NULL) OR ([source].[Label] IS NOT NULL AND [target].[ChannelLabel] IS NULL)) OR
	([source].[Name] <> [target].[ChannelName] OR ([source].[Name] IS NULL AND [target].[ChannelName] IS NOT NULL) OR ([source].[Name] IS NOT NULL AND [target].[ChannelName] IS NULL))
)
THEN UPDATE
SET
	[target].[ChannelDescription] = [source].[Description],
	[target].[ChannelLabel] = [source].[Label],
	[target].[ChannelName] = [source].[Name],
	[target].[ETLLoadID] = [target].[ETLLoadID] + 1,
	[target].[UpdateDate] = @CurrentDateTime

WHEN NOT MATCHED BY TARGET
THEN INSERT
(

	[ChannelDescription],
	[ChannelKey],
	[ChannelLabel],
	[ChannelName],
	[ETLLoadID],
	[LoadDate],
	[UpdateDate]
)
VALUES
(
	[source].[Description],
	[source].[ChannelId],
	[source].[Label],
	[source].[Name],
	1,
	@CurrentDateTime,
	@CurrentDateTime
);

END
