-- =============================================
-- Author:		Kamil Nowinski
-- Create date: 30/09/2017
-- Description:	Populate DimChannel from OLTP.
-- =============================================
CREATE PROCEDURE dbo.Populate_DimChannel_from_CRM
AS
BEGIN

PRINT 'Disable trigger'
--Error: Following statement is not understanding by SSDT
--ALTER TABLE [$(ContosoRetailDW)].dbo.DimChannel DISABLE TRIGGER dbo.Trigger_DimChannel;

/*
   1. DO some updates or other actions
   2. Enable the trigger again
*/


END
