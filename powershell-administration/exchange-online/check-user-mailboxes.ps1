Connect-ExchangeOnline

$User = "user.one@company.com"

Get-Mailbox -RecipientTypeDetails SharedMailbox | Where-Object {
    Get-MailboxPermission $_.Identity | Where-Object {
        $_.User -like $User -and $_.AccessRights -contains "FullAccess"
    }
}
