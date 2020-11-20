$DEV19 = "DEV19"
$RunAsAccount = ""
$ServerJobCategory = "[Uncategorized (Local)]"

#Import-Module .\ps_module\salt -Force
Add-Type -Path "C:\Program Files\Microsoft SQL Server\140\SDK\Assemblies\Microsoft.SqlServer.Smo.dll"
$SqlConnectionString = "data source = .; initial catalog = master; trusted_connection = true;"

$targetPath = ".\SQLServer\SQLJobs"
$JobManifestXmlFile = "$targetPath\PopulateData.xml"

$SqlConnection = Connect-SqlConnection -ConnectionString $SqlConnectionString
[xml] $_xml = [xml] (Get-Content -Path $JobManifestXmlFile)
$x = Get-Xml -XmlFile $_xml
Set-JobCategory -SqlServer $SqlConnection -root $x
Set-JobOperator -SqlServer $SqlConnection -root $x
$sqlAgentJob = Set-Job -SqlServer $SqlConnection -root $x
Set-JobSchedules -SqlServer $SqlConnection -root $x -job $SqlAgentJob
Set-JobSteps -SqlServer $SqlConnection -root $x -job $SqlAgentJob 

Disconnect-SqlConnection -SqlDisconnect $SqlConnection





# src: https://github.com/sabinio/salt
