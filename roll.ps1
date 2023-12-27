param (
    [Alias("S", "Side", "Sides")]
    [int]$x = 20,
    [Alias("A", "Advantage")]
    [switch]$withAdvantage,
    [Alias("D", "Disadvantage")]
    [switch]$withDisadvantage
)

if ($x -le 1) {
    Start-Sleep 3
    Write-Host "Error: " -NoNewline -ForegroundColor Red
    Write-Host "Invalid side count."
    Start-Sleep 1
    return
}

if ($withAdvantage -and $withDisadvantage) {
    Start-Sleep 3
    Write-Host "Error: " -NoNewline -ForegroundColor Red
    Write-Host "Advantage and disadvantage are mutually exclusive."
    Start-Sleep 1
    return
}

$suspense = {
    Write-Host "." -NoNewline; Start-Sleep 1
    Write-Host "." -NoNewline; Start-Sleep 1
    Write-Host "."
}

do {
    $reroll = "N"
    if ($withAdvantage) {
        Write-Host "Rolling" -NoNewline
        Write-Host " 2d$x" -NoNewline -ForegroundColor Yellow
        Write-Host " with" -NoNewline
        Write-Host " advantage" -NoNewline -ForegroundColor Green
        & $suspense
        $DA = 1..$x | Get-Random
        $DB = 1..$x | Get-Random
        Start-Sleep 0.1; Write-Host "Roll 1: $DA"
        Start-Sleep 0.4; Write-Host "Roll 2: $DB"
        Start-Sleep 0.4; Write-Host "Result: " -NoNewline
        Write-Host "$([Math]::Max($DA, $DB))" -ForegroundColor Cyan
    }

    elseif ($withDisadvantage) {
        Write-Host "Rolling" -NoNewline
        Write-Host " 2d$x" -NoNewline -ForegroundColor Yellow
        Write-Host " with" -NoNewline
        Write-Host " disadvantage" -NoNewline -ForegroundColor Red
        & $suspense
        $DA = 1..$x | Get-Random
        $DB = 1..$x | Get-Random
        Start-Sleep 0.1; Write-Host "Roll 1: $DA"
        Start-Sleep 0.4; Write-Host "Roll 2: $DB"
        Start-Sleep 0.4; Write-Host "Result: " -NoNewline
        Write-Host "$([Math]::Min($DA, $DB))" -ForegroundColor Cyan
    }

    else {
        Write-Host "Rolling" -NoNewline
        Write-Host " 1d$x" -NoNewline -ForegroundColor Yellow
        & $suspense
        Start-Sleep 0.1; Write-Host "Result: " -NoNewline
        Write-Host "$(1..$x | Get-Random)" -ForegroundColor Cyan
    }

    Start-Sleep 0.75
    $reroll = Read-Host "Reroll? (y/N)"
} while ($reroll -in "Y", "Yes")