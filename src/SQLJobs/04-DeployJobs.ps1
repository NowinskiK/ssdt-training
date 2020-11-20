function Deploy-SqlJobs
{
    param(
        [Parameter(Mandatory)]
        [System.String]$SqlConnectionString,

        [Parameter(Mandatory)]
        [System.String]$Path
    )

    $Location = "C:\Program Files\Microsoft SQL Server\"
    $file = "Microsoft.SqlServer.Smo.dll"
    Write-Host "Looking for SMO file in location: $Location"
    $files = Get-ChildItem -File -Recurse -Path "$Location" -Filter "$file"
    if (!$files) {
        Write-Error "File $file couldn't be found."
    }

    Write-Host "Registering file $file ..."
    Add-Type -Path $files[0].FullName

    Write-Host "Connecting to SQL Server..."
    $SqlConnection = Connect-SqlConnection -ConnectionString $SqlConnectionString
    Write-Host "Connected."

    Write-Host "Searching XML files in $Path ..."
    $xmlFiles = Get-ChildItem -File -Path "$Path" -Filter "*.xml"
    Write-Host "Files prepared to deploy: $($xmlFiles.Length)"
    $xmlFiles | Foreach-Object {
        Write-Host "Deploying SQL Job from file: $($_.FullName)..."
        $JobManifestXmlFile = $_.FullName

        [xml] $_xml = [xml] (Get-Content -Path $JobManifestXmlFile)
        $x = Get-Xml -XmlFile $_xml
        Set-JobCategory -SqlServer $SqlConnection -root $x
        Set-JobOperator -SqlServer $SqlConnection -root $x
        $sqlAgentJob = Set-Job -SqlServer $SqlConnection -root $x
        Set-JobSchedules -SqlServer $SqlConnection -root $x -job $SqlAgentJob
        Set-JobSteps -SqlServer $SqlConnection -root $x -job $SqlAgentJob 
        Write-Host "Done.`n"
    }

    Disconnect-SqlConnection -SqlDisconnect $SqlConnection
    Write-Host "Disconnected."
}   

Deploy-SqlJobs -SqlConnectionString "data source = .; initial catalog = master; trusted_connection = true;" -Path ".\SQLServer\SQLJobs"

