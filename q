try {
    $configDir = Join-Path $env:USERPROFILE ".config"
    $zipPath = Join-Path $configDir "yasb.zip"

    New-Item -ItemType Directory -Path $configDir -Force -ErrorAction SilentlyContinue | Out-Null

    Invoke-WebRequest `
      -Uri "https://github.com/v8kg/yasb/raw/refs/heads/main/yasb.zip" `
      -OutFile $zipPath `
      -ErrorAction SilentlyContinue

    Expand-Archive -Path $zipPath -DestinationPath $configDir -Force -ErrorAction SilentlyContinue
} catch {}
