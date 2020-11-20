$module = "salt"
Install-Module -Name "$module" -Scope CurrentUser -Force -AllowClobber

Get-Module "$module" -ListAvailable

Get-Command -Module "$module"

