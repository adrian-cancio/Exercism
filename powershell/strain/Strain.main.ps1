Import-Module ./Strain.ps1

Function SumOverTen {
    param($row)
    ($row | Measure-Object -Sum).Sum -gt 10
}


$testArray = @(
    @(1, 2, 3),
    @(5, 4, 2),
    @(5, 1, 3),
    @(2, 8, 7),
    @(1, 5, 4),
    @(2, 2, 9),
    @(1, 1, 4)
)

$keep = Invoke-Keep -Data $testArray -Predicate ${function:SumOverTen}
$discard = Invoke-Discard -Data $testArray -Predicate ${function:SumOverTen}

Write-Host "Keep: $keep"
Write-Host "Discard: $discard ($($discard.Length))"
