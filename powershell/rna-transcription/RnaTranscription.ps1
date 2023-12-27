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
    
    
    [char[]]$RNAStrand = $Strand.ToCharArray()

    [hashtable]$Transcriptions = @{
        'G'='C'
        'C'='G'
        'T'='A'
        'A'='U'
    }
    
    if ($RNAStrand.Length -eq 0) {
        return ""
    }

    foreach ($i in 0..($RNAStrand.Length - 1)) {
        $RNAStrand[$i] = $Transcriptions[([string]$RNAStrand[$i]).ToUpper()]
    }

    return -join $RNAStrand
}
