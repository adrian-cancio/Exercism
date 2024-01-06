Function Invoke-ArmstrongNumbers() {
    <#
    .SYNOPSIS
    Determine if a number is an Armstrong number.

    .DESCRIPTION
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.

    .PARAMETER Number
    The number to check.

    .EXAMPLE
    Invoke-ArmstrongNumbers -Number 12
    #>
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )

    if ($Number -eq 0){
        return $true
    }

    [int]$Digits = [Math]::Ceiling([Math]::Log10($Number))
    $Ref = $Number
    $Sum = 0

    while ($Ref -gt 0) {
        $Sum += [int][Math]::Pow($Ref%10,$Digits)
        $Ref = [Math]::Floor($Ref/10)
    }

    return ($Number -eq $Sum)
}