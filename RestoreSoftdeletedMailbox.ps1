$LiveCred = Get-Credential
Set-ExecutionPolicy Unrestricted 
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $LiveCred -Authentication Basic -AllowRedirection 
Import-PSSession $Session 
$SourceMailbox = (Get-Mailbox -SoftDeletedMailbox "User Email").ExchangeGuid 
$TargetMailbox = (Get-Mailbox -identity "User email").ExchangeGuid 
New-MailboxRestoreRequest -SourceMailbox $SourceMailbox -TargetMailbox $TargetMailbox  -AllowLegacyDNMismatch -verbose 