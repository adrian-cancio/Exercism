Function Get-Rhyme() {
    <#
    .SYNOPSIS
    Recite the nursery rhyme 'This is the House that Jack Built'.

    .DESCRIPTION
    Given the start verse and the end verse, return a string reciting the rhyme from that range.

    .PARAMETER Start
    The start verse.

    .PARAMETER End
    The end verse.

    .EXAMPLE
    Get-Rhyme -Start 1 -End 2
    Return:
    @"
    This is the house that Jack built.
    This is the malt that lay in the house that Jack built.
    "@
     #>
    [CmdletBinding()]
    Param(
        [int]$Start,
        [int]$End
    )
    
    $Subjects = @(
        "house",
        "malt",
        "rat",
        "cat",
        "dog",
        "cow with the crumpled horn",
        "maiden all forlorn",
        "man all tattered and torn",
        "priest all shaven and shorn",
        "rooster that crowed in the morn",
        "farmer sowing his corn",
        "horse and the hound and the horn"
    )

    $Modifyers = @(
        "Jack built",
        "lay in",
        "ate",
        "killed",
        "worried",
        "tossed",
        "milked"
        "kissed",
        "married",
        "woke",
        "kept",
        "belonged to"
    )

    $Sentences=@()
    
    for ($i = $Start-1; $i -lt $End; $i++){
        $Phrase = "This is the $($(
            for ($j = $i; $j -ge 0; $j--){
                "$($Subjects[$j]) that $($Modifyers[$j])"
            }) -join " the ")."
        $Sentences += $Phrase 
    }

    return $Sentences -join "`n"
}
