try {
    New-Item -ItemType Directory -Path "$env:userprofile\.config" -Force -ErrorAction SilentlyContinue | Out-Null

    Invoke-WebRequest `
      -Uri "https://github.com/v8kg/yasb/raw/refs/heads/main/yasb.zip" `
      -OutFile "$env:userprofile\.config\" `
      -ErrorAction SilentlyContinue | Out-Null
} catch {}
