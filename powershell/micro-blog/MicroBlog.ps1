Function Invoke-MicroBlog() {
    <#
    .SYNOPSIS
    Implement a function to make micro blog post that only of 5 or less characters.

    .DESCRIPTION
    Given a string, truncate it into a string of maximum 5 characters.

    .PARAMETER Post
    A string object contains Unicode text encoding: alphabets, symbols or even emojis.

    .EXAMPLE
    Invoke-MicroBlog -Post "Lightning"
    Returns: "Light"
    #>
    [CmdletBinding()]
    Param(
        [string]$Post
    )

    $Enumerator = [System.Globalization.StringInfo]::GetTextElementEnumerator($Post)
    $Result = ""
    $Count = 0

    while ($Enumerator.MoveNext() -and $Count -lt 5) {
        $Result += $Enumerator.GetTextElement()
        $Count++
    }

    return $Result

}