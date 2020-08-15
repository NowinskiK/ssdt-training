-- =========================================
--
-- Environment-specific post-deployment file
--
-- =========================================

IF ('$(EnvironmentCode)' = 'DEV') 
BEGIN
	PRINT '=== Environment: DEV ===';

	-- Script/logic for DEV environment only

END;
GO

IF ('$(EnvironmentCode)' = 'PROD') 
BEGIN
	PRINT '=== Environment: PROD ===';

	-- Script/logic for PROD environment only


	-- Additionaly (or as alternative) you can inject whole file(s):
:r ".\Script-PROD-only.sql"


END;
GO

