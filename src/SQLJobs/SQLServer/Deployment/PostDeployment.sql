/*
--------------------------------------------------------------------------------------
                       Post-Deployment Script : SQL Jobs
--------------------------------------------------------------------------------------
*/
USE [msdb]
GO

:r "..\SQLJobs\PopulateData.sql"
:r "..\SQLJobs\SyncCustomers.sql"

-- Please note, that I do not recoomend this method.
-- 

------------------------ End of SQL Jobs scripts -------------------------------------