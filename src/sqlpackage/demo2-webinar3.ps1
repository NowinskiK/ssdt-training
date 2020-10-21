Clear-Host

$sqlpackage = "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150\sqlpackage.exe"
Set-Location "C:\GIT\NowinskiK\ssdt-training\src\sqlpackage\WideWorldImporters"

$dbName = "WideWorldImporters"
$dbpath = (Get-Location)
$dacpac = Join-Path -Path $dbpath -ChildPath "bin\Debug\$dbName.dacpac"


& $sqlpackage 

& $sqlpackage /Action:Publish







Clear-Host
& $sqlpackage /Action:Publish /SourceFile:$dacpac /TargetServerName:DEV19 /TargetDatabaseName:WideWorldImportersNew2








& $sqlpackage /Action:Publish /SourceFile:$dacpac /TargetServerName:DEV19 /TargetDatabaseName:WideWorldImportersNew2 /p:DropIndexesNotInSource=True








## PUBLISH action with Publish Profile ##
$publishProfile = Join-Path -Path $dbpath -ChildPath "WideWorldImportersNew.publish.xml"

## ... and let's parametrise it
$TargetDb = "WideWorldImportersNew3"
$arg1 = "/Action:Publish"
$arg2 = "/SourceFile:$dacpac" 
$arg3 = "/Profile:$publishProfile"
$arg4 = "/TargetDatabaseName:$TargetDb"
 
& $sqlpackage $arg1 $arg2 $arg3 $arg4 





