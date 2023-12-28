function Get-LettersCount {
        [CmdletBinding()]
        param (
            [String]$Word  
        )

        $LettersCount = @{}

        foreach ($Letter in $Word.ToCharArray()){
            $LettersCount["$Letter".ToUpper()]++
        }
        return $LettersCount
}


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

    $LettersCountSubject = Get-LettersCount -Word $Subject
    $Anagrams = @()
    
    foreach ($Candidate in $Candidates){
        $LettersCountCandidate = Get-LettersCount -Word $Candidate
        if ($Subject.ToUpper().GetHashCode() -eq $Candidate.ToUpper().GetHashCode() -or
            $LettersCountSubject.Count -ne $LettersCountCandidate.Count){
            continue
        }
        $IsAnagram = $true
        foreach ($key in $LettersCountSubject.keys){
            if ($LettersCountSubject[$key] -ne $LettersCountCandidate[$key]){
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