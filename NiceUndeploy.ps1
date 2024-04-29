### Accept the maintenance token as a string argument ex. "e2226d2b2xxx5ab3xxx0b2cabac801af1xxx1abbccd2xxx3f24b622e6c1f1..."
$tokenMaint = $args[0]

Set-Location $env:appdata
New-Item -Name "NiceUndeploy" -ItemType "directory"
Set-Location .\NiceUndeploy\
$ProgressPreference = 'SilentlyContinue'
write "Downloading the removal tool dependency."
Invoke-WebRequest "https://github.com/ImpressiveDay/Undeploy/raw/main/CsUninstallTool.exe" -OutFile "CsUninstallTool.exe"
write "Finished download dependency. Awaiting next logic steps."
.\CsUninstallTool.exe "MAINTENANCE_TOKEN=$tokenMaint" /quiet
write "Received $tokenMaint loud and clear, attempting to start the uninstaller."
write "The process can take some time, relax."
