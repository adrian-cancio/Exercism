Function Get-ResistorLabel() {
    <#
    .SYNOPSIS
    Implement a function to get the label of a resistor from its color-coded bands.

    .DESCRIPTION
    Given an array of 1, 4 or 5 colors from a resistor, decode their resistance values and return a string represent the resistor's label.

    .PARAMETER Colors
    The array represent the colors from left to right.

    .EXAMPLE
    Get-ResistorLabel -Colors @("red", "black", "green", "red")
    Return: "2 megaohms ±2%"

    Get-ResistorLabel -Colors @("blue", "blue", "blue", "blue", "blue")
    Return: "666 megaohms ±0.25%"
     #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )
    

    [string[]]$AllCollors = @( "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white")


    $Tolerances = @{
        "grey"   = 0.05
        "violet" = 0.1
        "blue"   = 0.25
        "green"  = 0.5
        "brown"  = 1
        "red"    = 2
        "gold"   = 5
        "silver" = 10
    }
    
    $resistance = ""
    $tolerance  = ""

    switch ($Colors.Count) {
        1 {
            $resistance = $AllCollors.IndexOf($Colors[0])
        }
        4 {
            $resistance = ($AllCollors.IndexOf($Colors[0]) * 10 + $AllCollors.IndexOf($Colors[1])) * [math]::Pow(10, $AllCollors.IndexOf($Colors[2]))
            $tolerance  = " ±"+$Tolerances[$Colors[3]]+"%"
        }
        5 {
            $resistance = ($AllCollors.IndexOf($Colors[0]) * 100 + $AllCollors.IndexOf($Colors[1]) * 10 + $AllCollors.IndexOf($Colors[2])) * [math]::Pow(10, $AllCollors.IndexOf($Colors[3]))
            $tolerance  = " ±"+$Tolerances[$Colors[4]]+"%"
        }
    }

    if ($resistance -gt 1000000) {
        $resistance = $resistance / 1000000
        $resistance = "$resistance megaohms"
    }
    elseif ($resistance -gt 1000) {
        $resistance = $resistance / 1000
        $resistance = "$resistance kiloohms" 
    }
    else {
        $resistance = "$resistance ohms"
    }

    return $resistance+$tolerance
}

