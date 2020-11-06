CREATE PROCEDURE dbo.PopulateAction
AS
/*
	Scripted data for table: [dbo].[Action]
*/
SET IDENTITY_INSERT [dbo].[Action] ON;

;WITH cte_data 
as (SELECT [ActionId], [ActionName], [UpdatedOn], [UpdatedBy] FROM 
(VALUES
	  (1,	'View',		null,	null)
	, (2,	'Add',		null,	null)
	, (3,	'Edit',		null,	null)
	, (4,	'Delete',	null,	null)
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
