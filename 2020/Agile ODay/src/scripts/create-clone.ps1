$machineName = "glvsqldemos"
$serverUrl = "http://$($machineName):14145"
$imageName = "StackOverflow2010_Image02"
$cloneName = "StackOverflow2010-Clone01"

Connect-SqlClone -ServerUrl $serverUrl

$CloneToDelete = Get-SqlClone -Name $cloneName
if ($CloneToDelete)
{
    Remove-SqlClone -Clone $CloneToDelete | Wait-SqlCloneOperation
}

$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName $machineName
$image = Get-SqlCloneImage -Name $imageName
$image | New-SqlClone -Name $cloneName -Location $sqlServerInstance | Wait-SqlCloneOperation