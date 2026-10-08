Connect-ExchangeOnline
 
$mailboxes = @(
    "user.one@example.com",
    "user.two@example.com"
)
 
$mailboxes | ForEach-Object {
    Write-Host "User: $_"
    Get-MailboxFolderPermission -Identity "$_`:\Calendar"
}