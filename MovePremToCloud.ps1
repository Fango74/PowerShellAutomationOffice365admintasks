# Included in this folder is a sample move.csv
# Best used on an On-Prem Exchange server as allPS modules loaded as standard  



$LiveCred = Get-Credential 
Import-PSSession $Session 
$ONPREMCREDS = Get-Credential
$RemHostName = "Your On-Prem Exchnage Exchange Enviroment"
$TargDom = "Your Office 365 Tenant"
$MB = import-csv c:\temp\move.csv
foreach($ID in $MB)
{$UserID = $ID.UserID 
New-MoveRequest -Identity $UserID -Remote -RemoteHostName $RemHostName  -TargetDeliveryDomain $TargDom -RemoteCredential $ONPREMCREDS -BadItemLimit 100 }
