
$QueryArray = @("SQL Software", "Username", "Password", "Database Name", "Server Type", "Server Port Number")





############################################################################################################################################







$date = (Get-Date -Format 'yyyy-MM-dd HH-mm-ss')
cls
Import-Module (Join-Path $PSScriptRoot "jayNeo.psm1") -Force
$jsonFilePath = Join-Path -Path $PSScriptRoot -ChildPath '.\user.json'
$jsonFileBackupPath = Join-Path -Path $PSScriptRoot -ChildPath '.\user-backup.json'

$flag = $true
if (-not(Test-Path $jsonFilePath -PathType Leaf)) {
    $jsonData = [ordered]@{}
    $Result = $(jayneo $QueryArray)

    $jsonData2 = @{}
    for ($eachEle = 0; $eachEle -lt $Result.Length; $eachEle++) {
        $jsonData2[$($QueryArray[$eachEle])] = $Result[$eachEle]
    }
    $jsonData[$($Result[0])] = @($jsonData2)

    $jsonContent = $jsonData | ConvertTo-Json -Depth 10
    $jsonContent | Set-Content -Path $jsonFilePath
    Set-Content -Path $jsonFileBackupPath -Value "// => `{`"Date`": $date`"`}"
    Add-Content -Path $jsonFileBackupPath -Value (Get-Content -Path $jsonFilePath)
    Start-Sleep -Seconds 3
    $flag = $false
}

if ($args[0] -eq '-config' -and $flag -eq $true) {
    try {
        $jsonContent = Get-Content -Path $jsonFilePath -Raw
        $jsonObject = $jsonContent | ConvertFrom-Json

        $Result = $(jayneo $QueryArray)   
        $jsonData2 = @{}

        for ($eachEle = 0; $eachEle -lt $Result.Length; $eachEle++) {
            $jsonData2[$($QueryArray[$eachEle])] = $Result[$eachEle]
        }

        if ($jsonObject."$($Result[0])") {
            $jsonObject."$($Result[0])" = @($jsonData2)
        }
        else {
            $jsonObject | Add-Member -MemberType NoteProperty -Name "$($Result[0])" -Value @($jsonData2)
        }

        $jsonContent = $jsonObject | ConvertTo-Json -Depth 10
        $jsonContent | Set-Content -Path $jsonFilePath
        Add-Content -Path $jsonFileBackupPath -Value "// => `{`"Date`": $date`"`}"
        Add-Content -Path $jsonFileBackupPath -Value (Get-Content -Path $jsonFilePath)
        Start-Sleep -Seconds 3

    } catch {
        if ((Test-Path $jsonFilePath)) {
            Remove-Item -Path $jsonFilePath -Force
        }
        $errMsg = "Something is wrong happening with you 👀"
        Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg" -ForegroundColor Red
        Write-Host "$(relativePosition $($errMsg.Length))Please run the previous command again 🤏`n" -ForegroundColor Yellow
        return
    }

} elseif ($args[0] -ne $null -and $args[0] -ne "-debug") {
    $errMsg = "Invalied arrgument is passed 😑"
    Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg`n" -f Red
    return
}

try {
    $jsonContent = Get-Content -Path $jsonFilePath -Raw
    $jsonObject = $jsonContent | ConvertFrom-Json

    $lastKey = $jsonObject.PSObject.Properties | Select-Object -Last 1 | ForEach-Object { $_.Name }

    $jsonObject = $jsonObject."$($lastKey)"
    $SQL = $($jsonObject."SQL Software")
    $Username = $($jsonObject.Username)
    $Password = $($jsonObject.Password)
    $DatabaseName = $($jsonObject."Database Name")
    $ServerType = $($jsonObject."Server Type")
    $PORT = $($jsonObject."Server Port Number")

} catch {
    if ((Test-Path $jsonFilePath)) {
        Remove-Item -Path $jsonFilePath -Force
    }
    $errMsg = "Something is wrong happening with you 👀"
    Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg" -ForegroundColor Red
    Write-Host "$(relativePosition $($errMsg.Length))Please run the previous command again 🤏`n" -ForegroundColor Yellow
    return
}


if (($DatabaseName -eq '') -or ($Username -eq '') -or ($Password -eq '') -or ($SQL -eq '')) {
    if ((Test-Path $jsonFilePath)) {
        Remove-Item -Path $jsonFilePath -Force
    }
    $errMsg = "Error: Critical values in 'user.json' file cannot be null 😒"
    Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg" -ForegroundColor Red
    Write-Host "$(relativePosition $($errMsg.Length))Please run the previous command again 🤏`n" -ForegroundColor Yellow
    return
}

if ($ServerType -eq '') {
    $ServerType = "localhost"
}


$sqlFilesFolder = $(jayneo @("Directory Path"))


