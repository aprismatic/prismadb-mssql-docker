if ($env:APPVEYOR -eq $true) { Switch-DockerWindows }
else { & $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchWindowsEngine }

docker build -t aprismatic/mssql-server-windows-developer-fulltext:latest `
             -f "Dockerfile-win-ltsc2019" .

if ($env:APPVEYOR -eq $true) { Switch-DockerLinux }
else { & $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchLinuxEngine }

docker build -t aprismatic/mssql-server-linux-fulltext:latest `
             -f "Dockerfile-ubuntu-16.04"  .

if ($LastExitCode -ne 0) { $host.SetShouldExit($LastExitCode) }