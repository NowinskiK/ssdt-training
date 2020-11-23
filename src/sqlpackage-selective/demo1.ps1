
Clear-Host

$exe = "sqlpackage.exe"
Get-ChildItem -Path "C:\Program Files (x86)\Microsoft Visual Studio\" -Filter "$exe" -Recurse:$true

$dacpath = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150"
$sqlpackage = "$dacpath\$exe"

$dbName = "WideWorldImporters"
$dbpath = "C:\GIT\NowinskiK\ssdt-training\src\sqlpackage-selective\WideWorldImporters"
$dacpac = Join-Path -Path $dbpath -ChildPath "bin\Debug\$dbName.dacpac"

# src: https://github.com/GoEddie/DeploymentContributorFilterer/
# Basic Usage
# Download the latest release from Github or build yourself. Put the AgileSqlClub.SqlPackageFilter.dll file into the same folder as SqlPackage.exe, and add these commmand line parameters to your deployment:
#       /p:AdditionalDeploymentContributors=AgileSqlClub.DeploymentFilterContributor 
#       /p:AdditionalDeploymentContributorArguments="SqlPackageFilter=IgnoreSchema(BLAH)"
# This will neither deploy, drop or alter anything in the BLAH schema.






# Preparing: Copy DLL
Copy-Item -Path ".\DeploymentContributor\*.dll" -Destination $dacpath
Get-ChildItem $dacpath






# Test: Deploy ignoring all objects in Integration schema
Clear-Host
$targetDb = "WideWorldImportersFiltered"
$arg1 = "/Action:Publish"
$arg2 = "/SourceFile:$dacpac" 
$arg3 = "/TargetDatabaseName:$targetDb"
$arg4 = "/TargetServerName:localhost"
$filterP1 = '/p:AdditionalDeploymentContributors=AgileSqlClub.DeploymentFilterContributor'
$filterP2 = '/p:AdditionalDeploymentContributorArguments="SqlPackageFilter=IgnoreSchema(Integration)"'
$params = @( $arg1, $arg2, $arg3, $arg4, $filterP1, $filterP2 )

& $sqlpackage $params



