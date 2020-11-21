
# src: https://github.com/sabinio/salt


$module = "salt"
Install-Module -Name "$module" -Scope CurrentUser -Force -AllowClobber

Get-Module "$module" -ListAvailable
Import-Module -Name "$module"

Get-Command -Module "$module"

