$machineName = "glvsqldemos"
$serverUrl = "http://$($machineName):14145"
$cloneName = "StackOverflow2010-Clone01"

Connect-SqlClone -ServerUrl $serverUrl

$CloneToDelete = Get-SqlClone -Name $cloneName
if ($CloneToDelete)
{
    Remove-SqlClone -Clone $CloneToDelete | Wait-SqlCloneOperation
}