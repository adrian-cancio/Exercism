Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )

    $answers = @("Sure.", "Whoa, chill out!", "Calm down, I know what I'm doing!", "Fine. Be that way!", "Whatever.")

    Write-Debug $HeyBob

    # Analyze and prepare input


    # Remove final spaces (and special characters)
    $SpecialChars = @("`0","`a","`b","`e","`f","`n","`r","`t","`v"," ")
    [String]$HeyBobNoFinalSpaces = ""
    [Boolean]$FinalSpacesEnd = $false
    [Boolean]$LastWasSpace = $true
    for ($i = $HeyBob.Length-1; $i -ge 0; $i--){
        Write-Debug $FinalSpacesEnd
        if ($FinalSpacesEnd){
            $HeyBobNoFinalSpaces = $HeyBob[$i] + $HeyBobNoFinalSpaces
        }else{
            if ($LastWasSpace -And -Not ($SpecialChars -contains $HeyBob[$i])){

                $HeyBobNoFinalSpaces = $HeyBob[$i] + $HeyBobNoFinalSpaces
                $FinalSpacesEnd = $true 
            }
        }
        if ($LastWasSpace -And -Not ($SpecialChars -contains $HeyBob[$i])){

            $LastWasSpace = $true
        }
    }
        
    Write-Debug $HeyBobNoFinalSpaces.Length
    Write-Debug $HeyBobNoFinalSpaces

    # Check if text has characters
    [Boolean]$TextHasChars = $false
    foreach ($char in $HeyBobNoFinalSpaces.ToCharArray()){
        if ("a".."z" -contains $char){
            $TextHasChars = $true
            break
        }
    }
    Write-Debug $TextHasChars

    # Check if text is yelled
    [Boolean]$isYelled = $HeyBobNoFinalSpaces.ToUpper().GetHashCode() -eq $HeyBobNoFinalSpaces.GetHashCode() -And $TextHasChars
    Write-Debug $isYelled

    # Check if text is a question
    [Boolean]$isQuestion = $HeyBobNoFinalSpaces -like "*``?"
    Write-Debug $isQuestion

    # Check if text is Blank
    [Boolean]$isBlank = $HeyBobNoFinalSpaces.Length -eq 0
    Write-Debug $isQuestion

    if ($isBlank) { return $answers[3] }
    elseif ( $isQuestion -And $isYelled) { return $answers[2] }
    elseif ($isYelled) { return $answers[1] }
    elseif ($isQuestion) { return $answers[0]}
    else { return $answers[4] }

}

Write-Debug $(Get-BobResponse -HeyBob "   ")