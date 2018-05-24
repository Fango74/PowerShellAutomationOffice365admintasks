#Runbook for Azure autonmation to find all users without the Litigation hold flag and enabling it.
#Be careful as i think if you reset it on a mailbox that already has it enabled it my start the hod again loosing all the passed mail
#Please someone confirm the above

$credObject = Get-AzureAutomationPSCredential -Name "YourAutomationAccountHere"
Connect-MsolService -Credential $credObject
Set-ModuleCredential -Cred $credObject -Conn "https://ps.outlook.com/PowerShell-LiveID?PSVersion=5.1.14393.187"
get-mailbox  | where-object {$_.litigationholdenabled -eq $false} | Export-CSV "C:\litenabled.csv"
$litenabled = import-csv c:\litenabled.csv
{ $lit = $litenabled.alias
Set-Mailbox $lit -LitigationHoldEnabled $true -LitigationHoldDuration 1000
}
