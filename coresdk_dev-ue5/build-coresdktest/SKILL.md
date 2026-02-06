---
name: build-coresdktest
description: Build and validate the CoreSDKTest Unreal Engine game (UE 5.7) to ensure Engine/CoreSDK/test game changes do not break compile or cook. Use when asked to compile the CoreSDKTest editor, compile the CoreSDKTest client (Test config), run a full BuildCookRun, or verify build health after code changes.
---

# Build CoreSDKTest

## Overview

Build and validate CoreSDKTest editor/client targets and full cook to catch compile-time or cook-time regressions after Engine/CoreSDK/test changes.

## Workflow

1) Decide the requested build
- **Editor compile**: CoreSDKTestEditor Win64 Development
- **Client compile**: CoreSDKTest Win64 Test
- **Full build + cook**: BuildCookRunWithAutoMultiProcessCook (Client Test, Win64)

2) Always run from repo root
- Working directory: `T:\p4\coresdk\dev-ue5`

3) Always log to `codex\logs`
- Ensure directory exists:
  - `New-Item -ItemType Directory -Force -Path "T:\p4\coresdk\dev-ue5\codex\logs" | Out-Null`
- Create a timestamp and log name that includes target/config/command type:
  - ` $ts = Get-Date -Format "yyyyMMdd-HHmmss"`
  - Example log name: `CoreSDKTest_Editor_Dev_Build_$ts.log`
  - Store under: `T:\p4\coresdk\dev-ue5\codex\logs`
- Pipe all output:
  - Use `2>&1 | Tee-Object -FilePath $logPath`

4) Run the requested command(s)

### Editor compile (CoreSDKTestEditor Win64 Development)
```powershell
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$logPath = "T:\p4\coresdk\dev-ue5\codex\logs\CoreSDKTest_Editor_Dev_Build_$ts.log"
Engine\Build\BatchFiles\Build.bat CoreSDKTestEditor Win64 Development "T:\p4\coresdk\dev-ue5\Projects\CoreSDKTest\CoreSDKTest.uproject" -NoHotReloadFromIDE 2>&1 | Tee-Object -FilePath $logPath
```

### Client compile (CoreSDKTest Win64 Test)
```powershell
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$logPath = "T:\p4\coresdk\dev-ue5\codex\logs\CoreSDKTest_Client_Test_UBT_$ts.log"
RunUBT.bat CoreSDKTest Win64 Test -Project="T:\p4\coresdk\dev-ue5\Projects\CoreSDKTest\CoreSDKTest.uproject" -WaitMutex -architecture=x64 2>&1 | Tee-Object -FilePath $logPath
```

### Full build + cook (Client Test, Win64)
```powershell
$ts = Get-Date -Format "yyyyMMdd-HHmmss"
$logPath = "T:\p4\coresdk\dev-ue5\codex\logs\CoreSDKTest_Client_Test_Cook_$ts.log"
RunUAT.bat BuildCookRunWithAutoMultiProcessCook -Cook -FastCook -Stage -Pak -Compressed -cookincremental -AdditionalCookerOptions="" -Project="Projects/CoreSDKTest/CoreSDKTest.uproject" -NoSubmit -UTF8Output -NoCodeSign -Client -ClientConfig=Test -Platform=Win64 2>&1 | Tee-Object -FilePath $logPath
```

5) Review logs and report results
- Scan for errors/warnings and the final exit status.
- If errors or warnings appear, summarize the most relevant lines and report failure.
- If clean, report success and include the log path used.
