function neoDesign {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [int]$i
    )
    $color = switch ($i % 5) {
        0 { 'Blue' }
        1 { 'Magenta' }
        2 { 'Cyan' }
        3 { 'Red' }
        4 { 'Yellow' }
        5 { 'Green' }
    }
    return $color
}

function multiplexerChar {
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [int]$n,
        [Parameter(Mandatory=$false, Position=1)]
        [string]$str
    )
    return $str * $n
}

function relativePosition {
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [int]$mainContent
    )
    $console = $Host.UI.RawUI
    $n = $console.BufferSize.Width - $mainContent
    $n = [math]::Floor($n / 2)
    $s = " " * $n
    return $s
}

function jayneo {
    param (
        [string[]]$QueryArray
    )
    if ($QueryArray.Length -lt 1) {
        return
    }

    $Result = @()
    $neoPicture = @()


    for ($eachQuery = 0; $eachQuery -lt $QueryArray.Length; $eachQuery++) {
        cls
        for ($eachEle = 0; $eachEle -lt $Result.Length; $eachEle++) {
            if ($eachEle -eq 0) {
                Write-Host "`n`n"
            }
            Write-Host "$(relativePosition $($Result[$eachEle].Length))" -n
            Write-Host "$($QueryArray[$eachEle])"  -n -ForegroundColor $(neoDesign $eachEle)
            Write-Host " ▶ "  -n -ForegroundColor $(neoDesign $eachEle)
            if ($($Result[$eachEle]) -is [System.Security.SecureString]) {
                $asterisks = '*' * $($Result[$eachEle]).Length
                Write-Host "$asterisks`n" -n -ForegroundColor $(neoDesign $($eachEle + 3))
            } else {
                Write-Host "$($Result[$eachEle])`n" -n -ForegroundColor $(neoDesign $($eachEle + 3))
            }     
        }
        if ($eachQuery -eq 0) {
            Write-Host "`n`n"
        }
        Write-Host "$(relativePosition $($QueryArray[$eachQuery].Length))" -n
        Write-Host "$($QueryArray[$eachQuery]) ▶ " -n -ForegroundColor $(neoDesign $eachQuery)
        if ($($QueryArray[$eachQuery]) -like "*password*" -or $($QueryArray[$eachQuery]) -like "*Password*" -or $($QueryArray[$eachQuery]) -like "*PASSWORD*") {
            $tempInput = Read-Host -AsSecureString
        } else {
            $tempInput = Read-Host
        }
        $Result += $tempInput
        $neoPicture += "$($QueryArray[$eachQuery]) ▶ $tempInput"
    }



    $baseN = $($neoPicture[0].Length)
    foreach ($outputString in $neoPicture) {
        if ($outputString.Length -gt  $baseN) {
            $baseN = $outputString.Length
        }
    }
    
    $baseN += 8
    cls
    
    Write-Host "`n`n`n$(relativePosition $baseN)" -n
    Write-Host $(multiplexerChar $baseN "▃") -ForegroundColor $(neoDesign $eachEle)

    for ($eachEle = 0; $eachEle -lt $Result.Length; $eachEle++) {
        $temp = $($QueryArray[$eachEle]).Length + 3 + $($Result[$eachEle]).Length
        Write-Host "$(relativePosition $baseN)" -n
        $spaceCount = [math]::Floor($($baseN - $temp) / 2)
        $spaceCount = [Math]::Max($spaceCount, 0)

        Write-Host "█ " -n -ForegroundColor $(neoDesign $($eachEle + 1))
        Write-Host $(multiplexerChar $spaceCount " ") -n
        Write-Host "$($QueryArray[$eachEle])" -n -ForegroundColor $(neoDesign $($eachEle + 1))
        Write-Host " ▶ " -n -ForegroundColor $(neoDesign $($eachEle + 2))
        if ($Result[$eachEle] -is [System.Security.SecureString]) {
            $asterisks = '*' * $($Result[$eachEle]).Length
            Write-Host "$asterisks" -n -ForegroundColor $(neoDesign $($eachEle + 3))
            $Result[$eachEle] = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($($Result[$eachEle])))
        } else {
            Write-Host "$($Result[$eachEle])" -n -ForegroundColor $(neoDesign $($eachEle + 3))
        } 

        $spaceCount += $temp
        while ($spaceCount -lt $($baseN - 4)) {
            Write-Host " " -n
            $spaceCount++
        }
        if ($eachEle -eq 0) {
            Write-Host " █╗" -ForegroundColor $(neoDesign $($eachEle + 3))
        } else {
            Write-Host " █║" -ForegroundColor $(neoDesign $($eachEle + 3))
        }
        
        if ($eachEle -ne $($Result.Length - 1)) {
            Write-Host "$(relativePosition $baseN)" -n
            Write-Host "█$(multiplexerChar $($baseN - 2) "═")█║" -ForegroundColor $(neoDesign $($eachEle + 5))
        }
    }

    Write-Host "$(relativePosition $baseN)" -n
    Write-Host "$(multiplexerChar $baseN "█")║" -ForegroundColor $(neoDesign $($eachEle + 7))
    Write-Host "$(relativePosition $baseN)" -n
    Write-Host "╚$(multiplexerChar $($baseN - 1) "═")╝" -n -ForegroundColor $(neoDesign $($eachEle + 10))
    Write-Host "`tby "-n -ForegroundColor $(neoDesign $($eachEle + 11))
    Write-Host "jay-neo`n" -ForegroundColor $(neoDesign $($eachEle + 11))

    return $Result
}
