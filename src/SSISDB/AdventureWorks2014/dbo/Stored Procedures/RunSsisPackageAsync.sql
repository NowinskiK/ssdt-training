CREATE PROCEDURE [dbo].[RunSsisPackageAsync]
	@folderName SYSNAME,
	@projectName SYSNAME,
	@packageName SYSNAME
AS
	-- Create the execution object
	DECLARE @execution_id BIGINT
	EXEC [$(SSISDB)].[catalog].[create_execution] 
		  @package_name = @packageName
		, @project_name = @projectName
		, @folder_name  = @folderName
		, @use32bitruntime=False
		, @reference_id=NULL
		, @execution_id=@execution_id OUTPUT

	-- Execute the package
	EXEC [$(SSISDB)].[catalog].[start_execution] @execution_id

RETURN 0
