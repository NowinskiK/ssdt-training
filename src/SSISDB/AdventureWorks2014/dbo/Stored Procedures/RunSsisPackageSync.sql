﻿CREATE PROCEDURE [dbo].[RunSsisPackageSync]
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

	-- System parameters
	EXEC [$(SSISDB)].[catalog].[set_execution_parameter_value] 
		  @execution_id
		, @object_type = 50						-- System parameter
		, @parameter_name = N'SYNCHRONIZED'
		, @parameter_value = 1

	-- Execute the package
	EXEC [$(SSISDB)].[catalog].[start_execution] @execution_id

RETURN 0
