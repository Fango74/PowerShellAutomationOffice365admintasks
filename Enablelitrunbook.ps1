$credObject = Get-AzureAutomationPSCredential -Name "YourAutomationAccountHere"
Connect-MsolService -Credential $credObject
Set-ModuleCredential -Cred $credObject -Conn "https://ps.outlook.com/PowerShell-LiveID?PSVersion=5.1.14393.187"
get-mailbox  | where-object {$_.litigationholdenabled -eq $false} | Export-CSV "C:\litenabled.csv"
$litenabled = import-csv c:\litenabled.csv
{ $lit = $litenabled.alias
Set-Mailbox $lit -LitigationHoldEnabled $true -LitigationHoldDuration 1000
}