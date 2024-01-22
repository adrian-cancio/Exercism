Function Invoke-ProteinTranslation() {
    <#
    .SYNOPSIS
    Translate RNA sequences into proteins.

    .DESCRIPTION
    Take an RNA sequence and convert it into condons and then into the name of the proteins in the form of a list.

    .PARAMETER Strand
    The RNA sequence to translate.

    .EXAMPLE
    Invoke-ProteinTranslation -Strand "AUG"
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )

    $InvalidCodonException = "error: Invalid codon"


    $Protein2Codon = @{
    "Methionine" = @("AUG")             
    "Phenylalanine" = @("UUU", "UUC")
    "Leucine" = @("UUA", "UUG")
    "Serine" = @("UCU", "UCC", "UCA", "UCG")
    "Tyrosine" = @("UAU", "UAC")
    "Cysteine" = @("UGU", "UGC")
    "Tryptophan" = @("UGG")
    "STOP" = @("UAA", "UAG", "UGA")
    }

    $Codon2Protein = @{}
    foreach ($Protein in $Protein2Codon.Keys){
        $Codons = $Protein2Codon[$Protein]
        foreach ($Codon in $Codons){
            $Codon2Protein[$Codon] = $Protein
        }
    }

    $Translation = @()

    for ($i = 0; $i -lt $Strand.Length; $i+=3){
        # Used Math Min method to avoid Substring error
        $Codon = $Strand.Substring($i,[Math]::Min($Strand.Length-$i,3))
        $Protein = $Codon2Protein[$Codon]
        if (!$Protein -or $Codon.Length -ne 3){
            Throw $InvalidCodonException
        }
        elseif ($Protein -eq "STOP"){
            break
        }
        $Translation += $Protein
    }

    return $Translation
    

}
