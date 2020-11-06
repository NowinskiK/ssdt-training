-- =============================================
-- Author:		Kamil Nowinski
-- Create date: 30/09/2017
-- Description:	Populate DimChannel from OLTP.
-- =============================================
CREATE PROCEDURE dbo.Populate_DimChannel_from_CRM_v1
AS
BEGIN

PRINT 'Disable trigger'
--ALTER TABLE [$(ContosoRetailDW)].dbo.DimChannel DISABLE TRIGGER [Trigger_DimChannel];

--Alternative solution in SSDT:
EXEC sp_executeSQL N'ALTER TABLE [ContosoRetailDW].dbo.DimChannel 
		DISABLE TRIGGER [Trigger_DimChannel];
		'


/*
   1. DO some updates or other actions
   2. Enable the trigger again
*/


END
