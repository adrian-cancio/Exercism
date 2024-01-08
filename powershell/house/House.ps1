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
        "This is the house",
        "This is the malt",
        "This is the rat",
        "This is the cat",
        "This is the dog",
        "This is the cow with the crumpled horn",
        "This is the maiden all forlorn",
        "This is the man all tattered and torn",
        "This is the priest all shaven and shorn",
        "This is the rooster that crowed in the morn",
        "This is the farmer sowing his corn",
        "This is the horse and the hound and the horn"
    )

    $Modifyers = @(
        "that Jack built",
        "that lay in the house",
        "that ate the malt",
        "that killed the rat",
        "that worried the cat",
        "that tossed the dog",
        "that milked the cow with the crumpled horn"
        "that kissed the maiden all forlorn",
        "that married the man all tattered and torn",
        "that woke the priest all shaven and shorn",
        "that kept the rooster that crowed in the morn",
        "that belonged to the farmer sowing his corn"
    )

    $Sentences=@()
    
    for ($i = $Start-1; $i -lt $End; $i++){
        $Phrase = "$($Subjects[$i]) $($Modifyers[$i..0] -join " ")."
        $Sentences += $Phrase 
    }

    return $Sentences -join "`n"
}
