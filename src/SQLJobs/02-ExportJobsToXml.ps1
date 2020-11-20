Clear-Host    #cls
#Import-Module .\ps_module\salt -Force
Add-Type -Path "C:\Program Files\Microsoft SQL Server\140\SDK\Assemblies\Microsoft.SqlServer.Smo.dll"

$SqlConnectionString = "data source = .; initial catalog = master; trusted_connection = true;"
$SqlConnection = Connect-SqlConnection -ConnectionString $SqlConnectionString
#Remove-Item c:\reports\*
#Get-SqlAgentAsXml -SqlServer $SqlConnection -filePath ".\"

# Relative target path
$targetPath = ".\SQLServer\SQLJobs"
#Remove-Item "$targetPath\*.xml"

# Script all SQL Jobs
Get-SqlAgentAsXml -SqlServer $SqlConnection -filePath "$targetPath"

# or script selected SQL Jobs
Get-SqlAgentAsXml -SqlServer $SqlConnection -filePath "$targetPath" -JobName "PopulateData"



Disconnect-SqlConnection -SqlDisconnect $SqlConnection






# src: https://github.com/sabinio/salt

