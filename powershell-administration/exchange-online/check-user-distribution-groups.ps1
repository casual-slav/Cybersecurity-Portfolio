Connect-ExchangeOnline

Get-DistributionGroupMember -Identity "Company All Staff" |

ForEach-Object {
        Get-EXORecipient -Identity $_.ExternalDirectoryObjectId -ErrorAction SilentlyContinue
 } | Select-Object DisplayName | Format-Table -AutoSize