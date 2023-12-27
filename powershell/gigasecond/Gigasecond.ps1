Function Add-Gigasecond() {
    <#
    .SYNOPSIS
    Add a gigasecond to a date.

    .DESCRIPTION
    Take a moment and add a gigasecond to it.

    .PARAMETER Time
    A datetime object, to which a gigasecond will be added.

    .EXAMPLE
    Add-Gigasecond -Time
    #>
    [CmdletBinding()]
    Param(
        [DateTime]$Time
    )

    [timespan]$Gigasecond = New-TimeSpan  -Seconds ([Math]::Pow(10,9))

    return $Time+$Gigasecond
}
