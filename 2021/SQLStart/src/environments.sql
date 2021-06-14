IF NOT EXISTS(SELECT 1 FROM [SSISDB].[catalog].environments WHERE name = 'TEST')
BEGIN

	-- ENVIRONMENT
	EXEC [SSISDB].[catalog].[create_environment] 
		@environment_name=N'TEST',
		@environment_description=N'',
		@folder_name=N'SQLStart2021';

	-- VARIABLES
	DECLARE @var sql_variant = N'sqlstart2021.database.windows.net'
	EXEC [SSISDB].[catalog].[create_environment_variable] 
		@variable_name=N'SQLServer', 
		@sensitive=0, 
		@description=N'Server name', 
		@environment_name=N'TEST', 
		@folder_name=N'SQLStart2021', 
		@value=@var, 
		@data_type=N'String';

	SET @var = N'suxadmin'
	EXEC [SSISDB].[catalog].[create_environment_variable] 
		@variable_name=N'SQLUsername', 
		@sensitive=0, 
		@description=N'SQL Login username', 
		@environment_name=N'TEST', 
		@folder_name=N'SQLStart2021', 
		@value=@var, 
		@data_type=N'String';

	SET @var = N'Elys01!.'
	EXEC [SSISDB].[catalog].[create_environment_variable] 
		@variable_name=N'SQLPassword', 
		@sensitive=1, 
		@description=N'SQL Login password', 
		@environment_name=N'TEST', 
		@folder_name=N'SQLStart2021', 
		@value=@var, 
		@data_type=N'String';

	SET @var = N'DataSource=sqlstart2021.database.windows.net;Initial Catalog=SQLStart2021;'
	EXEC [SSISDB].[catalog].[create_environment_variable] 
		@variable_name=N'SQLConnectionString', 
		@sensitive=0, 
		@description=N'The whole connection string', 
		@environment_name=N'TEST', 
		@folder_name=N'SQLStart2021', 
		@value=@var, 
		@data_type=N'String';

	-- CONFIGURATION MAPPINGS
	Declare @reference_id bigint
	EXEC [SSISDB].[catalog].[create_environment_reference] 
		@environment_name=N'TEST', 
		@environment_folder_name=N'SQLStart2021', 
		@reference_id=@reference_id OUTPUT, 
		@project_name=N'SQLStart2021', 
		@folder_name=N'SQLStart2021', 
		@reference_type=A;

	EXEC [SSISDB].[catalog].[set_object_parameter_value] 
		@object_type=30, 
		@parameter_name=N'CM..\MSSQL2016.SQLStart2021.ConnectionString', 
		@object_name=N'Package.dtsx', 
		@folder_name=N'SQLStart2021', 
		@project_name=N'SQLStart2021', 
		@value_type=R, 
		@parameter_value=N'SQLConnectionString';

	EXEC [SSISDB].[catalog].[set_object_parameter_value] 
		@object_type=30, 
		@parameter_name=N'CM..\MSSQL2016.SQLStart2021.InitialCatalog', 
		@object_name=N'Package.dtsx', 
		@folder_name=N'SQLStart2021', 
		@project_name=N'SQLStart2021', 
		@value_type=R, 
		@parameter_value=N'SQLDatabasename';

	EXEC [SSISDB].[catalog].[set_object_parameter_value] 
		@object_type=30, 
		@parameter_name=N'CM..\MSSQL2016.SQLStart2021.Password', 
		@object_name=N'Package.dtsx', 
		@folder_name=N'SQLStart2021', 
		@project_name=N'SQLStart2021', 
		@value_type=R, 
		@parameter_value=N'SQLPassword';

	EXEC [SSISDB].[catalog].[set_object_parameter_value] 
		@object_type=30, 
		@parameter_name=N'CM..\MSSQL2016.SQLStart2021.ServerName', 
		@object_name=N'Package.dtsx', 
		@folder_name=N'SQLStart2021', 
		@project_name=N'SQLStart2021', 
		@value_type=R, 
		@parameter_value=N'SQLServer';

	EXEC [SSISDB].[catalog].[set_object_parameter_value] 
		@object_type=30, 
		@parameter_name=N'CM..\MSSQL2016.SQLStart2021.UserName', 
		@object_name=N'Package.dtsx', 
		@folder_name=N'SQLStart2021', 
		@project_name=N'SQLStart2021', 
		@value_type=R, 
		@parameter_value=N'SQLUsername';
END;