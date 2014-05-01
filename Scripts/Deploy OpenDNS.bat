netsh interface ip set dns "Local Area Connection" static 208.67.222.222
netsh interface ip add dns name="Local Area Connection" addr=208.67.220.220
netsh interface ip set dns "Connectify" static 208.67.222.222
netsh interface ip add dns name="Connectify" addr=208.67.220.220
netsh interface ip set dns "Wireless Network Connection" static 208.67.222.222
netsh interface ip add dns name="Wireless Network Connection" addr=208.67.220.220
pause