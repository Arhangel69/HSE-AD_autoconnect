echo 'Start HSE-AD autoconnect'
echo 'Please wait...'

$waitingSetupAttempts = 15
$netIPConfiguration = (Get-NetIPConfiguration)

if ($netIPConfiguration -eq $null)
{
	echo 'Waiting for setup NetIPConfiguration...'
	while (($netIPConfiguration -eq $null) -and ($waitingSetupAttempts -ne 0))
	{
		Start-Sleep -s 1
		$waitingSetupAttempts -= 1
		$netIPConfiguration = (Get-NetIPConfiguration)
	}

	if ($netIPConfiguration -eq $null)
	{
		echo 'Waiting too long'
		Return
	}
}

if ($netIPConfiguration.NetProfile.Name -eq $null)
{
	echo 'Waiting for resolving NetProfile.Name...'
	$waitingSetupAttempts = 15
	while (($netIPConfiguration.NetProfile.Name -eq $null) -and ($waitingSetupAttempts -ne 0))
	{
		Start-Sleep -s 1
		$waitingSetupAttempts -= 1
		$netIPConfiguration = (Get-NetIPConfiguration)
	}

	if ($netIPConfiguration.NetProfile.Name -eq $null)
	{
		echo 'Waiting too long'
		Return
	}
}

if (($netIPConfiguration.NetProfile.Name.contains('HSE-AD')) -and ((Test-NetConnection).PingSucceeded -eq $false))
{
	echo 'Waiting for autoconnect'
	Start-Sleep -Second 2
	if ((Test-NetConnection).PingSucceeded -eq $false)
	{
		echo 'Autoconnect not available. Force connect'
		."C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://wifi.mts.ru/redirect.php
	}
}
