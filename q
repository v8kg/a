try {
    $configDir = Join-Path $env:USERPROFILE ".config"
    New-Item -ItemType Directory -Path $configDir -Force -ErrorAction SilentlyContinue | Out-Null

    Invoke-WebRequest `
      -Uri "https://github.com/v8kg/yasb/raw/refs/heads/main/yasb.zip" `
      -OutFile (Join-Path $configDir "yasb.zip") `
      -ErrorAction SilentlyContinue | Out-Null
} catch {}
