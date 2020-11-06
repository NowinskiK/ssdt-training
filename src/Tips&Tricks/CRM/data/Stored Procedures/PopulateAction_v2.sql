CREATE PROCEDURE [data].[PopulateAction_v2]
AS
SET IDENTITY_INSERT [dbo].[Action] ON;

;WITH cte_data 
as (SELECT CAST([ActionId] as tinyint) as [ActionId], [ActionName], [UpdatedOn], [UpdatedBy] FROM 
(VALUES
	  (1,	'View',		GETDATE(),	null)
	, (2,	'Add',		GETDATE(),	null)
	, (3,	'Edit',		GETDATE(),	null)
	, (4,	'Delete',	GETDATE(),	null)
	, (5,	'Execute',	GETDATE(),	null)
) as v ([ActionId], [ActionName], [UpdatedOn], [UpdatedBy]) )

MERGE [dbo].[Action] as t
using cte_data as s
	ON t.[ActionId] = s.[ActionId]
WHEN NOT MATCHED BY target THEN
	INSERT ([ActionId], [ActionName], [UpdatedOn], [UpdatedBy])
	VALUES (s.[ActionId], s.[ActionName], s.[UpdatedOn], s.[UpdatedBy])
WHEN MATCHED THEN 
	UPDATE SET 
	[ActionName] = s.[ActionName], [UpdatedOn] = s.[UpdatedOn], [UpdatedBy] = s.[UpdatedBy]
WHEN NOT MATCHED BY source THEN
	DELETE
;

SET IDENTITY_INSERT [dbo].[Action] OFF;
