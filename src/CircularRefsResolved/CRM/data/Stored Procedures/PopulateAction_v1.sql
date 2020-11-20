CREATE PROCEDURE [data].[PopulateAction_v1]
AS

IF NOT EXISTS (SELECT 1 FROM [dbo].[Action])
BEGIN
	SET IDENTITY_INSERT [dbo].[Action] ON;

	INSERT INTO [dbo].[Action] 
		([ActionId], [ActionName], [UpdatedOn], [UpdatedBy])
	VALUES
		  (1,	'View',		GETDATE(),	null)
		, (2,	'Add',		GETDATE(),	null)
		, (3,	'Edit',		GETDATE(),	null)
		, (4,	'Delete',	GETDATE(),	null)
	;

	SET IDENTITY_INSERT [dbo].[Action] OFF;
END
