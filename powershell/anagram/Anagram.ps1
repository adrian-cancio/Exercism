Function Invoke-Anagram() {
    <#
    .SYNOPSIS
    Determine if a word is an anagram of other words in a list.

    .DESCRIPTION
    An anagram is a word formed by rearranging the letters of another word, e.g., spar, formed from rasp.
    Given a word and a list of possible anagrams, find the anagrams in the list.

    .PARAMETER Subject
    The word to check

    .PARAMETER Candidates
    The list of possible anagrams

    .EXAMPLE
    Invoke-Anagram -Subject "listen" -Candidates @("enlists" "google" "inlets" "banana")
    #>
    [CmdletBinding()]
    Param(
        [string]$Subject,
        [string[]]$Candidates
    )

    [hashtable]$LettersCount = @{}

    foreach ($Letter in $Subject.ToCharArray()){
        $LettersCount[$Letter]++
    }

    $Anagrams = @()

    foreach ($Candidate in $Candidates){
        [hashtable]$LettersCountInCandidate = @{}
        foreach ($Letter in $Candidate.ToCharArray()){
            $LettersCountInCandidate[$Letter]++
        }
        $IsAnagram = $true
        foreach ($Letter in $LettersCount.Keys){
            if ($LettersCountInCandidate[$Letter] -ne $LettersCount[$Letter]){
                $IsAnagram = $false
                break
            }
        }
        if ($IsAnagram){
            $Anagrams += $Candidate
        }
    }

    return $Anagrams
}

Write-Host $(Invoke-Anagram -Subject "allergy" -Candidates @("gallery", "ballerina", "regally", "clergy", "largely", "leading"))
