Function Invoke-BinarySearch() {
    <#
    .SYNOPSIS
    Perform a binary search on a sorted array.

    .DESCRIPTION
    Take an array of integers and a search value and return the index of the value in the array.

    .PARAMETER Array
    The array to search.

    .PARAMETER Value
    The value to search for.

    .EXAMPLE
    Invoke-BinarySearch -Array @(1, 2, 3, 4, 5) -Value 3
    #>
    [CmdletBinding()]
    Param(
        [Int64[]]$Array,
        [Int64]$Value
    )

    [int]$MinIndex = 0
    [int]$MaxIndex = $Array.Length-1
    [int]$MiddleIndex = ($MaxIndex+$MinIndex)/2


    while ($MiddleIndex -lt $MaxIndex){
        $MiddleValue = $Array[$MiddleIndex]
        if ($Value -eq $MiddleValue){
            return $MiddleIndex
        }
        elseif ($Value -lt $MiddleValue){
            $MaxIndex = $MiddleIndex
        }
        elseif ($Value -gt $MiddleValue){
            $MinIndex = $MiddleIndex
        }
        $MiddleIndex = ($MaxIndex+$MinIndex)/2
    }

    if ($Array[$MinIndex] -eq $Value){
        return $MinIndex
    }
    elseif ($Array[$MaxIndex] -eq $Value){
        return $MaxIndex
    }

    throw "error: value not in array"

}