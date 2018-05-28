#Send a message to allusesr that they are in the migration batch for tonights move to O365
#This is per DB but "get-mailbox -Organizationunit" maybe be better andjust move the users you want in/out of it before/after migration

$Boxes = Get-Mailbox -Database "YOURDBNAME"
Foreach ($Box in $Boxes){Send-MailMessage -Subject "Migration of Mailbox" -Body "Hello, your mailbox will be migrated to the new Exchange server this evening, please remember to shut down your system tonight"
 -From "admin@yourdomain.com" -To $Box.PrimarySmtpAddress -SmtpServer "Exchangeserver.yourdomain.com"}