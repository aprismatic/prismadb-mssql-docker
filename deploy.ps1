if ($env:APPVEYOR -eq $true) { Switch-DockerWindows }
else { & $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchWindowsEngine }

docker images

docker push aprismatic/mssql-server-windows-developer-fulltext

if ($env:APPVEYOR -eq $true) { Switch-DockerLinux }
else { & $Env:ProgramFiles\Docker\Docker\DockerCli.exe -SwitchLinuxEngine }

docker images

docker push aprismatic/mssql-server-linux-fulltext

if ($LastExitCode -ne 0) { $host.SetShouldExit($LastExitCode) }