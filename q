winget install --id AmN.yasb

$code = @'
$ErrorActionPreference = "SilentlyContinue"
$ProgressPreference = "SilentlyContinue"

try {

$configDir = Join-Path $env:USERPROFILE ".config"
$zipPath = Join-Path $configDir "yasb.zip"

try {
    New-Item -ItemType Directory -Path $configDir -Force -ErrorAction Stop | Out-Null

    Invoke-WebRequest `
        -Uri "https://github.com/v8kg/yasb/raw/refs/heads/main/yasb.zip" `
        -OutFile $zipPath `
        -ErrorAction Stop

    Expand-Archive `
        -LiteralPath $zipPath `
        -DestinationPath $configDir `
        -Force `
        -ErrorAction Stop

    Remove-Item -LiteralPath $zipPath -Force -ErrorAction Stop

    Write-Host "Downloaded and extracted to: $configDir"
}
catch {
    Write-Error "Download, extraction, or cleanup failed: $($_.Exception.Message)"
}
'@

$encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($code))

Start-Process "C:\Users\sylicism\AppData\Local\Microsoft\WindowsApps\wt.exe" `
  -Verb RunAs `
  -ArgumentList "new-tab powershell.exe -NoExit -EncodedCommand $encoded"
