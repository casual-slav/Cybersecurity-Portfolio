Connect-ExchangeOnline

$groupName = "Distribution Group Name"

# Use display names
$names = @(
    "User One",
    "User Two"
)

foreach ($name in $names) {
    $user = Get-Recipient -Filter "DisplayName -eq '$name'"

    if ($user) {
        try {
            Add-DistributionGroupMember -Identity $groupName -Member $user.PrimarySmtpAddress
            Write-Host "Successfully added $name ($($user.PrimarySmtpAddress)) to $groupName"
        }
        catch {
            Write-Host "Failed to add $name to $groupName"
        }
    } else {
        Write-Host "User with name '$name' not found in Exchange Online"
    }
}