Connect-ExchangeOnline

# Define the mailbox and the list of users
$mailbox = "mailbox.one@example.com"

$users = @(
"user.one@example.com",
"user.two@example.com"
)
 
# Loop through each user and assign permissions
foreach ($user in $users) {
    # Add "Read and Manage" (Full Access) permission
    Add-MailboxPermission -Identity $mailbox -User $user -AccessRights FullAccess -InheritanceType All
    # Add "Send As" permission
    Add-RecipientPermission -Identity $mailbox -Trustee $user -AccessRights SendAs
}
 
Write-Host "Permissions have been successfully assigned to the specified users for $mailbox."