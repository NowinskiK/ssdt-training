sqlpackage.exe

REM "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150\sqlpackage.exe"
cd "\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150\"

cls
sqlpackage.exe

sqlpackage.exe /?

REM ## INIT Variables ##
set sqlpackage="C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150\sqlpackage.exe"
echo SqlPackage location: %sqlpackage%

REM ## VERSION of SqlPackage.exe ##
SET prgtmp=%sqlpackage:\=\\%
echo This DacFX will be used: %sqlpackage%
WMIC DATAFILE WHERE name=%prgtmp% get Version /format:Textvaluelist

REM ## Simple PUBLISH action ##
%sqlpackage%

cls
set dacpac="C:\GIT\NowinskiK\ssdt-training\src\sqlpackage\WideWorldImporters\bin\Debug\WideWorldImporters.dacpac"
%sqlpackage% /Action:Publish
%sqlpackage% /Action:Publish /SourceFile:%dacpac%

%sqlpackage% /Action:Publish /SourceFile:%dacpac% /TargetServerName:DEV19 /TargetDatabaseName:WideWorldImportersNEW2

%sqlpackage% /Action:Publish /SourceFile:%dacpac% /TargetServerName:DEV19 /TargetDatabaseName:WideWorldImportersNEW2 /p:DropIndexesNotInSource=True

cls
set profile = "C:\GIT\NowinskiK\ssdt-training\src\sqlpackage\WideWorldImporters\WideWorldImportersNew.publish.xml"
%sqlpackage% /Action:Publish /SourceFile:%dacpac% /Profile:%profile%


%sqlpackage% /Action:Publish /SourceFile:%dacpac% /Profile:%profile% /TargetDatabaseName:WideWorldImportersNEW3



