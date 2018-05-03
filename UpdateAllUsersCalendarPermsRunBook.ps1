#Must add the ExchangeModule to Azure from the Gallery to run exchange commands in the cloud
#This example allows all your users to see each others calenders without having to send request

$credObject = Get-AzureAutomationPSCredential -Name "YourAutomationCredentials"
Connect-MsolService -Credential $credObject
Set-ModuleCredential -Cred $credObject -Conn "https://ps.outlook.com/PowerShell-LiveID?PSVersion=5.1.14393.187"
foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox -ResultSize unlimited)
{ $cal = $user.alias+":Calendar"
Set-MailboxFolderPermission -Identity $cal -User Default -AccessRights Reviewer
}
