
CREATE PROCEDURE [Application].Configuration_ApplyPolybase
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    IF SERVERPROPERTY(N'IsPolybaseInstalled') = 0
    BEGIN
        PRINT N'Warning: Either Polybase cannot be created on this edition or it has not been installed.';
	END ELSE BEGIN -- if installed
		IF (SELECT value FROM sys.configurations WHERE name = 'hadoop connectivity') NOT IN (1, 4, 7)
		BEGIN
	        PRINT N'Warning: Hadoop connectivity has not been enabled. It must be set to 1, 4, or 7 for Azure Storage connectivity.';
		END ELSE BEGIN -- if Polybase can be created

			DECLARE @SQL nvarchar(max) = N'';

			BEGIN TRY

				SET @SQL = N'
CREATE EXTERNAL DATA SOURCE AzureStorage
WITH
(
	TYPE=HADOOP, LOCATION = ''wasbs://data@sqldwdatasets.blob.core.windows.net''
);';
				EXECUTE (@SQL);

				SET @SQL = N'
CREATE EXTERNAL FILE FORMAT CommaDelimitedTextFileFormat
WITH
(
	FORMAT_TYPE = DELIMITEDTEXT,
	FORMAT_OPTIONS
	(
		FIELD_TERMINATOR = '',''
	)
);';
				EXECUTE (@SQL);

				SET @SQL = N'
CREATE EXTERNAL TABLE dbo.CityPopulationStatistics
(
	CityID int NOT NULL,
	StateProvinceCode nvarchar(5) NOT NULL,
	CityName nvarchar(50) NOT NULL,
	YearNumber int NOT NULL,
	LatestRecordedPopulation bigint NULL
)
WITH
(
	LOCATION = ''/'',
	DATA_SOURCE = AzureStorage,
	FILE_FORMAT = CommaDelimitedTextFileFormat,
	REJECT_TYPE = VALUE,
	REJECT_VALUE = 4 -- skipping 1 header row per file
);';
				EXECUTE (@SQL);

	        END TRY
			BEGIN CATCH
				PRINT N'Unable to apply Polybase connectivity to Azure storage';
				THROW;
			END CATCH;
		END; -- if connectivity enabled
    END; -- of Polybase is allowed and installed
END;