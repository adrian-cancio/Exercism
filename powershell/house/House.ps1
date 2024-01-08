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
    
    $SubjectActions = [Ordered]@{
        "house" = "Jack built"
        "malt" = "lay in"
        "rat" = "ate"
        "cat" = "killed"
        "dog" = "worried"
        "cow with the crumpled horn" = "tossed"
        "maiden all forlorn" ="milked"
        "man all tattered and torn" = "kissed"
        "priest all shaven and shorn" = "married"
        "rooster that crowed in the morn" = "woke"
        "farmer sowing his corn" = "kept"
        "horse and the hound and the horn" = "belonged to"
    }

    $Subjects = $SubjectActions.Keys

    $Sentences=@()
    
    for ($i = $Start-1; $i -lt $End; $i++){
        $Phrase = "This is the $($(
            for ($j = $i; $j -ge 0; $j--){
                $Modyfier = $SubjectActions[$Subjects[$j]]
                "$($Subjects[$j]) that $($Modyfier)"
            }) -join " the ")."
        $Sentences += $Phrase 
    }

    return $Sentences -join "`n"
}
