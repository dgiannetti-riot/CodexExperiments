@echo off

copy /Y "config.toml" "%USERPROFILE%\.codex\config.toml"
copy /Y "coresdk_dev-ue5\AGENTS.md" "T:\coresdk\dev-ue5\AGENTS.md"
call "coresdk_dev-ue5\build-coresdktest\install_skill.bat"
call "perforce-cli\install_skill.bat"
