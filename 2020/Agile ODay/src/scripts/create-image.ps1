$machineName = "glvsqldemos"
$serverUrl = "http://$($machineName):14145"
$fileShare = "\\$($machineName)\fileshare"

Connect-SqlClone -ServerUrl $serverUrl
$sqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName $machineName
$imageDestination = Get-SqlCloneImageLocation -Path $fileShare

$imageOperation = New-SqlCloneImage -Name "StackOverflow2010_Image03" -SqlServerInstance $sqlServerInstance -DatabaseName "StackOverflow2010" -Destination $imageDestination

$imageOperation | Wait-SqlCloneOperation