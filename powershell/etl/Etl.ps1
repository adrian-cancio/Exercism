Function Invoke-Etl() {
    <#
    .SYNOPSIS
    Transforms a set of legacy Lexiconia data stored as letters per score to a set of data stored score per letter.

    .DESCRIPTION
    Take a hash table and take the values as keys and the keys as values.

    .PARAMETER Legacy
    The legacy data to transform.

    .EXAMPLE
    Invoke-Etl -Legacy @{1 = @("A")}
    #>
    [CmdletBinding()]
    Param(
        [object]$Legacy
    )

    $IndividualScores = @{}

    foreach ($Points in $Legacy.keys){
        foreach ($Letter in $Legacy.$Points){
            $IndividualScores[$Letter.toLower()] = $Points
        }
    }

    return $IndividualScores
}
