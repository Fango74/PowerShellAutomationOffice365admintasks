$credObject = Get-AzureAutomationPSCredential -Name "YourAutomationAccountHere"
Connect-MsolService -Credential $credObject
Get-MsolUser -All -UsageLocation "UK" -UnlicensedUsersOnly | Set-MsolUserLicense -AddLicenses "litwareinc:ENTERPRISEPACK"