write-host -ForegroundColor Green "****************************************connect user***********************************************"


    write-host -ForegroundColor Cyan "Loading now..."

    # Specify the domain to filter by
    foreach ($targetDomain in Get-Content "./isp.txt") {
        try {
            $matchingUsers = Get-Content "./alldata.txt" | Where-Object {$_ -like "*$targetDomain*"}

            if ($matchingUsers.Count -gt 0) {
                $usersInfo = $matchingUsers -join "`r"
                $fileName = "$targetDomain"+".txt"
                $usersInfo | Out-File -Append -FilePath $fileName
                write-host -ForegroundColor Green "Domain '$targetDomain' successfully exported."
            } else {
                write-host -ForegroundColor Yellow "No users found for domain '$targetDomain'."
            }
        }
        catch {
            write-host -ForegroundColor Red "Error exporting for domain '$targetDomain': $_"
        }
    }


write-host -ForegroundColor DarkBlue "**************************************************done export user details***********************************************"
