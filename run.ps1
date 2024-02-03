
$QueryArray = @("SQL Software", "Username", "Password", "Database Name", "Server Instance", "Server Port Number")





############################################################################################################################################







$date = (Get-Date -Format 'yyyy-MM-dd HH-mm-ss')
cls
Import-Module (Join-Path $PSScriptRoot "jayNeo.psm1") -Force
$jsonFilePath = Join-Path -Path $PSScriptRoot -ChildPath '.\user.json'
$jsonFileBackupPath = Join-Path -Path $PSScriptRoot -ChildPath '.\user-backup.json'

$flag = $true
if (-not(Test-Path $jsonFilePath -PathType Leaf) -and $args[0] -ne '-nolog') {
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

} elseif ($args[0] -ne $null -and $args[0] -ne "-nolog" -and $args[0] -ne "-it") {
    $errMsg = "Invalied arrgument is passed 😑"
    Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg`n" -f Red
    return
}


if ($args[0] -eq "-nolog") {
    $Result = $(jayneo $QueryArray) 
    $SQL = $Result[0]
    $Username = $Result[1]
    $Password = $Result[2]
    $DatabaseName = $Result[3]
    $ServerInstance = $Result[4]
    $PORT = $Result[5]
} else {
    try {
        $jsonContent = Get-Content -Path $jsonFilePath -Raw
        $jsonObject = $jsonContent | ConvertFrom-Json

        $lastKey = $jsonObject.PSObject.Properties | Select-Object -Last 1 | ForEach-Object { $_.Name }

        $jsonObject = $jsonObject."$($lastKey)"
        $SQL = $($jsonObject."SQL Software")
        $Username = $($jsonObject.Username)
        $Password = $($jsonObject.Password)
        $DatabaseName = $($jsonObject."Database Name")
        $ServerInstance = $($jsonObject."Server Instance")
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

if ($ServerInstance -eq '') {
    $ServerInstance = "localhost"
}


$sqlFilesFolder = $(jayneo @("Directory Path"))

if ($sqlFilesFolder -eq '' -and $args[0] -ne "-it") {
    $errMsg = "Directory path cannot be null 😒"
    Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg`n" -f Red
    return
}

$outputFile = "./hello.txt"








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
    $portInUse = Test-NetConnection -ComputerName $ServerInstance -Port $PORT
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
    $sensitiveFile = "./user.cnf"
    Set-Content -Path $sensitiveFile -Value "[client]`nhost=$ServerInstance`nuser=$Username`npassword=$Password`nport=$PORT`n"


    Write-Host
    foreach ($file in Get-ChildItem -Path $sqlFilesFolder -Recurse  -Filter *.sql | Sort-Object ) {
        $SQL_COMMANDS = @"
        source $($file.FullName)
"@
        Add-Content -Path $outputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"

        $n =  [math]::Floor($($console.BufferSize.Width - $((Get-Item $file).Name.Length) - 2) / 2)
        Add-Content -Path $outputFile -Value "$(multiplexerChar $n '█') $((Get-Item $file).Name) $(multiplexerChar $n '█')"

        Add-Content -Path $outputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"
        & mysql --defaults-extra-file=./user.cnf  -e $SQL_COMMANDS -D $DatabaseName >> $OutputFile
    }

    if(-not($?)) {
        $FinalResult = $true
    }

    Add-Content -Path $outputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"

} 


############################################################ PostgreSQl #######################################################################

elseif ($SQL -eq "psql") {
    if ($PORT -eq '') {
        $PORT = 5432
    } else {
        try {
            $PORT = [int]$PORT
        } catch {
            $errMsg = "Error: You have entered Port Number as string 😅"
            Write-Host "`n$(relativePosition $($errMsg.Length))$errMsg`n" -ForegroundColor Red
            return
        }
    }
    $portInUse = Test-NetConnection -ComputerName $ServerInstance -Port $PORT
    if (-not($portInUse.TcpTestSucceeded)) {
        Write-Host "`n`tPostressSQL server is not running on port $PORT.`n" -ForegroundColor Red
        Write-Host "`tRun Windows PowerShell as Administrator:" -n -ForegroundColor Blue
        Write-Host "`tnet start postgresql-x64-16"  -ForegroundColor Yellow
        Write-Host "`tOtherwise from NoProfile:" -n -ForegroundColor Blue
        Write-Host " Start-Process powershell -Verb RunAs -ArgumentList 'net start postgresql-x64-16'" -ForegroundColor Yellow
        Write-Host "`t[Here, x64 is the architecture and 16 is the version of PostgreSQL. It may be different in your machine]`n" -ForegroundColor Cyan
        return
    }
    $console = $Host.UI.RawUI
    $sensitiveFile = "$env:APPDATA\postgresql\pgpass.conf"
    if (-not(Test-Path "$env:APPDATA\postgresql\" -PathType container)) {
        New-Item -Path "$env:APPDATA\postgresql\" -ItemType Directory -ErrorAction Stop | Out-Null
    }
    Set-Content -Path $sensitiveFile -Value "$ServerInstance`:$PORT`:$DatabaseName`:$Username`:$Password"



    Write-Host
    foreach ($file in Get-ChildItem -Path $sqlFilesFolder -Recurse  -Filter *.sql | Sort-Object ) {
        Add-Content -Path $outputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"

        $n =  [math]::Floor($($console.BufferSize.Width - $((Get-Item $file).Name.Length) - 2) / 2)
        Add-Content -Path $outputFile -Value "$(multiplexerChar $n '█') $((Get-Item $file).Name) $(multiplexerChar $n '█')"

        Add-Content -Path $outputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"
        &  psql -d $DatabaseName -U $Username -f $($file.FullName) >> $outputFile
    }


    if(-not($?)) {
        $FinalResult = $true
    }

    Add-Content -Path $outputFile -Value "$(multiplexerChar $console.BufferSize.Width '█')"
    
}

############################################################## Future Append #################################################################



































#################################################################################


if (($args[0] -ne '-it') -and (Test-Path $sensitiveFile)) {
    Remove-Item -Path $sensitiveFile -Force
}

$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


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

if ($FinalResult -eq $true) {
    $FinalResultMsg1 = "SQL command not running successfully 🎻"
    $FinalResultMsg2 = "Are you sure the provided information or your code is correct 🙉"
    Write-Host "`n`t$(relativePosition $($FinalResultMsg1.Length))$FinalResultMsg1" -f Red
    Write-Host "`t$(relativePosition $($FinalResultMsg2.Length))$FinalResultMsg2`n" -f Yellow
}

############################################## For Interactive ##########################################################


if ($args[0] -eq '-it') {
    Start-Process psql -ArgumentList "-d jay_neo -U neo"
    Start-Sleep 3
    if ((Test-Path $sensitiveFile)) {
        Remove-Item -Path $sensitiveFile -Force
    }
}


# code by jay-neo