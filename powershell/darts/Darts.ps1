Function Invoke-Darts() {
    <#
    .SYNOPSIS
    Calculate the earned points in a single toss of a Darts game.

    .DESCRIPTION
    Take a coordinate of a point and calculate the distance from the center of the dartboard.
    Then depending on the distance and which concentric circle the point lies in, return the
    number of points earned.

    .PARAMETER X
    The X coordinate of the dart.

    .PARAMETER Y
    The Y coordinate of the dart.

    .EXAMPLE
    Invoke-Darts -X 0 -Y 10
    #>
    [CmdletBinding()]
    Param(
        [Double]$X,
        [Double]$Y
    )
    
    $DistanceFromCenter = [Math]::Sqrt([Math]::Pow($X,2)+[Math]::Pow($Y, 2))

    if ($DistanceFromCenter -gt 10) { return 0 }
    if ($DistanceFromCenter -gt 5) { return 1 }
    if ($DistanceFromCenter -gt 1) { return 5 }
    return 10;
}
