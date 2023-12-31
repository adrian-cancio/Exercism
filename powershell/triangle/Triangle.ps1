enum Triangle {
    EQUILATERAL
    ISOSCELES
    SCALENE
}

Function Get-Triangle() {
    <#
    .SYNOPSIS
    Determine if a triangle is equilateral, isosceles, or scalene.

    .DESCRIPTION
    Given 3 sides of a triangle, return the type of that triangle if it is a valid triangle.
    
    .PARAMETER Sides
    The lengths of a triangle's sides.

    .EXAMPLE
    Get-Triangle -Sides @(1,2,3)
    Return: [Triangle]::SCALENE
    #>
    
    [CmdletBinding()]
    Param (
        [double[]]$Sides
    )

    if( $Sides[0] -le 0 -or
        $Sides[1] -le 0 -or
        $Sides[2] -le 0
    ){
        Throw "All side lengths must be positive."
    }

    if ($Sides[0] + $Sides[1] -lt $Sides[2] -or
        $Sides[0] + $Sides[2] -lt $Sides[1] -or
        $Sides[1] + $Sides[2] -lt $Sides[0]
    ){
        Throw "Side lengths violate triangle inequality."
    }

    $SameLength = 0;

    if($Sides[0] -eq $Sides[1]){
        $SameLength++
    }
    if($Sides[0] -eq $Sides[2]){
        $SameLength++
    }
    if($Sides[1] -eq $Sides[2]){
        $SameLength++
    }

    switch ($SameLength) {
        3 { return [Triangle]::EQUILATERAL }
        1 { return [Triangle]::ISOSCELES }
        Default { return [Triangle]::SCALENE }
    }

}