if ($sqlFilesFolder -eq '') {
    $errMsg = "Directory path cannot be null 😒"
    Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg`n" -f Red
    return
}

$outputFile = "./hello.csv"








############################################################ MySQL ###############################################################



if ($SQL -eq "mysql") {
    if ($PORT -eq '') {
        $PORT = 3306
    } else {
        try {
            $PORT = [int]$PORT
        } catch {
            $errMsg = "Error: You have entered Port Number as string 😅"
            Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg`n" -ForegroundColor Red
            return
        }
        
    }
    $portInUse = Test-NetConnection -ComputerName $ServerType -Port $PORT
    if (-not $portInUse.TcpTestSucceeded) {
        Write-Host "`n`tMySQL server is not running on port $PORT.`n" -ForegroundColor Red
        Write-Host "`tRun Windows PowerShell as Administrator:" -n -ForegroundColor Blue
        Write-Host " net start MySQL80" -ForegroundColor Yellow
        Write-Host "`tOtherwise from NoProfile:" -n -ForegroundColor Blue
        Write-Host " Start-Process powershell -Verb RunAs -ArgumentList 'net start MySQL80'" -ForegroundColor Yellow
        Write-Host "`t[Here, 80 is the version of MySQL. It may be different in your machine]`n" -ForegroundColor Cyan
        return
    }
    # cls
    $console = $Host.UI.RawUI
    Set-Content -Path './user.cnf' -Value "[client]`nhost=$ServerType`nuser=$Username`npassword=$Password`nport=$PORT`n"
    Write-Host
    foreach ($file in Get-ChildItem -Path $sqlFilesFolder -Recurse  -Filter *.sql | Sort-Object ) {
        $SQL_COMMANDS = @"
        source $($file.FullName)
"@
        Add-Content -Path $OutputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"

        $n =  [math]::Floor($($console.BufferSize.Width - $((Get-Item $file).Name.Length) - 2) / 2)
        Add-Content -Path $OutputFile -Value "$(multiplexerChar $n '█') $((Get-Item $file).Name) $(multiplexerChar $n '█')"

        Add-Content -Path $OutputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"
        & mysql --defaults-extra-file=./user.cnf  -e $SQL_COMMANDS -D $DatabaseName >> $outputFile
    }

    if(-not($?)) {
        $FinalResultMsg1 = "SQL command not running successfully 🎻"
        $FinalResultMsg2 = "Are you sure the provided information is correct 🙉"
    }

    Add-Content -Path $OutputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"
    Remove-Item -Path './user.cnf' -Force
} 


############################################################ PostgreSQl #######################################################################

elseif ($SQL -eq "psql") {
    if ($PORT -eq '') {
        $PORT = 3306
    } else {
        try {
            $PORT = [int]$PORT
        } catch {
            $errMsg = "Error: You have entered Port Number as string 😅"
            Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg`n" -ForegroundColor Red
            return
        }
    }
    $portInUse = Test-NetConnection -ComputerName $ServerType -Port $PORT | Out-Null
    if (-not($portInUse.TcpTestSucceeded)) {
        Write-Host "`n`tPostressSQL server is not running on port $PORT.`n" -ForegroundColor Red
        Write-Host "`tRun Windows PowerShell as Administrator:" -n -ForegroundColor Blue
        Write-Host "`tnet start postgresql-x64-16"  -ForegroundColor Yellow
        Write-Host "`tOtherwise from NoProfile:" -n -ForegroundColor Blue
        Write-Host " Start-Process powershell -Verb RunAs -ArgumentList 'net start postgresql-x64-16'" -ForegroundColor Yellow
        Write-Host "`t[Here, x64 is the architecture and 16 is the version of PostgreSQL. It may be different in your machine]`n" -ForegroundColor Cyan
        return
    }
    cls
    foreach ($file in Get-ChildItem -Path $sqlFilesFolder -Filter *.sql) {
        & psql -U $Username -d $DatabaseName -a -f $($file.FullName)
    }
}

############################################################## Other Appqnd #################################################################



































#################################################################################

if ($args[0] -eq '-debug') {
    if ((Test-Path $outputFile)) {
    Remove-Item -Path $outputFile -Force
    }
    return
}


# cls

if ((Test-Path $outputFile)) {
    Get-Content -Path $outputFile | ForEach-Object {
        if ($_ -like '*█*'){
            Write-Host "$_" -ForegroundColor Blue
        } else {
            Write-Host "`t$_" -ForegroundColor Yellow
        }
    }
    Remove-Item -Path $outputFile -Force
}

Write-Host "`n`t$(relativePosition $($FinalResultMsg1.Length))$FinalResultMsg1" -f Red
Write-Host "`t$(relativePosition $($FinalResultMsg2.Length))$FinalResultMsg2`n" -f Yellow

# code by jay-neo