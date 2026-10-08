Connect-ExchangeOnline

# Variables
$Domain = "@company.com"
$Group  = "allstaff@company.com"

# Get all existing members of AllStaff
$GroupMembers = Get-DistributionGroupMember -Identity $Group -ResultSize Unlimited |
                Select-Object -ExpandProperty PrimarySmtpAddress

# Get all mailboxes using the domain
$Mailboxes = Get-ExoMailbox -ResultSize Unlimited -Properties Department,ExtensionAttribute3 |
             Where-Object { $_.PrimarySmtpAddress -like "*$Domain" }

# Compare and return ONLY users NOT in the distribution group
$NotInGroup = foreach ($mb in $Mailboxes) {

# Skip if ExtensionAttribute3 is NS
# if ($mb.ExtensionAttribute3 -eq "NS") { continue }

# Skip if Department is SM
#if ($mb.Department -eq "SM") { continue }
#
#    if ($GroupMembers -notcontains $mb.PrimarySmtpAddress) {
#        [PSCustomObject]@{
#            DisplayName = $mb.DisplayName
#            PrimarySMTP = $mb.PrimarySmtpAddress
#            InAllStaff  = $false
#        }
#    }
#}

# Output as a table
$NotInGroup | Format-Table -AutoSize

# Export the list
$NotInGroup | Export-Csv "C:\Temp\NotInAllStaff.csv" -NoTypeInformation