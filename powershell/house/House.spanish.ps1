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
        "casa" = "Jack construyó"
        "cerveza" = "estaba en"
        "rata" = "bebió"
        "gata" = "mató"
        "perra" = "preocupo"
        "vaca con el cuerno arrugado" = "sacudió"
        "doncella desamparada" ="ordeñó"
        "mujer andrajoso y desgarrado" = "besó"
        "sacerdotisa todo afeitado y rapado" = "casó"
        "gallina que cantaba por la mañana" = "despertó"
        "labradora que sembraba su maíz" = "guardaba"
        "yegua y el sabueso y el cuerno" = "pertenecían"
    }

    $Subjects = $SubjectActions.Keys

    $Sentences=@()
    
    for ($i = $Start-1; $i -lt $End; $i++){
        $Phrase = "Esto es $($(
            for ($j = $i; $j -ge 0; $j--){
                $Modyfier = $SubjectActions[$Subjects[$j]]
                "$($Subjects[$j]) que $($Modyfier)"
            }) -join " a la ")."
        $Sentences += $Phrase 
    }

    return $Sentences -join "`n"
}