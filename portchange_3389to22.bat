@echo off
SETLOCAL

echo 正在将远程桌面端口从 3389 修改为 22...

:: 修改注册表中的 RDP 端口号
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 22 /f

:: 防火墙放行新端口
netsh advfirewall firewall add rule name="Remote Desktop - 22" protocol=TCP dir=in localport=22 action=allow

:: 提示用户重启
echo.
echo 端口修改完成，新的远程桌面端口为 22。
echo 请重启计算机以使更改生效。
pause

ENDLOCAL
