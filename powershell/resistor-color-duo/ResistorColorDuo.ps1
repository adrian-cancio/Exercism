Function Get-ColorCodeValue() {
    <#
    .SYNOPSIS
    Translate a list of colors to their corresponding color code values.

    .DESCRIPTION
    Given 2 colors, take the first one and times it by 10 and add the second color to it.

    .PARAMETER Colors
    The colors to translate to their corresponding color codes.

    .EXAMPLE
    Get-ColorCodeValue -Colors @("black", "brown")
    #>
    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )
    
    [string[]]$AllCollors = @( "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white")
    
    $colorCodeValue =  $AllCollors.IndexOf($Colors[0]) * 10 + $AllCollors.IndexOf($Colors[1])

    return $colorCodeValue
}
