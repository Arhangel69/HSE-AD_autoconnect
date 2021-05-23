echo 'Start HSE-AD autoconnect'
if (((Get-NetIPConfiguration).NetProfile.Name.contains('HSE-AD')) -and ((Test-NetConnection).PingSucceeded -eq $false))
{
	echo 'Waiting for autoconnect'
	Start-Sleep -Second 2
	if ((Test-NetConnection).PingSucceeded -eq $false)
	{
		echo 'Autoconnect not available. Force connect'
		."<path-to-chrome.exe>" https://wifi.mts.ru/redirect.php
	}
}
