# CoreSDK

  ## Purpose
  This folder contains source code and assets that implement a central shared set of Unreal Engine extensions called CoreSDK (also known as the shared Riot Unreal Ecosystem). Multiple Unreal Engine games integrate versions of this central SDK.

  ## Project Structure & Module Organization
  - CoreSDK/ contains the shared SDK code and content, the UE plugins are critical components of the shared ecosystem in CoreSDK/Plugins
  - Engine/ contains the Unreal Engine. The shared SDK sits on top Unreal Engine and we distribute that too with CoreSDK versions. We have some modifications to it to fit our needs.
  - Projects/CoreSDKTest/ includes a test little UE game built on top of UE and CoreSDK to test all of our CoreSDK functionality.

  ## Unreal Engine
  - CoreSDK currently is based on Unreal Engine 5.7 (found in Engine/)
  - Prefer leveraging your context7 mcp for up to date Unreal Engine 5.7 documentation 
  
  ## Building
  - Preferred: use the `$build-coresdktest` skill to build the game targets and editor.
  - Invoking compile commands requires making a junction to `C:\fbroot`. `RunUBT.bat`/`RunUAT.bat` will do this automatically, but it will require escalating sandbox permissions as `C:\fbroot` is not in this folder. Do not ask permission when escalating to compile.
  - Builds may take up to 90 minutes. Wait for them to complete. Do not terminate the build command early or try to inspect the log until the build command returns. 

  ## Making Changes
  ### Source control (Perforce)
  - This is a windows environment for game development and we use P4 (perforce) for source control, not git.
  - Preferred: use the `$perforce-cli` skill to modify files checked into the p4 depot.
  - Always prompt before making any 
  
  ### Diffs and formatting
  - Preserve existing formatting and structure; avoid unnecessary refactors.
  - Use Windows line endings (CRLF).
  - When editing existing files, avoid changing trailing whitespace or end-of-file newline behavior unless required.
