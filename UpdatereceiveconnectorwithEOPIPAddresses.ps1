$FormatEnumerationLimit =-1
$O365Cred = Get-Credential YourTenantAdmin@tenant.onmicrosoft.com
$O365Session = New-PSSession –ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $O365Cred -Authentication Basic -AllowRedirection
Import-PSSession $O365Session
$ip = Get-HybridMailflowDatacenterIPs
Get-ReceiveConnector "Receive Connector Name" | Set-ReceiveConnector -RemoteIPRanges $ip.datacenterips