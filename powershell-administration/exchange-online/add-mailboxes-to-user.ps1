Connect-ExchangeOnline

$mailboxes = @(
    "mailbox.one@example.com",
    "mailbox.two@example.com"
)

$mailboxes | ForEach-Object {
    Add-MailboxPermission -Identity $_ -User "user.one@example" -AccessRights FullAccess -InheritanceType All
}

#$mailboxes | ForEach-Object {
#    Add-RecipientPermission -Identity $_ -Trustee "user.one@example" -AccessRights SendAs
#}