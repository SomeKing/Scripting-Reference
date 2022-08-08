#Runs a speed test using Ookla's CLI Tool and will log the results
New-Item -ItemType Directory -Path "C:\SpeedTest"
Invoke-Webrequest -Uri "https://install.speedtest.net/app/cli/ookla-speedtest-1.1.1-win64.zip" -OutFile "C:\SpeedTest\speedtest.zip"
Expand-Archive -Path "C:\SpeedTest\speedtest.zip" -DestinationPath "C:\SpeedTest"
& "C:\SpeedTest\speedtest.exe" --accept-license
Remove-Item -Path C:\SpeedTest -Force -Recurse