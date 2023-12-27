Function Invoke-RnaTranscription() {
    <#
    .SYNOPSIS
    Transcribe a DNA strand into RNA.

    .DESCRIPTION
    Given a DNA strand, return its RNA complement (per RNA transcription).

    .PARAMETER Strand
    The DNA strand to transcribe.

    .EXAMPLE
    Invoke-RnaTranscription -Strand "A"
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )
    
    $RNAStrand = ""

    $Transcriptions = @{
        'G'='C'
        'C'='G'
        'T'='A'
        'A'='U'
    }

    foreach ($Nucleotide in $Strand.ToCharArray()){
        $RNAStrand += $Transcriptions["$Nucleotide"]
    }

    return $RNAStrand

}
