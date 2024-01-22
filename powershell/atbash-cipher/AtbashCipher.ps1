# Common Constants
Set-Variable -Name Numbers -Value @([char]"0"..[char]"9") -Option Constant
Set-Variable -Name Letters -Value @("a".."z") -Option Constant
Set-Variable -Name GroupLength -Value 5 -Option Constant
Set-Variable -Name GroupJoinChar -Value " " -Option Constant

Function Invoke-Encode() {
    <#
    .SYNOPSIS
    Encode a string using the Atbash cipher.

    .DESCRIPTION
    The Atbash cipher is a simple substitution cipher that relies on transposing all the letters in the 
    alphabet such that the resulting alphabet is backwards. 
    The first letter is replaced with the last letter, the second with the second-last, and so on.

    .PARAMETER Phrase
    The string to encode.

    .EXAMPLE
    Invoke-Encode -Phrase "yes"
    #>
    [CmdletBinding()]
    Param(
        [string]$Phrase
    )

    $LowerPhrase = $Phrase.ToLower()
    $EncodedPhraseNoSpaces = ""

    foreach ($Char in $LowerPhrase.ToCharArray()){
        if ($Char -in $Numbers){
            $EncodedPhraseNoSpaces += $Char
        }
        elseif ($Char -in $Letters){
            $LetterIndex = $Letters.IndexOf($Char)
            $EncodedPhraseNoSpaces += $Letters[$Letters.Length-$LetterIndex-1]
        }
    }

    return $(for ($i = 0; $i -lt $EncodedPhraseNoSpaces.Length; $i+=$GroupLength){
        $EncodedPhraseNoSpaces.Substring($i,
        [Math]::Min($GroupLength,$EncodedPhraseNoSpaces.Length-$i))
    }) -join $GroupJoinChar



}

Function Invoke-Decode(){
    <#
    .SYNOPSIS
    Decode a string using the Atbash cipher.

    .DESCRIPTION
    The Atbash cipher is a simple substitution cipher that relies on transposing all the letters in the 
    alphabet such that the resulting alphabet is backwards. 
    The first letter is replaced with the last letter, the second with the second-last, and so on.

    .PARAMETER Phrase
    The string to decode.

    .EXAMPLE
    Invoke-Decode -Phrase "yes"
    #>
    [CmdletBinding()]
    Param(
        [string]$Phrase
    )

    $PhraseJoined = $Phrase.Replace($GroupJoinChar,"")

    return -Join $(foreach ($Char in $PhraseJoined.ToCharArray()){
        if ($Char -in $Numbers){
            $Char
        }
        elseif ($Char -in $Letters){
            $LetterIndex = $Letters.IndexOf($Char)
            $Letters[$Letters.Length-$LetterIndex-1]
        }
    })

}