function Invoke-IsPrime {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [Int64]$Number   
    )
    
    if ($Number -eq 2) { return $true }
    if ($Number -eq 4) { return $false }
    for ($Candidate = 2; $Candidate -lt $Number/2; $Candidate++){
        if ($Number % $Candidate -eq 0){
            return $false;
        }
    }

    return $true;
}

# Non used but useful so I left it
function Invoke-PrimeNumbers {
    [CmdletBinding()]
    param (
        [Parameter(Position=0)]
        [ValidateScript({$_ -gt 1}, ErrorMessage="'From' value must be greater than 1.")]
        [Int64]$From=2,
        [Parameter(Mandatory, Position=1)]
        [ValidateScript({$_ -gt $From}, ErrorMessage="'To' value must be greater than 'From' value.")]
        [Int64]$To
    )
    
    return ($From..$To) | Where-Object {Invoke-IsPrime $_}
    
}
Function Invoke-PrimeFactors() {
    <#
    .SYNOPSIS
    Calculate the prime factors of a given natural number.

    .DESCRIPTION
    Check if the number is divisible by 2. If it is, divide it by 2 and add 2 to the list of factors.
    If it is not, increment the number by 1 and check if it is divisible by 3. If it is, divide it by 3 and add 3 to the list of factors.

    .PARAMETER Number
    The number to factorize.

    .EXAMPLE
    Invoke-PrimeFactors -Number 12
    #>
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )
    
    [Int64]$Multiple = $Number
    $PrimeFactors = @()

    while ($Multiple -gt 1) {
        if (Invoke-IsPrime $Multiple) {
            $PrimeFactors += $Multiple
            break
        }
        for ($i = 2; $i -le $Multiple/2; $i++){
            if (($Multiple % $i -eq 0) -and (Invoke-IsPrime $i)){
                $Multiple /= $i
                $PrimeFactors += $i
                break
            }
        }
    }

    return $PrimeFactors


}