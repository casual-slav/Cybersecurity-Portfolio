Connect-ExchangeOnline

$UserToRemove = "user.one@company.com"

$SharedMailboxes = @(
"shared.mailbox@company.com"
)

foreach ($Mailbox in $SharedMailboxes) {

    Write-Host "Removing permissions for $UserToRemove from mailbox: $Mailbox"
        
    # Remove Full Access
    Remove-MailboxPermission -Identity $Mailbox -User $UserToRemove -AccessRights FullAccess, SendAs -Confirm:$false
}