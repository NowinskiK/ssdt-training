###
#   Deploy Script & Deploy Report
###

Clear-Host
$sqlpackage = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150\sqlpackage.exe"
Set-Location "C:\GIT\NowinskiK\ssdt-training\src\sqlpackage\WideWorldImporters"

$dbName = "WideWorldImporters"
$dbpath = (Get-Location)
$dacpac = Join-Path -Path $dbpath -ChildPath "bin\Debug\$dbName.dacpac"
Write-Host "DacPac file path: $dacpac"

& $sqlpackage 

#
# Another 2 popular options:
#
& $sqlpackage /Action:DeployReport
& $sqlpackage /Action:Script


#
# Generate REPORT 
#



# New database (new4)
Clear-Host
$nowf = Get-Date -Format "yyyyMMddTHHmmss"
$outputFolder = Split-Path (Get-Location) -Parent | Join-Path -ChildPath "output"
New-Item -Path $outputFolder -ItemType Directory -ErrorAction:Ignore
$targetDb = "WideWorldImportersNew4"
$outputReportFile = "report-$nowf-$targetDb.xml"
$outputReportPath = Join-Path $outputFolder $outputReportFile
$publishProfile = Join-Path -Path $dbpath -ChildPath "WideWorldImportersNew.publish.xml"
& $sqlpackage /Action:DeployReport `
    /SourceFile:$dacpac /Profile:$publishProfile /TargetDatabaseName:$targetDb `
    /OutputPath:$outputReportPath








# Existing database (new3)

# Add new index on target database first

Clear-Host
$nowf = Get-Date -Format "yyyyMMddTHHmmss"
$targetDb = "WideWorldImportersNew3"
$outputReportFile = "report-$nowf-$targetDb.xml"
$outputReportPath = Join-Path $outputFolder $outputReportFile
$publishProfile = Join-Path -Path $dbpath -ChildPath "WideWorldImportersNew.publish.xml"
& $sqlpackage /Action:DeployReport `
    /SourceFile:$dacpac /Profile:$publishProfile /TargetDatabaseName:$targetDb `
    /OutputPath:$outputReportPath








#
# Generate SCRIPT as well
#

$nowf = Get-Date -Format "yyyyMMddTHHmmss"
$outputScriptFile = "script-$nowf-$targetDb.sql"
$outputScriptPath = Join-Path $outputFolder $outputScriptFile

& $sqlpackage /Action:Script `
    /SourceFile:$dacpac /Profile:$publishProfile /TargetDatabaseName:$targetDb `
    /OutputPath:$outputScriptPath




