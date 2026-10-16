$configDir = Join-Path $env:USERPROFILE ".config"
$zipPath = Join-Path $configDir "yasb.zip"

try {
    New-Item -ItemType Directory -Path $configDir -Force -ErrorAction Stop | Out-Null

    Invoke-WebRequest `
        -Uri "https://github.com/v8kg/yasb/raw/refs/heads/main/yasb.zip" `
        -OutFile $zipPath `
        -ErrorAction Stop

    if (-not (Test-Path -LiteralPath $zipPath)) {
        throw "Download completed, but the ZIP file was not found at $zipPath"
    }

    Expand-Archive -LiteralPath $zipPath -DestinationPath $configDir -Force -ErrorAction Stop
    Write-Host "Downloaded and extracted to: $configDir"
}
catch {
    Write-Error "Download or extraction failed: $($_.Exception.Message)"
}
